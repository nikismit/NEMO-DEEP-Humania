// This is the script that talks to the external input methods as well as the automatic input = 

using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using System.IO;
using System.IO.Ports;
using System.Threading;
using UnityEngine.VR;

public class Controller : MonoBehaviour {


    public static Controller _instance;
    
    // the different ways of controlling deep, more to come
    public enum InputMethod { DeepController, AutoBreath, HandDistance, HandHeight};
    public InputMethod currentMethod;

    // this is the main var right here, how full the players lungs are
    public float fullness;

    // the curve for the autoBreath
    public AnimationCurve breathCurve;


    // for calculating breath state
    private float oldFullness = 0f;             // how full were the lungs last frame
    private float fullnesDelta;                 // how much the fullness has changed since last frame
    public int countrer = 0;                    // counter for stepping through the readArray
    public float[] readArray = new float[15];   // array to hold the last 15 fullnessDeltas
    public enum States { breathingIn, breathingOut, holdingBreath };    
    public States breathState = States.holdingBreath;           // is the player breathing in, out or holding their breath
    public States oldBreathingState = States.holdingBreath;     // what was their breathingState lasst frame, used to calculate if there has been a change
    public States breathForCheck = States.breathingIn;
    public float breathBuffer = 0.01f;          // buffer used to see if the player is breathing in or out

    public int numberOfBreaths = 0;             // the number of breaths the player has taken


    delegate void toGetInput();
    toGetInput GetInput;


    // for the controller
    public string portName = "COM10";
    private SerialPort deepController = new SerialPort();
    private bool runThread = false;
    private string contollerValue;



    // events for Breath
    public delegate void breathEvent();
    public event breathEvent onInhaleEvent;
    public event breathEvent onExhaleEvent;

    public GameObject Player;
    public GameObject left;     // the left controller
    public GameObject right;    // the right controller

    //data loggin
    public bool logData = false;
    float localTime;
    private string path;
    DateTime now = DateTime.Now;



    private void Awake()
    {
        if( _instance == null)
            _instance = this;
        else
        {
            Destroy(gameObject);
            return;
        }


        // start taking input from the default
        ActivateInput(currentMethod);

        DontDestroyOnLoad(this);
    }

    

    void Update()
    {
        if (GetInput != null)
        {
            GetInput();
            CalculateBreathState();
        }

        if (Input.GetKeyDown(KeyCode.Alpha1))
            SwitchInput(InputMethod.DeepController);
        else if (Input.GetKeyDown(KeyCode.Alpha2))
            SwitchInput(InputMethod.AutoBreath);
        else if (Input.GetKeyDown(KeyCode.Alpha3))
            SwitchInput(InputMethod.HandDistance);
        else if (Input.GetKeyDown(KeyCode.L))
            beginLogging(true);

        localTime = Time.time;
    }

    void SwitchInput(InputMethod input)
    {
        print("switching methods");
        print("Deactivating " + currentMethod);
        DeactivateInput(currentMethod);
        currentMethod = input;
        print("Activating " + currentMethod);
        ActivateInput(currentMethod);
        print(GetInput);
    }

    void ActivateInput(InputMethod input)
    {
        switch(input)
        {
            case InputMethod.DeepController:
                print("trying to connect to controller");
                ConnectToController();
                
                // this is the problem
                //GetInput = GetInputFromDeepController;

                break;

            case InputMethod.AutoBreath:
                print("switching to auto");
                GetInput = GetInputFromAutoBreath;
                break;

            case InputMethod.HandDistance:
                print("switchign to hand distance");

                if (Player == null)
                    Player = GameObject.FindWithTag("Player");

                if (left == null)
                    left = Player.GetComponentInChildren<SteamVR_ControllerManager>().left;

                if (right == null)
                    right = Player.GetComponentInChildren<SteamVR_ControllerManager>().right;

                GetInput = GetInputFromHandDistance;
                break;

            case InputMethod.HandHeight:
                print("switching to hand height");
                GetInput = GetInputFromHandHeight;
                break;


                
        }
    }

    void CalculateBreathState()
    {
        fullnesDelta = fullness - oldFullness;

        if (fullnesDelta != 0)
        {
            readArray[countrer] = fullnesDelta;
            countrer++;
            if (countrer >= readArray.Length)
                countrer = 0;

            float total = 0;

            foreach (float f in readArray)
                total += f;

            if (total > breathBuffer)
            {
                //player is inhaling
                breathState = States.breathingIn;
                breathForCheck = breathState;
            }
            else if (total < -breathBuffer)
            {
                //player is exhaling
                breathState = States.breathingOut;
                breathForCheck = breathState;
            }
            else
                breathState = States.holdingBreath;


            // here is where we see if the player is moving from Inhaling to Exhaling
            if (breathForCheck != oldBreathingState)
            {
                switch(breathState)
                {
                    case States.breathingIn:
                        OnInhale();
                    break;
                    
                    case States.breathingOut:
                        OnExhale();
                    break;
                }
            }


            oldFullness = fullness;
            oldBreathingState = breathForCheck;
        }
    }

    void OnInhale()
    {
        // The player has switched to inhaling
        // do the inhaleSound
        numberOfBreaths++;
        if(onInhaleEvent != null)
            onInhaleEvent();
    }

    void OnExhale()
    {
        // The player has switched to exhaling
        // do the exhaling sound
        if( onExhaleEvent != null )
            onExhaleEvent();
    }

    void DeactivateInput(InputMethod input)
    {
        switch (input)
        {
            case InputMethod.DeepController:
                GetInput = null;
                print("disconnecting");
                DisconnectFromController();
                break;

            case InputMethod.AutoBreath:

                break;

            case InputMethod.HandDistance:

                break;
        }
    }

    void ConnectToController()
    {
        bool found = false;

        string[] ports = SerialPort.GetPortNames();
        print(ports.Length + " Com ports found");

        if (ports.Length == 0)
        {
            // no controller found
            print("nothign found");
            SwitchInput(InputMethod.AutoBreath);

        }
        else
        {
            foreach (string port in ports)
            {
                try  // try to open a port, if it fails try the next
                {
                    deepController.PortName = port;
                    deepController.DtrEnable = false;
                    deepController.BaudRate = 9600;
                    deepController.Parity = Parity.None;
                    deepController.DataBits = 8;
                    deepController.StopBits = StopBits.One;
                    deepController.Handshake = Handshake.None;
                    deepController.ReadTimeout = 500; // breathing band should respond in 50 msec
                    deepController.WriteTimeout = 50;
                    deepController.NewLine = "\n";
                    deepController.Open();
                    //deepController.DtrEnable = true; // will not receive data without this

                    print(deepController.PortName);

                    print("Trying port: " + port + " ");



                    for (int i = 0; i < 100; i++)
                    {
                        try
                        {
                            string message = deepController.ReadLine();
                            if (message.Length > 0)
                            {
                                print("Message recieved on " + deepController.PortName);
                                print("Controller is on " + portName);

                                // we are good to go create thread for controller
                                found = true;
                            }
                        }
                        catch (TimeoutException) { }
                    }
                }
                catch
                {
                    try
                    {
                        deepController.Close();
                        System.Threading.Thread.Sleep(1000);
                    }
                    catch { }
                    
                    continue; // try next port
                }
                // nothgin found
                

            }

            if (found)
            {
                portName = deepController.PortName;

                print("Controller is detected on " + portName);
                print("is " + deepController.PortName + " open: " + deepController.IsOpen);

                // creat the thread for the controller
                runThread = true;
                Thread threadForController = new Thread(new ThreadStart(ThreadWorker));
                threadForController.Start();
                
                
                GetInput = GetInputFromDeepController;
            }
            else
            {
                print("no controller found");
                SwitchInput(InputMethod.AutoBreath);
            }
        }
    }

  
    void OnDisable()
    {
        if( currentMethod == InputMethod.DeepController )
            DisconnectFromController();
    }

    void DisconnectFromController()
    {
        print("closing " + deepController);
        deepController.Close();
        print("Is deep controlelr open: " + deepController.IsOpen);
        runThread = false;
    }

    void GetInputFromDeepController()
    {
        //print("trying to read the controller");
        fullness = float.Parse(contollerValue) / 1024;
    }

    void GetInputFromAutoBreath()
    {
        
        fullness = breathCurve.Evaluate(Time.time);
    }

    void GetInputFromHandDistance()
    {
        //print(left.transform.position);

        fullness = Vector3.Distance(left.transform.position, right.transform.position);
        //print(Vector3.Distance(left.transform.position, right.transform.position));


    }

    void GetInputFromHandHeight()
    {
        Vector3 midpoint = Vector3.Lerp( UnityEngine.XR.InputTracking.GetLocalPosition(UnityEngine.XR.XRNode.LeftHand), UnityEngine.XR.InputTracking.GetLocalPosition(UnityEngine.XR.XRNode.RightHand), 0.5f);

        fullness = 1 - Vector3.Distance(UnityEngine.XR.InputTracking.GetLocalPosition(UnityEngine.XR.XRNode.Head), midpoint);
    }

    void ThreadWorker()
    {
        while (runThread)
        {
            if (deepController.IsOpen)
            {
                try
                {
                    contollerValue = deepController.ReadLine();

                    // if you want to log data here is where to do it

                    if (logData)
                        File.AppendAllText(path, "time : " + localTime + " -- value : " + contollerValue + System.Environment.NewLine);
                }
                catch (System.Exception) { }
            }
        }
    }

    void OnApplicationQuit()
	{
		deepController.Close();
		runThread = false;
	}

    // stuff for data logging
    public void beginLogging(bool newValue)
    {
        if (logData != newValue)
        {
            print("begin ");
            
            path = @"c:\DataLogs\" + "DataLog" + now.DayOfWeek + now.Hour + now.Minute + now.Second + ".txt";

            FileInfo file = new FileInfo(path);
            file.Directory.Create();

            File.WriteAllText(path, "Begin Log" + System.Environment.NewLine);
            File.AppendAllText(path, "Date and Time : " + now);

            logData = newValue;
        }
    }


}
