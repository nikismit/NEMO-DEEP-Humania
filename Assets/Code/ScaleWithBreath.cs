using UnityEngine;
using System.Collections;

public class ScaleWithBreath : MonoBehaviour {

	public float minScale;
	public float maxScale;
    public float smoothness = 4f; // the lower this is, the more it will smooth
    	

	private Vector3 startingScale;

    private float oldRead = 0.2f;
	private float smoothRead = 0.5f;
    private float dif = 0f;
    private float raw = 0f;




	void Start()
	{
		startingScale = transform.localScale;
        oldRead = 0.1f;

	}

    
	void LateUpdate () 
	{
        
            raw = Controller._instance.fullness;
            dif = raw - oldRead;

            smoothRead = oldRead + (dif * smoothness * Time.deltaTime);


            transform.localScale = (startingScale * maxScale * smoothRead) + (startingScale * minScale);


            if (smoothRead > 0)
                oldRead = smoothRead;
            else
                oldRead = raw;

        
	}
}
