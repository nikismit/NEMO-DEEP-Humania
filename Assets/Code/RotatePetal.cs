
using UnityEngine;
using System.Collections;

public class RotatePetal : MonoBehaviour {

	public Transform from;
	public Transform to;




	public AnimationCurve breathCurve;




	void Update() 
	{
		transform.rotation = Quaternion.Lerp(from.rotation, to.rotation, Output._instance.fullness);
	}
}
