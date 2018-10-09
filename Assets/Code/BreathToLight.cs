using UnityEngine;
using System.Collections;

public class BreathToLight : MonoBehaviour 
{
	

	public float minLighting = 1f;
	public float maxLighting = 8f;

	public Light light; 

	private float dif;

	void Start()
	{
		light = GetComponent<Light>();
		dif = maxLighting - minLighting;
	}

	// Update is called once per frame
	void Update () 
	{
        // undo this
		//light.intensity = minLighting + (dif * CurrentBreath._instance.currentBreath);
	}
}
