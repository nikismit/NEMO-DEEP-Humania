using UnityEngine;
using System.Collections;
using System.IO.Ports;
using System.Threading;
using System.Collections.Generic;

public class ReadController : MonoBehaviour {

	// this class reads the controlelr input and translates it into somethng usable
	
	//public static ReadController _instance; // static var so other objects can listen
	
	SerialPort arduino = new SerialPort();	// the port for the controlelr
	string messageFromController;			// the output from the controller


	public float oldRead = 0;	// the last frames breath, not currently used
	public float newRead = 0;	// the current frames breath

	public float MaxRead = 10;	// the current maximum range
	public float MinRead = 200;	// the current minimum range

	public float currentBreath;	// the modified breath, a value between 0 and 1 based on the newRead in relation to the Max and Min Read


	private bool runThread = true;

	public float minimumRange = 100f;

	public string ControllerPortName = "/dev/tty.usbmodem1411";

	public float breathDelta;
	public List<float> deltas = new List<float>();
	public float combinedDeltas;

	public int breathState;


	/*
	void Awake()
	{
		// set the class to static
		if( _instance == null )
			_instance = this;
	}
	*/

	void Awake () 
	{

		// create the poet and open it
		arduino = new SerialPort( ControllerPortName, 9600);
	
		arduino.ReadTimeout = 10;
		arduino.Open();


		runThread = true;
		Thread ThreadController = new Thread(new ThreadStart(ThreadWorker));
		ThreadController.Start();

	}

	void Update () 
	{
		//Debug.Log(GetRange());


	

		// store the last frames breath
		oldRead = newRead;

		// read the tenstion from the controller and convert it into an int
		//messageFromController = arduino.ReadLine();
		newRead = float.Parse(messageFromController);

		//////////
		/// sampleing the breath over several frames

		breathDelta = newRead - oldRead;

		deltas.RemoveAt(0);
		deltas.Add(breathDelta);

		combinedDeltas = 0;
		for (int i = 0; i < deltas.Count; i++) 
			combinedDeltas += deltas[i];

		if( combinedDeltas > 5f )
			breathState = 1;
		else if (combinedDeltas < -5 )
			breathState = -1;
		else
			breathState = 0;

		/// end sampeling
		/////////

		// check to see if the breath was out of range, if so, expand the range
		if( newRead > MaxRead )
		{
			StopCoroutine("newMaxRead");
			StartCoroutine("newMaxRead");
		}
		if ( newRead < MinRead )
		{
			StopCoroutine("newMinRead");
			StartCoroutine("newMinRead");
		}
	
		// calculate the current breath to a value between 0 and 1
		currentBreath = calculateBreath();
	}

	void ThreadWorker()
	{
		while (runThread)
		{
			if( arduino.IsOpen)
			{
				try
				{
					messageFromController = arduino.ReadLine();
				}
				catch (System.Exception){}
			//newRead = int.Parse(messageFromController);
			}
		}

	}

	void OnApplicationQuit()
	{
		arduino.Close();
		runThread = false;
	}


	IEnumerator newMaxRead()
	{
		// set the new max read
		MaxRead = newRead;
		// calibreation, if the max has not been increated for a time, lower it
		while( GetRange() > minimumRange )
		{
			yield return new WaitForSeconds(2.4f);
			MaxRead = MaxRead * (0.95f);
		}
	}

	IEnumerator newMinRead()
	{
		//Debug.Log(" calibrating min read");
		// same as above
		MinRead = newRead;
		while( GetRange() > minimumRange )
		{
			yield return new WaitForSeconds(3.1f);
			if( MinRead == 0 )
				MinRead = 100;
			else
				MinRead = MinRead + (GetRange() / 10 );
		}
	}

	float calculateBreath()
	{
		// this is the main thing
		// returns a value between 0 and 1 
		// 0 is an empty player
		// 1 is a full player
		float rawCurBreath = newRead - MinRead;
		float toReturn =  rawCurBreath / ( MaxRead - MinRead);




		if( toReturn == null )
			return 0f;
		else
			return toReturn;
	}

	float GetRange()
	{
		return MaxRead - MinRead;
	}
}
