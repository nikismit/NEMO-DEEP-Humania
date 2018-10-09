using UnityEngine;
using System.Collections;

public class MoveForward : MonoBehaviour 
{
    public Camera cam;

    RigidbodyFirstPersonController rbfps;
    Rigidbody rb;

    Ray ray;
    RaycastHit hit;

    public float dist = 2f;
    public float speed = 0.2f;
    public bool ground;

    private bool moving = true;


    // for menu
    public float speedMenu
    {
        get { return speed;  }
        set { speed = value; }
    }


    public float closeToGround = 3f;

    private float startSpeed;
	
    
    void OnEnable()
    {
        Commands.FullStop += Stop;
        DetectNods.OnNod += Stop;

    }

    void OnDisable()
    {
        Commands.FullStop -= Stop;
        DetectNods.OnNod -= Stop;
    }
    
    void Start()
    {
        if (cam == null)
            cam = GetComponentInChildren<Camera>();
        rb = GetComponent<Rigidbody>();

        startSpeed = speed;
    }

    // TODO: this nees to have some variance, not a hard boundry


	// Update is called once per frame
	void FixedUpdate () 
    {
        if (Physics.Raycast(transform.position, -transform.up, out hit, closeToGround))
        {
            if (hit.distance > 0.1f)
            {
                float slowSpoeed = Mathf.Lerp(0.1f, speed, hit.distance / closeToGround);
                //Debug.Log("d :" + hit.distance);
                //Debug.Log("s :" +slowSpoeed);
                rb.AddForce(cam.transform.forward * slowSpoeed, ForceMode.VelocityChange);
            }
            else
                ground = true;

            //Debug.Log(hit.distance);
        }
        else
        {
            ground = false;
            rb.AddForce( cam.transform.forward * speed, ForceMode.VelocityChange );

            //Debug.Log("trying to move");
        }
	}


    void Stop()
    {
        if (moving)
        {
            startSpeed = speed;
            speed = 0;
            moving = false;
        }
        else
        {
            speed = startSpeed;
            moving = true;
        }
    }

    void Go()
    {
        speed = startSpeed;
    }
}
