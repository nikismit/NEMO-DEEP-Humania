using UnityEngine;
using System.Collections;

public class curve : MonoBehaviour {


    public AnimationCurve myCurve;

	public AnimationCurve shittyCurve;





    public Transform target;

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
        Vector3 pos = target.position;
		pos.y = shittyCurve.Evaluate(Time.time);
        target.position = pos;
	
	}
}
