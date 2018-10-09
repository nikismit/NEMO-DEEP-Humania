using UnityEngine;
using System.Collections;
using System.IO.Ports;
using UnityEngine.UI;



public class Calibration : MonoBehaviour {

    SerialPort arduino = new SerialPort();
    public string messageFromController;
    public string PortName = "COM4";

    public UnityEngine.UI.Text contollerTension;
    public Text minText;
    public Text maxText;
    public Text rangeText;

    public RectTransform slider;

    public float tension;
    public float min = 1024.0f;
    public float max = 0.0f;
    public float range;

    private string initialText1;
    private string initialText2;
    private string initialText3;
    private string initialText4;

	// Use this for initialization
	void Start () 
    {
        arduino = new SerialPort(PortName, 9600);
        arduino.ReadTimeout = 100;
        arduino.Open();

        initialText1 = contollerTension.text;
        initialText2 = minText.text;
        initialText3 = maxText.text;
        initialText4 = rangeText.text;
	}
	
	// Update is called once per frame
	void Update () 
    {
        messageFromController = arduino.ReadLine();

        tension = float.Parse(messageFromController);

        if (tension < min)
            min = tension;
        if (tension > max)
            max = tension;

        range = max - min;

        contollerTension.text = initialText1 + " " + messageFromController;
        minText.text = initialText2 + " " + min;
        maxText.text = initialText3 + " " + max;
        rangeText.text = initialText4 + " " + range;

        
        
        RectOffset offset;
        //offset.top = 100;



        if (Input.GetKeyDown(KeyCode.R))
        {
            min = 1024;
            max = 0;
        }
	}
}
