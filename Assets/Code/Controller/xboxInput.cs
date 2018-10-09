using UnityEngine;
using System.Collections.Generic;

public class xboxInput : MonoBehaviour {

    float lt;
    float rt;

    public float averagedRead;

   

    private int samples = 15;
    public List<float> reads = new List<float>();

    private float oldRead;
    private float newRead;
    private float deltaRead;


	
	// Update is called once per frame
	void Update ()
    {
        lt = Input.GetAxis("LeftTrigger");
        rt = Input.GetAxis("RightTrigger");

        averagedRead = (lt + rt) / 2;
        Debug.Log(averagedRead);
        Output._instance.fullness = averagedRead;

        deltaRead = averagedRead - oldRead;

        reads.Add(deltaRead);
        if (reads.Count > samples)
            reads.RemoveAt(0);

        float totalDelta = 0f;

        foreach (float f in reads)
            totalDelta += f;

        if (totalDelta > 0.1f)
            Output._instance.breathingIn();
        else if (totalDelta < -0.1f)
            Output._instance.breathingOut();

        

        oldRead = averagedRead;
	}
}
