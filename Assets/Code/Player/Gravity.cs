using UnityEngine;
using System.Collections;

public class Gravity : MonoBehaviour {

    public float grav = -0.5f;

    Rigidbody rb;


    void Start()
    {
        rb = GetComponent<Rigidbody>();
    }

    void FixedUpdate()
    {
        rb.AddForce(Vector3.up * grav);
    }


}
