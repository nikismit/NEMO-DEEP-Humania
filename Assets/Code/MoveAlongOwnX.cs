using UnityEngine;
using System.Collections;

public class MoveAlongOwnX : MonoBehaviour {


	public float Speed = 1f;

	void FixedUpdate()
	{
		GetComponent<Rigidbody>().AddForce(transform.right * Speed * Input.GetAxis("Vertical") * Time.deltaTime, ForceMode.VelocityChange);
	}
}
