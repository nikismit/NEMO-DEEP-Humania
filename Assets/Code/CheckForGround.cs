using UnityEngine;
using System.Collections;

public class CheckForGround : MonoBehaviour {

	public bool onGround = false;
	public float distanceToGround = 100;

	private RaycastHit hit;

	private float onGroundRange = 1.15f;

	// Update is called once per frame
	void Update () 
	{
		if (Physics.Raycast(transform.position, -transform.up, out hit, 50f))
		{
			distanceToGround = hit.distance;

			if(distanceToGround <= onGroundRange)
				onGround = true;
			else
				onGround = false;
		}
	}
}
