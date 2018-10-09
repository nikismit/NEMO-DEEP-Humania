using UnityEngine;
using System;
using System.IO.Ports;
using System.IO;
using System.Threading;

public class ReadControllerv2 : MonoBehaviour {

    /// <summary>
    /// the job of this class is to get the raw data from the controller
    /// </summary>


	private SerialPort deepController = new SerialPort();
	private string messageFromController;
	public string PortName = "/dev/tty.usbmodem1451";

	private bool runThread = true;
	
	public float ControllerValue;

    public bool logData = false;
    float localTime;
    private string path;

    DateTime now = DateTime.Now;


	// Use this for initialization
	void Start () 
	{
        // connect to the controller
        deepController.PortName = PortName;
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

		// create the thread
		runThread = true;
		Thread ThreadForController = new Thread(new ThreadStart(ThreadWorker));
		ThreadForController.Start();
	}
	
	// Update is called once per frame
	void Update () 
	{
        if (messageFromController != null)
            ControllerValue = float.Parse(messageFromController);

        if (float.IsNaN(ControllerValue))
            Debug.Log("something wrong");
	}
	

	void ThreadWorker()
	{
		while(runThread)
		{
			if(deepController.IsOpen)
			{
				try
				{
					messageFromController = deepController.ReadLine();

                    if (logData)
                    {
                        // DATA LOGGING HERE
                        File.AppendAllText(path, "time :  " + Time.time + " value : " + messageFromController + System.Environment.NewLine);
                        //localTime += Time.time;
                    }
                }
				catch (System.Exception) {}
			}
		}
	}

	
	void OnApplicationQuit()
	{
		deepController.Close();
		runThread = false;
	}

    // stuff for data logging
    // this is called from the commands script
    public void beginLogging(bool newValue)
    {
        if (logData != newValue)
        {
            
            logData = newValue;
            path = @"c:\DataLogs\" + "DataLog" + now.DayOfWeek + now.Hour + now.Minute + now.Second + ".txt";

            FileInfo file = new FileInfo(path);
            file.Directory.Create();

            File.WriteAllText(path, "Begin Log" + System.Environment.NewLine);
            File.AppendAllText(path, "Date and Time : " + now);
        }
    }

}
