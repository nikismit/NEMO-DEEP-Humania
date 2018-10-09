using UnityEngine;
using System.Collections;

public class PlayRandomSoundAfterRandomInterval : MonoBehaviour {

    public AudioClip[] sounds;
    public float minTime;
    public float maxTime;

    private AudioSource audioSource;

	// Use this for initialization
	void Start () {
        audioSource = GetComponent<AudioSource>();

        StartCoroutine(RandomWait());
	}
	
    IEnumerator RandomWait()
    {
        while (true)
        {
            yield return new WaitForSeconds(Random.Range(minTime, maxTime));
            PlayRandomSound();
        }

    }


    void PlayRandomSound()
    {
        audioSource.clip = sounds[Random.Range(0, sounds.Length)];
        audioSource.Play();
    }
}
