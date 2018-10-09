using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class StartGameMenu : MonoBehaviour {

	public List<MonoBehaviour> scriptsToActivate = new List<MonoBehaviour>();
	public List<GameObject> objectsToActicate = new List<GameObject>();

	void Awake()
	{
		foreach( MonoBehaviour mb in scriptsToActivate )
			mb.enabled = false;
	}

}
