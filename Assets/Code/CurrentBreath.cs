using UnityEngine;
using System.Collections;

public class CurrentBreath : MonoBehaviour 
{
	// ok this is some fancy business

	// everything reads the breath from here.
	// this script taks that value form a variety of sources.

	// a list of the scouces
	public enum BreathSoruce { DeepController, XBoxController, Keyboard };
	// the current source being used
	public BreathSoruce currentSource = BreathSoruce.DeepController;


	// this delegate reads the value from the current source
	delegate float TheCurrentBreathReading();
	TheCurrentBreathReading _currentBreath;

	// singleton thing
	public static CurrentBreath _instance;

	// these are the scripts that can be read breath varibles from
	public ReadController rc;
	public BreathFromKeyboard key;

	// this is the value that os optput from the scrips
	public float currentBreath;

	public enum BreathState { inhale, exhale, holding }
	public BreathState currentBreathState = BreathState.holding;

	public int breahState;


	void Awake()
	{
		// set the class to static
		if( _instance == null )
			_instance = this;

		Setup();
	}


	void Setup()
	{
		// set the delegate to read the  breath fromt he right scource
		switch (currentSource)
		{
		
		case BreathSoruce.DeepController:
			_currentBreath = readFromDeepController;
			key.enabled = false;
			break;

		case BreathSoruce.XBoxController:

			break;

		case BreathSoruce.Keyboard:
			_currentBreath = readFromKeybaord;
			rc.enabled = false;

			break;
		}
	}

	void Update()
	{
		// read the current breath fromt the desired source
		currentBreath = _currentBreath();

		if( currentSource == BreathSoruce.DeepController )
			breahState = rc.breathState;

	}


	// sources
	float readFromDeepController()
	{
		return rc.currentBreath;
	}

	float readFromXboxCOnreoller()
	{
		return 0f;
	}

	float readFromKeybaord()
	{
		return key.currentBreath;
	}


}
