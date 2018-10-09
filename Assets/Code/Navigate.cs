using UnityEngine;
using System.Collections;

public class Navigate : MonoBehaviour {

	public float moveSpeed = 10f;
	public Camera photoCamera;

	// Update is called once per frame
	void Update () 
	{
		transform.Translate( photoCamera.transform.forward * moveSpeed * Time.deltaTime * Input.GetAxis("Vertical") );
		transform.Translate( transform.right * moveSpeed * Time.deltaTime * Input.GetAxis("Horizontal") );
	}
}
