// this script controlles the player and their locomotion

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMovement : MonoBehaviour {

	//TODO: Add stop and start commands
	//TODO: Add head nod detection

	public float defaultForwardSpeed = 0.2f;
	public bool onTheGround = true;
	public float defaultGravity = -6.5f;
	public float upForce = 8.5f;
	public float gravThresh = 0.6f;

    public float exhaleBooster = 3f;


    public float superSampling = 1f;
	
	private float currentSpeed;
	public float currentGrav;
	private Camera cam;
	private Rigidbody rb;
	private RaycastHit hit;
	private float distanceToGround = 2f;



	// Use this for initialization
	void Start () {
		cam = Camera.main;
		rb = GetComponent<Rigidbody>();
		currentSpeed = defaultForwardSpeed;
		currentGrav = defaultGravity;


        // this is dangerous!!!!!
        SteamVR_Camera.sceneResolutionScale = superSampling;
	}
	
	// Update is called once per frame

	void Update()
	{
		if( Input.GetKeyDown(KeyCode.UpArrow))
			Burst(cam.transform.forward, 100f);
	}

	void FixedUpdate() 
	{
        if (Controller._instance.breathState == Controller.States.breathingOut)
            currentSpeed = defaultForwardSpeed * exhaleBooster;
        else
            currentSpeed = defaultForwardSpeed;

        // check to see if you are close to the ground
        // this is for forward movment
        if (Physics.Raycast(transform.position, - transform.up, out hit, distanceToGround))
		{
			if (hit.distance > 0.05f)
			{
				float slowSpeed = Mathf.Lerp( 0.05f, currentSpeed, hit.distance / distanceToGround);

				rb.AddForce(cam.transform.forward * slowSpeed, ForceMode.VelocityChange);
			}
			else
			{
				onTheGround = true;
			}
		}
		else
		{
			onTheGround = false;
			rb.AddForce(cam.transform.forward * currentSpeed, ForceMode.VelocityChange);
		}

		// this is for up and down movment

		if( Controller._instance.fullness > gravThresh)
			currentGrav = 0f;
		else if ( Controller._instance.fullness > gravThresh - 0.1)
			currentGrav = Mathf.Lerp(0, defaultGravity, (gravThresh - Controller._instance.fullness) * 5 );
		else
			currentGrav = defaultGravity;

		//gravity
		rb.AddForce(transform.up * currentGrav, ForceMode.Impulse);
		

		if( Controller._instance.breathState == Controller.States.breathingIn)
			rb.AddForce(transform.up * upForce);
		

	}


	void Burst( Vector3 direction, float force)
	{
		rb.AddForce(direction * force, ForceMode.Impulse);
	}
}
