using UnityEngine;
using System.Collections;

public class LerpWithBreath : MonoBehaviour {

    public Vector3 LerpTo;
    private Vector3 LerpFrom;

	void Start ()
    {
        LerpFrom = transform.localPosition;
	}
	
	void Update ()
    {
        transform.localPosition = Vector3.Lerp(LerpFrom, LerpTo, Output._instance.fullness);
	}
}
