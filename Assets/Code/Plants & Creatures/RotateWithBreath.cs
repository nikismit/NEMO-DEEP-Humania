using UnityEngine;
using System.Collections;

public class RotateWithBreath : MonoBehaviour {

    public Vector3 targetRotaion;

    private Vector3 startingRotation;
    private Vector3 currentRotation;

    private float offset;
	
	void Start()
    {
        startingRotation = transform.rotation.eulerAngles;
        offset = transform.rotation.eulerAngles.x;
    }


	// Update is called once per frame
	void Update () {
        currentRotation = transform.rotation.eulerAngles;

        currentRotation.x = Mathf.Lerp(-targetRotaion.x, targetRotaion.x, Output._instance.fullness);
        currentRotation.x += offset;


        if (transform.parent != null)
            currentRotation += transform.parent.rotation.eulerAngles;

        transform.rotation = Quaternion.Euler(currentRotation);
	}
}
