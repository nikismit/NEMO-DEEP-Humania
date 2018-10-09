using UnityEngine;
using System.Collections;
using UnityEngine.Networking;

public class testScript : MonoBehaviour {

    private NetworkManager nm;

	// Use this for initialization
	void Start () {
        nm = GetComponent<NetworkManager>();
    }
	
	// Update is called once per frame
	void Update () {
        if (Input.GetKeyDown(KeyCode.Q))
        {
            nm.StopClient();
                }
	}
}
