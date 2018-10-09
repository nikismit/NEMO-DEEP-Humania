using UnityEngine;
using System.Collections;
using System;
using System.IO.Ports;
using UnityEngine.UI;

public class ContolerStatus : MonoBehaviour {

    [Header("DEEP controller or AutoBreath")]
    public bool useFakeBreath = false;

    [Header("DEEP controller connection status")]
    public bool Connected = false;
    public string portName = "COM10";
    private SerialPort deepController = new SerialPort();

  

    
    

	// this is the first thing called
    // we see if we should use the FakeBreath of the controller
	void Awake () 
    {
        if (useFakeBreath)
        {
            gameObject.GetComponent<FakeBreath>().enabled = true;
            gameObject.GetComponent<Output>().enabled = true;

        }
        else
        {
            LookForController();
        }
	}
	
	public void LookForController () 
    {
        string[] ports = SerialPort.GetPortNames();
        print(ports.Length + " Com ports found");

        if (ports.Length == 0)
        {
            GetComponent<FakeBreath>().enabled = true;
            print("fake breath mode");
        }
        else
        {
            foreach( string port in ports)
            {
                try
                {
                    deepController.PortName = port;
                    
                    deepController.BaudRate = 9600;
                    deepController.Parity = Parity.None;
                    deepController.DataBits = 8;
                    deepController.StopBits = StopBits.One;
                    deepController.Handshake = Handshake.None;
                    deepController.ReadTimeout = 100; // breathing band should respond in 50 msec
                    deepController.WriteTimeout = 50;
                    deepController.NewLine = "\n";
                    deepController.Open();
                    deepController.DtrEnable = true; // will not receive data without this

                    print(deepController.PortName);

                    print("Trying port: " + port + " ");

                    for (int i = 0; i < 5; i++)
                    {
                        string message = deepController.ReadTo("\n");
                        print("found something: " + message);
                        int value = Convert.ToInt32(message);
                        if (value < 0 || value > 1023) continue; // try next port if number not between 0 and 1023
                    }
                    // this must be it
                    try {
                        //deepController.Close();
                        //System.Threading.Thread.Sleep(1000); 
                    } 
                        catch { }

                    //return;
                }
                catch
                {
                    try {
                        deepController.Close();
                        System.Threading.Thread.Sleep(1000);
                    } catch { }
                    continue; // try next port
                }
                // nothgin found


            }

            portName = deepController.PortName;

            print("Controller is detected on " + portName);


            

            Connected = true;

            // check the default port
            //deepController = new SerialPort(portName, 9600);
            //deepController.ReadTimeout = 100;
            // deepController.Open();
            // do final check here
            print("is " + deepController.PortName +" open: "+ deepController.IsOpen);
            deepController.Close();




            gameObject.GetComponent<ReadControllerv2>().PortName = deepController.PortName;
            gameObject.GetComponent<ReadControllerv2>().enabled = true;
            gameObject.GetComponent<ProcessController>().enabled = true;
          

            gameObject.GetComponent<Output>().enabled = true;

        }


	}
}
