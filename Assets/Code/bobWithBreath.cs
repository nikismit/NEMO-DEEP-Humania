using System.Collections;
using System.Collections.Generic;
using UnityEngine;
//using UnityEngine.PostProcessing;

public class bobWithBreath : MonoBehaviour {

    public AnimationCurve curve;
    public float fullness;
    private float oldFullnes = 0.5f;
    public bool smooth = false;
    public bool fade = false;
    public bool revealItems = false;
    public float smoothness = 0.2f;

    public int BreathCount = 0;
    public int ShowOnEveryXBreath = 5;
    private int nextItemToShow = 0;

    public GameObject[] itemsToShow;
    

    //public PostProcessingProfile ppp;

    //VignetteModel.Settings settings;

    private void OnEnable()
    {
        Controller._instance.onInhaleEvent += CountUpBreath;
    }

    // Use this for initialization
    void Start () {
        //SetOpacity(0.5f);

        if(revealItems)
        {
            foreach (GameObject g in itemsToShow)
                g.SetActive(false);
        }
	}
	
	// Update is called once per frame
	void Update () {
        fullness = Controller._instance.fullness;

        if(smooth)
        {
            float smoothfullness = oldFullnes + (( fullness - oldFullnes) * smoothness);
            fullness = smoothfullness;

            oldFullnes = fullness;
        }

        if(fade)
        {
            //SetOpacity(1.27f - fullness);
        }




        transform.position = setYpos(curve.Evaluate(fullness));

        if (Input.GetKeyDown(KeyCode.H))
            smooth = !smooth;
	}

    Vector3 setYpos(float newY)
    {
        Vector3 pos = transform.position;
        pos.y = newY;
        transform.position = pos;
        return pos;
    }

    void SetOpacity(float newOp)
    {
        //settings = ppp.vignette.settings;
        //settings.opacity = newOp;
        //ppp.vignette.settings = settings;
    }

    void CountUpBreath()
    {
        if (fullness < 0.25f) {
            BreathCount++;
            if (BreathCount >= ShowOnEveryXBreath)
            {
                itemsToShow[nextItemToShow].SetActive(true);

                if (nextItemToShow + 1 < itemsToShow.Length)
                    nextItemToShow++;
                BreathCount = 0;
            }
        }
    }

    void OnDisable()
    {
        SetOpacity(0f);
        Controller._instance.onInhaleEvent += CountUpBreath;
    }
}
