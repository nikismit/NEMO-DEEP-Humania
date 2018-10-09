using UnityEngine;
using System;
using System.IO.Ports;

public class FindController : MonoBehaviour {

    public SerialPort serialPort = new SerialPort();
	
	void Start()
    {
        print("Found Port: " + findController());
    }

    string findController()
    {
        foreach (string port in SerialPort.GetPortNames())
        {
            try
            {
                serialPort.PortName = port;
                serialPort.BaudRate = 9600;
                serialPort.Parity = Parity.None;
                serialPort.DataBits = 8;
                serialPort.StopBits = StopBits.One;
                serialPort.Handshake = Handshake.None;
                serialPort.ReadTimeout = 100; // breathing band should respond in 50 msec
                serialPort.WriteTimeout = 50;
                serialPort.NewLine = "\n";
                serialPort.Open();
                serialPort.DtrEnable = true; // will not receive data without this

                print("Trying port: " + port + " ");

                for (int i = 0; i < 5; i++)
                {
                    string message = serialPort.ReadTo("\n");
                    print(message);
                    int value = Convert.ToInt32(message);
                    if (value < 0 || value > 1023) continue; // try next port if number not between 0 and 1023
                }
                // this must be it
                try { serialPort.Close(); System.Threading.Thread.Sleep(1000); } catch { }
                return port;
            }
            catch
            {
                try { serialPort.Close(); System.Threading.Thread.Sleep(1000); } catch { }
                continue; // try next port
            }
        }
        return "Not Found";
    }
}

