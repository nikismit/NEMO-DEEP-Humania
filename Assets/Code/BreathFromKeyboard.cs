using UnityEngine;
using System.Collections;

public class BreathFromKeyboard : MonoBehaviour {


	public float currentBreath = 0f;
	public float breathSpeed = 0.5f;
	
	// Update is called once per frame
	void Update () {

		if( Input.GetKey( KeyCode.Space ) )
		{
			if( currentBreath < 1f)
				currentBreath += Time.deltaTime * breathSpeed;
		}
		else
		{
			if( currentBreath > 0 )
				currentBreath -= Time.deltaTime * breathSpeed;
		}
	
	}
}
