using UnityEngine;
using System.Collections;

public class TestBreath : MonoBehaviour {

	//this script moves the colour of the world based on the breath

	public float breath = 0;

	public ListenToBreath[] listeners;

	void Start() {
		listeners = FindObjectsOfType<ListenToBreath>();
	}

	void OnGUI() {
		//breath = GUI.VerticalSlider(new Rect(25, 25, 10, 100), breath, 10.0F, 0.0F);
	}

	void Update()
	{
		foreach( ListenToBreath l in listeners )
		{
			l.GetComponent<Renderer>().material.color = Color.Lerp(Color.yellow, Color.red, CurrentBreath._instance.currentBreath);
		}
	}

}
