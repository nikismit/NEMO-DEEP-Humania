using UnityEngine;
using System.Collections;

public class TempArrowController : MonoBehaviour {


	public float moveSpeed;
	public float rotationSpeed;

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
		Vector3 forward = Input.GetAxis("Vertical") * transform.TransformDirection(Vector3.forward) * moveSpeed * Time.deltaTime;
		this.transform.localPosition += forward;

	}
}
