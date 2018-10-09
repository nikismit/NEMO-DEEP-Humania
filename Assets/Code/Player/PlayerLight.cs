using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerLight : MonoBehaviour {

    public float lightMin;
    public float lightMax;

    Controller con;

    Light light;

	// Use this for initialization
	void Start () {
        light = GetComponent<Light>();
        con = Controller._instance;
	}
	
	// Update is called once per frame
	void Update () {
        if (con.breathState == Controller.States.breathingOut && light.intensity < lightMax)
            light.intensity += 0.5f * Time.deltaTime;

        if( light.intensity > lightMin)
            light.intensity -= 0.2f * Time.deltaTime;

        
	}
}
