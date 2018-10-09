using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerTeatherd : MonoBehaviour {

    Vector3 thetherPosition;
    RaycastHit hit;
    Rigidbody rb;
    bool teathered = false;
    float raw;
    float oldRaw = 0f;
    float smoothFullness;
    public float smoothLevel = 4f;
    float dif;
    float yVel = 0f;
    // Use this for initialization
    void Start () {
        rb = GetComponent<Rigidbody>();
        thetherPosition = transform.position;
	}

    void Update()
    {
        
        raw = Controller._instance.fullness;
        dif = raw - oldRaw;

        smoothFullness = oldRaw + ((raw - oldRaw) * 0.9f); //Mathf.SmoothDamp(oldRaw, raw, ref yVel, 1f);  //oldRaw + (dif * smoothLevel * Time.deltaTime);
        transform.position = Vector3.Lerp(thetherPosition, thetherPosition + (transform.up * 3), smoothFullness);
        oldRaw = raw;
    }

    // Update is called once per frame
    void FixedUpdate()
    {
        /*
        if (Physics.Raycast(transform.position, -transform.up, out hit, 100))
        {
            if(!teathered)
            { 
                if (hit.distance > 0.1f)
                    MakePlayerSink();
                else
                {
                    teathered = true;
                    thetherPosition = transform.position;
                }
            }
            else
                MakePlayerSink();
        }
        */
    }

    void MakePlayerSink()
    {
        rb.AddForce(transform.up * -0.12f, ForceMode.Impulse);
    }
}
