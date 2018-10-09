using UnityEngine;
using UnityEngine.UI;

public class ShowRange : MonoBehaviour {



	public float max;
	public float min;
	
	private float parentRange;
	private RectTransform rt;
	
	public ProcessController pc;
	
	private Image image;

	// Use this for initialization
	void Start () {
		rt = GetComponent<RectTransform>();
		image = GetComponent<Image>();
		parentRange = transform.parent.GetComponent<RectTransform>().rect.height;
		
	}
	
	// Update is called once per frame
	void Update () 
	{
        if (pc.enabled)
        {
            rt.offsetMax = new Vector2(0, -(parentRange - ScaleValue(pc.max)));
            rt.offsetMin = new Vector2(0, ScaleValue(pc.min));

            image.color = Color.Lerp(Color.red, Color.green, (pc.range - 100) / 500);
        }
	}
	
	float ScaleValue(float value)
	{
		return (value/1024) * parentRange;
	}
}
