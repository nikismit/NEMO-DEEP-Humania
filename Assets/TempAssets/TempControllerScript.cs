using UnityEngine;
using System.Collections;

/*
TEMPORARY SCRIPT FOR CREATING A SIMPLE TESTCONTROLLER. ATTACHED AS A COMPONENT TO MAIN CAMERA, 
AND USES THE CHARACTER CONTROLLER THAT IS ALSO A COMPONENT OF THAT MAIN CAMERA
*/

[RequireComponent(typeof(CharacterController))]

public class TempControllerScript : MonoBehaviour {

	public float moveSpeed;
	public float rotationSpeed;
	CharacterController tempCharacter;

	// Use this for initialization
	void Start () {
		tempCharacter = GetComponent<CharacterController> ();
	}
	
	// Update is called once per frame
	void Update () {

		Vector3 forward = Input.GetAxis("Vertical") * transform.TransformDirection(Vector3.forward) * moveSpeed;
		transform.Rotate (new Vector3 (0, Input.GetAxis("Horizontal") * rotationSpeed *Time.deltaTime, 0));

		tempCharacter.SimpleMove (Physics.gravity);
		tempCharacter.Move(forward * Time.deltaTime);
	}
}
