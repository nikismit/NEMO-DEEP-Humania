using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SetLocalRotFromLocalRot : MonoBehaviour {
    public Transform TargetRot;
	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
        if (TargetRot != null)
            transform.localRotation = TargetRot.localRotation;
	}
}
