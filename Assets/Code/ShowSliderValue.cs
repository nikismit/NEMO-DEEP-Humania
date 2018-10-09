using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ShowSliderValue : MonoBehaviour {

	private Text text;

	void Start()
	{
		text = GetComponent<Text>();
	}

	public void UpdateText( float value )
	{
		text.text = "" + value;
	}
}
