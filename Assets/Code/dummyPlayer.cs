using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class dummyPlayer : MonoBehaviour {


	public float Gravity
	{
		get
		{
			return this.gravity;
		}
		set
		{
			this.gravity = value;
		}
	}
	public float gravity;



	public float upForce = 1f;
	public float speed = 1f;
	public float bouyancyThreshHold = 0.65f;



	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}


	public void SetGravity(float newGravity)
	{
		gravity = newGravity;
	}

}
