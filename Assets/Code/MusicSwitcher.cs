using UnityEngine;
using System.Collections;

public class MusicSwitcher : MonoBehaviour {

	public AudioClip[] tracks;
		


	AudioSource player;
	int playing = 0;

	void Start()
	{
		player = GetComponent<AudioSource>();
	}

	void Update()
	{
		if( Input.GetKeyDown(KeyCode.L) )
		{
			if(playing == 0 )
				playing = 1;
			else
				playing = 0;


			player.clip = tracks[playing];
			player.Play();
		}
	}


}
