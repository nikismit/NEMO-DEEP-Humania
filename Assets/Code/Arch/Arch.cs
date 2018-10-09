using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class Arch : MonoBehaviour {


    public static Arch _instance;

    public delegate void ButtonAction();
    public event ButtonAction OnStopPressed;
    public event ButtonAction OnPlayPressed;

	// Use this for initialization
	void Awake () {
        if (_instance == null)
            _instance = this;
        else
            Destroy(gameObject);

	}
	
	
    public void Stop()
    {
        if (OnStopPressed != null)
            OnStopPressed();
    }

    public void Play()
    {
        if (OnPlayPressed != null)
            OnPlayPressed();
    }



}
