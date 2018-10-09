using UnityEngine;
using System.Collections;
using UnityEngine.VR;

public class ResetPlayer : MonoBehaviour {

    private Vector3 startPos;
    private Quaternion startRot;


    //public Transform spawn1;
    //public Transform spawn2;
    //public Transform spawn3;

	// Use this for initialization
	void Start ()
    {
        startPos = transform.position;
        startRot = transform.rotation;

        //spawn1 = GameObject.Find("Spawn1").transform;
        //spawn2 = GameObject.Find("Spawn2").transform;
        //spawn3 = GameObject.Find("Spawn3").transform;
    }
	

   public  void Reset()
    {
        transform.position = startPos;
        transform.rotation = startRot;
        //InputTracking.Recenter(); 
    }

    void warpToSpawn(Transform spawn)
    {
        transform.position = spawn.position;
        transform.rotation = spawn.rotation;
        //InputTracking.Recenter();
    }

	// Update is called once per frame
	void Update ()
    {
        if (Input.GetButtonDown("Jump"))
            Reset();

        //if (Input.GetKeyDown(KeyCode.Alpha1))
          //  warpToSpawn(spawn1);
        //if (Input.GetKeyDown(KeyCode.Alpha2))
          //  warpToSpawn(spawn2);
        //if (Input.GetKeyDown(KeyCode.Alpha3))
          //  warpToSpawn(spawn3);




    }
}
