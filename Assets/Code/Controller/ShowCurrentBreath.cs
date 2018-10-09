using UnityEngine;

public class ShowCurrentBreath : MonoBehaviour {

	public Vector2 arrowPosition;
	private RectTransform rt;
	private float range;
	
	public ProcessController pc;
	
	void Start()
	{
		rt = GetComponent<RectTransform>();
		arrowPosition = rt.anchoredPosition;
		range = transform.parent.GetComponent<RectTransform>().rect.height;
	}
	
	// Update is called once per frame
	void Update () 
	{
        if( pc.enabled)
        { 
		    float h = (pc.newRead / 1024) * range;
		    arrowPosition.y = h;
		    rt.anchoredPosition = arrowPosition;
        }
	}
}
