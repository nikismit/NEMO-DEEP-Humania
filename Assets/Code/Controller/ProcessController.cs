using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class ProcessController : MonoBehaviour 
{
	

	
	public float newRead = 0;
	private float oldRead = 400f;
	private float deltaRead;
	
	
	public float min = 256;
	public float max = 768;
	public int rateOfContraction = 75;
	public float range = 100;
    public float fullness = 0.5f;
	
	ReadControllerv2 rc;    // where the raw value comes in

    private bool breathingIn = false;
	
	
	// Use this for initialization
	void Start () 
	{
		rc = GetComponent<ReadControllerv2>();
        
		StartCoroutine(contractRange());
	}
	
	// Update is called once per frame
	void Update () 
	{
        

		newRead = rc.ControllerValue;

        
  
    	
			// min, max, contract
			
		if(newRead > max)
			max = newRead;
		else if(  newRead < min)
			min = newRead;

        // calculate fullness
        fullness = (newRead - min) / range;
        Output._instance.fullness = fullness;
        

    }
	
	void BreathingIn()
	{
        if(!breathingIn)
            Output._instance.breathingIn();
        breathingIn = true;
	}
	
	void BreathingOut()
	{
        if(breathingIn)
            Output._instance.breathingOut();
        breathingIn = false;
	}
	
	IEnumerator contractRange()
	{
		while (true)
		{
			yield return new WaitForSeconds(0.25f);
			
			range = max - min;
			max -=range/rateOfContraction;
			min +=range/rateOfContraction;
			
			
		}
	}
}
