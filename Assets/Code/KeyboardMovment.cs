using UnityEngine;
using System.Collections;

public class KeyboardMovment : MonoBehaviour {

    public Camera theCamera;


    public float moveSpeed = 100f;

    string axisH = "Horizontal";
    string axisV = "Vertical";
    Rigidbody rb;
    Vector3 moveVec;
    Vector3 strafeVec;

	// Use this for initialization
	void Start () 
    {
        if (theCamera == null)
            theCamera = Camera.main;

        rb = GetComponent<Rigidbody>();
	
	}
	
	// Update is called once per frame
	void FixedUpdate () 
    {
        if (Input.GetAxis(axisV)  != 0f)
        {
            moveVec = theCamera.transform.forward;
            moveVec.y = 0;
            moveVec.Normalize();


            rb.AddForce(Input.GetAxis(axisV) * moveVec * moveSpeed * Time.deltaTime, ForceMode.VelocityChange);
        }

        if (Input.GetAxis(axisH) != 0f)
        {
            strafeVec = theCamera.transform.right;
            strafeVec.y = 0;
            strafeVec.Normalize();


            rb.AddForce(Input.GetAxis(axisH) * strafeVec * (moveSpeed * 0.7f) * Time.deltaTime, ForceMode.VelocityChange);
        }



	
	}
}
