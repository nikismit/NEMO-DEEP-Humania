using UnityEngine;
using System.Collections;

public class BreathCounter : MonoBehaviour
{

    public int breaths;                         // number of breaths

    private bool breathingIn = false;           // are they breathing in
    private float buffer = 0.2f;                // arethey 

    private bool reloadBreathCounter = false;

    private float lastBreaethTime; 

    // Use this for initialization
    void Start()
    {
        Output._instance.onBreathIn += inBreath;
        Output._instance.onBreathOut += outBreath;
    }

    void inBreath()
    {
        breathingIn = true;
        StartCoroutine(stillBreathingIn());
    }


    IEnumerator stillBreathingIn()
    {
        yield return new WaitForSeconds(buffer);
        if (breathingIn && reloadBreathCounter )
        {
            breaths++;
            // let output know there has been a complete breath
            Output._instance.breathCountUp();

            reloadBreathCounter = false;
        }
    }

    void outBreath()
    {
        breathingIn = false;
        StartCoroutine(stillBreathingOut());
    }

    IEnumerator stillBreathingOut()
    {
        yield return new WaitForSeconds(buffer * 8);

        if (!breathingIn)
            reloadBreathCounter = true;
    }


    void OnDisable()
    {
        Output._instance.onBreathIn -= inBreath;
        Output._instance.onBreathOut -= outBreath;
    }

}
