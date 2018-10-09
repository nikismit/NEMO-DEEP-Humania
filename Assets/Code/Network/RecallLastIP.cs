using UnityEngine;
using UnityEngine.UI;

public class RecallLastIP : MonoBehaviour {

	// Use this for initialization
	void Start () {
        GetComponent<InputField>().text = PlayerPrefs.GetString("IP");
	}
	
	
}
