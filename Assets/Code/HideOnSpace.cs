using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HideOnSpace : MonoBehaviour {

    private Renderer r;

    private void Start()
    {
        r = GetComponent<Renderer>();
    }

	// Update is called once per frame
	void Update () {
        if (Input.GetButtonDown("Jump"))
            r.enabled = !r.enabled;	
	}
}
