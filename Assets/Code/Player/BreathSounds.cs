using UnityEngine;
using System.Collections;

public class BreathSounds : MonoBehaviour {

    public AudioSource breathIn;
    public AudioSource breathOut;

    private Controller controller;
    private float startingVol;

    void Start()
    {
        controller = Controller._instance;

        controller.onInhaleEvent += playIn;
        controller.onExhaleEvent += playOut;

        startingVol = breathIn.volume;
    }

    

    void playIn()
    {
        if (!breathIn.isPlaying)
            breathIn.Play();
        //if (breathOut.isPlaying)
            //StartCoroutine("fadeSound", breathOut);
    }

    void playOut()
    {
        if(!breathOut.isPlaying)
            breathOut.Play();
        //if (breathIn.isPlaying)
            //StartCoroutine( "fadeSound", breathIn);
    }

    IEnumerator fadeSound( AudioSource audio)
    {
        while (audio.volume >= 0.05f)
        {
            audio.volume = Mathf.Lerp(audio.volume, 0, 0.3f * Time.deltaTime);

            yield return null;
        }

        audio.Stop();
        audio.volume = startingVol;
        StopCoroutine("fadeSound");
        
    }

  
    void OnDisable()
    {
       
        controller.onInhaleEvent -= playIn;
        controller.onExhaleEvent -= playOut;
    }

	
}
