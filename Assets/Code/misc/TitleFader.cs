using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TitleFader : MonoBehaviour {
    //[Range(0,2)]   public float tester = 0; //for debugging purposes
    public bool trigger = true;
    private bool triggered = false;
    public BoxCollider playerCollider;
    public GameObject title;
    public GameObject tutorial;
    public float fadeAfterSeconds = 5.0f;
    [Range(0,5)]
    public float fadeTime = 2.0f;
    private float timer;
    private float globalTimer;
    float _a = 0;
    // Use this for initialization
    void Start () {
        timer = 0.0f;
        globalTimer = 0.0f;
	}
	
	// Update is called once per frame
	void Update () {

        if (trigger)
        {
            if (triggered)
            {
                print("triggered");
                timer += Time.deltaTime / fadeTime;
                Color titleColor = new Color(1.0f, 1.0f, 1.0f, (1.0f - timer));
                //Color titleColor = new Color(1.0f, 1.0f, 1.0f, tester);
                Color tutColor = new Color(1.0f, 1.0f, 1.0f, timer);
                
                title.GetComponent<Renderer>().material.SetColor("_TintColor", titleColor);
                tutorial.GetComponent<Renderer>().material.SetColor("_Color", tutColor); //using default UI shader
            }
        } else
        {
            globalTimer += Time.deltaTime;
            if (globalTimer >= fadeAfterSeconds)
            {
                timer += Time.deltaTime / fadeTime;
                Color titleColor = new Color(1.0f, 1.0f, 1.0f, (1.0f - timer));
                _a = timer;
                if (_a > 1) _a = 1f;
                Color tutColor = new Color(1.0f, 1.0f, 1.0f, _a);
                title.GetComponent<Renderer>().material.SetColor("_TintColor", titleColor);
                tutorial.GetComponent<Renderer>().material.SetColor("_Color", tutColor); //using default UI shader
            }
        }

	}

    private void OnTriggerEnter(Collider other)
    {
        if (trigger)
        {
            triggered = true;
        }
    }


}
