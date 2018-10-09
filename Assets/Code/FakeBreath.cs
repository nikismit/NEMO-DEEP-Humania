using UnityEngine;
using System.Collections;

public class FakeBreath : MonoBehaviour {

    public AnimationCurve curve;

	// Update is called once per frame
	void Update ()
    {
        Output._instance.fullness = curve.Evaluate(Time.time);
	}
}
