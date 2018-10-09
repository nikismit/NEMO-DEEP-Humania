using UnityEngine;
using UnityEngine.UI;

public class ShowMenu : MonoBehaviour {

    public GameObject menu;
    


	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
        if (Input.GetKeyDown(KeyCode.M))
            menu.SetActive(!menu.active);
    }
}
