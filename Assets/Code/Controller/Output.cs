using UnityEngine;
using System.Collections.Generic;

public class Output : MonoBehaviour {

    public static Output _instance;

    public float fullness;

    


    public enum States { breathingIn, breathingOut, holdingBreath };
    public States breathState = States.breathingIn;

    public delegate void breathEvent();
    public event breathEvent onBreathIn;
    public event breathEvent onBreathOut;
    public event breathEvent breathComplete;


    private int samples = 15;
    private int counter = 0;
    public float[] readArray;

    private float oldFullness = 0;


    public bool capFrames = false;

    void Awake()
    {
        if (_instance == null)
            _instance = this;


        if (capFrames)
            Application.targetFrameRate = 120;
    }

    void Start()
    {
        readArray = new float[15];
    }

    void Update()
    {
        readArray[counter] = fullness - oldFullness;
        counter++;
        if (counter >= readArray.Length)
            counter = 0;

        float total = 0;

        foreach(float f in readArray)
        {
            total += f;
        }

        if (total > 0.008f)
            breathingIn();
        else if (total < -0.008f)
            breathingOut();
        else
            holdingBreath();

        oldFullness = fullness;

    }

    public void breathingIn()
    {
        breathState = States.breathingIn;
        if (onBreathIn != null)
            onBreathIn();
    }

    public void breathingOut()
    {
        breathState = States.breathingOut;
        if (onBreathOut != null)
            onBreathOut();
    }

    public void holdingBreath()
    {
        breathState = States.holdingBreath;
    }


    public void breathCountUp()
    {
        if (breathComplete != null)
            breathComplete();
    }
}
