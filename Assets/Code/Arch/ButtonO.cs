using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ButtonO : MonoBehaviour {

    public string FunctionToCall;

	void OnTriggerEnter(Collider other)
    {
        if(other.tag == "Hand")
        {
            Pressed();
        }
    }

    void Pressed()
    {
        Arch._instance.BroadcastMessage(FunctionToCall);
    }
}
