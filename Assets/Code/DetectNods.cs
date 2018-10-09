using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DetectNods : MonoBehaviour {

    public int ShakesToTrigger = 3;
    public float NodWindow = 1f;
    private int currentShakes = 0;


    public bool checking = false;

    public delegate void HeadAction();
    public static event HeadAction OnNod;


    void OnTriggerExit()
    {
        if(!checking)
            StartCoroutine(CheckForNod());
        currentShakes++;
    }

    IEnumerator CheckForNod()
    {
        checking = true;
        //print("loop started");
        float time = 0f;
        while (time < NodWindow)
        {
            time += Time.deltaTime;
            if (currentShakes >= ShakesToTrigger)
            {
                PlayerNodded();
                time = NodWindow + 1;   // exit the while loop
            }

            yield return null;
        }
        currentShakes = 0;
        checking = false;
        //print("loop finished");
    }

    void PlayerNodded()
    {
        print("Nod on son");
        if (OnNod != null)
            OnNod();
    }
}
