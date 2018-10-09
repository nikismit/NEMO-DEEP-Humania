using UnityEngine;
using System.Collections;

public class TriggerResetPlayer : MonoBehaviour {

	
    void OnTriggerEnter(Collider other)
    {
        if (other.tag == "Player")
            other.BroadcastMessage("Reset");

    }

}
