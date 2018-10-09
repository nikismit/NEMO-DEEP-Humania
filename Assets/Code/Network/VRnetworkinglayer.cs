using UnityEngine;
using UnityEngine.Networking;
using UnityEngine.UI;
using UnityEngine.VR;
using System.Collections;

public class VRnetworkinglayer : MonoBehaviour {

    public string hostIP;

    private NetworkManager nm;
    private NetworkDiscovery nd;
    private NetworkManagerHUD nmd;

	// Use this for initialization
	void Start () {
        nm = GetComponent<NetworkManager>();
        nd = GetComponent<NetworkDiscovery>();
        nmd = GetComponent<NetworkManagerHUD>();

	}

    public void StartHost()
    {
        nm.StartHost();

    }

    public void StartClient()
    {
        if (hostIP == null)
            hostIP = PlayerPrefs.GetString("IP");
        else
            PlayerPrefs.SetString("IP", hostIP);


        nm.networkAddress = hostIP;
        nm.StartClient();
    }

    public void UpdateIP(string newIP)
    {
        hostIP = newIP;
        

    }
}
