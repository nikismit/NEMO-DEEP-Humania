using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;


public class SlideInPanel : MonoBehaviour {

	public RectTransform panel;
	public float hiddenY = 10f;
	public float exposedY = -410f;

	private bool show = false;


	void Start()
	{
		SetRect(hiddenY);
	}


	void Update()
	{
		if(Input.GetKeyDown(KeyCode.M))
		{
			showMenu();
		}
	}

	void showMenu()
	{
		if(panel.anchoredPosition.y == hiddenY)
		{
			StartCoroutine(movePanel(exposedY));
		}
		else if(panel.anchoredPosition.y == -410)
		{
			StartCoroutine(movePanel(hiddenY));
		}
		else
		{
			SetRect(exposedY);
		}

	}

	private void SetRect(float y)
	{
		Vector2 temp = panel.anchoredPosition;
		temp.y = y;
		panel.anchoredPosition = temp;
	}


	IEnumerator movePanel(float moveTo)
	{
		while ( panel.anchoredPosition.y != moveTo )
		{
			SetRect(panel.anchoredPosition.y + ((moveTo - panel.anchoredPosition.y )* 0.1f));

			if( (panel.anchoredPosition.y - moveTo ) <= 0.1 )
				SetRect(moveTo);

			yield return null;
		}
	}


}
