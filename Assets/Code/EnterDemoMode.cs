using UnityEngine;
using System.Collections;

public class EnterDemoMode : MonoBehaviour {

	public GameObject demoCam;
	public GameObject player;

	private bool demo = false;
	
	// Update is called once per frame
	void Update () 
	{
		if(Input.GetKeyDown(KeyCode.P))
		{
			if( !demo )
			{
				demoCam.SetActive(true);
				player.SetActive(false);

				demo = true;
			}

		
		}
	}


}
