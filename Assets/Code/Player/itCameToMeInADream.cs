using UnityEngine;
using System.Collections;

public class itCameToMeInADream : MonoBehaviour {

    

    public float grav = -5f;        // this is the default gravity for the player
    public float upForce = 0.01f;   // this is the force the player will be moved up by
    public float gravThresh = 0.6f; // above this value gravity will not be applied

    private Rigidbody rb;           // ref to the players rigidbody

    private float dynamicGrav = 0f; // this is the actual gravity that will be applied, it is modified by the player


    private float startGrav;
    private float startUp;
    private float startGravThresh;

    private bool moving = true;

    // this stuff is so the menu can easily acces the variables

    public float gravMenu
    { 
        get { return grav; }
        set { grav = value; }
    }

    public float upForceMenu
    {
        get { return upForce; }
        set { upForce = value;  }
    }

    public float gravThreshMenu
    {
        get { return gravThresh; }
        set { gravThresh = value; }
    }

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

    void Start () 
    {   
        // connect to the ProcessController and the rigidbody
        rb = GetComponent<Rigidbody>();

        startGrav = grav;
        startUp = upForce;
        startGravThresh = gravThresh;
	}


    /*void OnEnable()
    {
        Arch._instance.OnStopPressed += Stop;
        Arch._instance.OnPlayPressed += Go;
    }

    void OnDisable()
    {
        Arch._instance.OnStopPressed -= Stop;
        Arch._instance.OnPlayPressed -= Go;
    }
    */
    void FixedUpdate()
    {
        // this is a number between 0 and 1 that represents the players current lung fullness
        // 0 = empty
        // 1 = full 
        // the min and max are always changing and being calibrated
        float fullness = Output._instance.fullness;

        // if the player 

        if (fullness > gravThresh)
            dynamicGrav = 0f;
        else
            dynamicGrav = grav;

        // do grav
        rb.AddForce(transform.up * dynamicGrav , ForceMode.Force);

        if (Output._instance.breathState == Output.States.breathingIn)
        {
            rb.AddForce(transform.up * upForce);
        }
    }

    void Stop()
    {
        if (moving)
        {
            startUp = upForce;
            startGravThresh = gravThresh;
            startGrav = grav;

            moving = false;

            upForce = 0f;
            gravThresh = 1.1f;
            grav = -30f;
        }
        else
        {
            moving = true;

            upForce = startUp;
            gravThresh = startGravThresh;
            grav = startGrav;
        }

    }

    void Go()
    {
        upForce = startUp;
        gravThresh = startGravThresh;
    }
}
