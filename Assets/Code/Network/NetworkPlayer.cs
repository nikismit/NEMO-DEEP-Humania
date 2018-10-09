using UnityEngine;
using UnityEngine.Networking;
using System.Collections;

public class NetworkPlayer : NetworkBehaviour
{

    public Camera cam;
    public RigidbodyFirstPersonController rbfpc;
    public LandEvent le;
    public MoveForward mf;
    public itCameToMeInADream thing;

	// Use this for initialization
	void Awake ()
    {
        if (isLocalPlayer)
        {
            cam.enabled = true;
            
        }

	}

    void Start()
    {

    
        if (isLocalPlayer)
        {

            GetComponentInChildren<Camera>().enabled = true;
            rbfpc.enabled = true;
            le.enabled = true;
            mf.enabled = true;
            thing.enabled = true;
        }
    }
	
	
}
