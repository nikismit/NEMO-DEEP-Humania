using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ListenForNod : MonoBehaviour
{
    private Text theText;
    private string startingText;

    private void Start()
    {
        theText = GetComponent<Text>();
        startingText = theText.text;
    }

    void OnEnable()
    {
        DetectNods.OnNod += playerNodded;
    }


    void OnDisable()
    {
        DetectNods.OnNod -= playerNodded;
    }

    void playerNodded()
    {
        theText.text = "but why? :(";
        Invoke("resetText", 2.5f);
    }

    void resetText()
    {
        theText.text = startingText;
    }
}
