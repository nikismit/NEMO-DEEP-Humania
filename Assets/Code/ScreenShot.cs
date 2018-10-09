using UnityEngine;
using System.Collections;

public class ScreenShot : MonoBehaviour {

	void Update() 
	{
		//Debug.Log("Working");
		if( Input.GetKeyDown(KeyCode.Q))
		{
			ScreenCapture.CaptureScreenshot("Assets/ScreenShots/Screenshot_" + Time.time + ".png",4);
			Debug.Log("Click!");
		}
	}

}
