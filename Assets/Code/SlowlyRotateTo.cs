using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SlowlyRotateTo : MonoBehaviour {

    public Transform target;    // move to this
    public Transform center;    // move around this
    public float speed = 10;    // move this fast


	void Update () {
        // slowly move towards object
        transform.position = Vector3.Lerp(transform.position, target.position, speed * Time.deltaTime);
        /*
        // see how far you are from the center
        Vector3 vectorToCenter =  transform.position - center.transform.position;
        float distance = vectorToCenter.magnitude;

        print(distance);

        // if you are too far snap to 2m away
        if ( distance > 2.1f || distance < 1.9f )
            transform.position = center.position + (vectorToCenter.normalized * 2);
            */
        
	}
}
