using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class SwitchSceneAfterTime : MonoBehaviour {


	public float SecondsToSwitch = 120f;
	public string SceneToLoad;


	
	// Update is called once per frame
	void Update () {
		if( Input.GetKeyDown(KeyCode.P))
			SwitchScene();
	}

	void SwitchScene()
	{
		print("time to switch");
		SceneManager.LoadScene(SceneToLoad, LoadSceneMode.Single);
	}
}
