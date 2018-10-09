using UnityEngine;
using System.Collections;

public class Commands : MonoBehaviour {

    public GameObject player;
    public GameObject arch;

    public delegate void Command();
    public static event Command FullStop; 

	// Update is called once per frame
	void Update ()
    {
        if (!Input.anyKey)
            return;

        if (Input.GetKeyDown(KeyCode.L))
            StartLogging();
        else if (Input.GetKeyDown(KeyCode.R))
            ResetPlayer();
        else if (Input.GetKeyDown(KeyCode.H))
            HideMirroring();
        else if (Input.GetKeyDown(KeyCode.P))
        {
            if (arch == null)
                arch = GameObject.Find("Arch");
            ToggleObject(arch);
        }
        else if (Input.GetKeyDown(KeyCode.S))
            if (FullStop != null)
                FullStop();


        // trying to be fancy
        /*
	    if(Input.anyKeyDown)
        {
            Event e = Event.current;
            KeyCode key = KeyCode.None;

            if (e.isKey)
                key = e.keyCode;

            switch(key)
            {
                case KeyCode.L:
                    StartLogging();
                    break;

                case KeyCode.R:
                    ResetPlayer();
                    break;
            } 
        }    
        */
	}

    private void StartLogging()
    {
        GetComponent<ReadControllerv2>().beginLogging(true);
    }

    private void ResetPlayer()
    {
        if (player == null)
            player = GameObject.FindGameObjectWithTag("Player");

        player.GetComponent<ResetPlayer>().Reset();
    }

    private void HideMirroring()
    {
        if (player == null)
            player = GameObject.FindGameObjectWithTag("Player");

        MeshRenderer mr = GameObject.Find("UI").GetComponent<MeshRenderer>();

        mr.enabled = ! mr.enabled;
    }

    private void ToggleObject(GameObject g)
    {
        g.SetActive(!g.activeSelf);
    }
}
