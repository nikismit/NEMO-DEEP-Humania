using UnityEngine;
using System.Collections;

public class MoveAbout : MonoBehaviour {

	public float Speed = 1f;
	public float turn = 1f;

	public ForceMode theMode;

	
	void Update()
	{
		transform.Rotate(transform.forward * turn * -Input.GetAxis("Horizontal") * Time.deltaTime);

		//transform.Translate(transform.up * Speed * Input.GetAxis("Vertical") * Time.deltaTime);


	}

	void FixedUpdate()
	{
		GetComponent<Rigidbody>().AddForce(transform.up * Speed * Input.GetAxis("Vertical") * Time.deltaTime, ForceMode.VelocityChange);
	}

	// Update is called once per frame

}
