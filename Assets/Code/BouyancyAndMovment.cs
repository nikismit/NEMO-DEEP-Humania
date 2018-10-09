using UnityEngine;
using System.Collections;

public class BouyancyAndMovment : MonoBehaviour 
{
	public float bouyancyForce = 10f;
	public float gazeForce = 10f;
	public ForceMode theMode;

	public Rigidbody player;


	private float ModifiedGazeForce;
	private CheckForGround playerFoot;

	public Camera lookComera;


	public float buoyancyThresholdGround = 0.6f;
	public float buoyancyThresholdAir = 0.5f;



	public TextMesh calText;

	private float modifiedBouyancyForce = 1f;

	void Start()
	{
		playerFoot = player.GetComponent<CheckForGround>();
		//StartCoroutine( DelayedUpdate() );

	}

	//TODO: move all this into fixedupdate

	//IEnumerator DelayedUpdate()
	//{
		/*

		yield return new WaitForSeconds(5f);

		while( true )
		{
			// this is basicly the update function

			if( CurrentBreath._instance.currentBreath > buoyancyThreshold )
			{
				player.AddForce(Vector3.up * bouyancyForce );
				Debug.Log("The loop is running");
			}

			if( !playerFoot.onGround )
			{
				moveForward();
			}

			yield return null;
		}
		*/
	//}


	// messy crap for on the fly calibration
	void Update()
	{
		if( Input.GetKeyDown(KeyCode.Comma ) )
		{
			buoyancyThresholdGround -= 0.1f;
			calText.text = buoyancyThresholdGround.ToString();;
			calText.gameObject.SetActive(true);
			Invoke("DisableText", 1f);
		}
		if (Input.GetKeyDown(KeyCode.Period ) )
		{
			buoyancyThresholdGround += 0.1f;
			calText.text = buoyancyThresholdGround.ToString();
			calText.gameObject.SetActive(true);
			Invoke("DisableText", 1f);
		}
	}

	private void DisableText()
	{
		calText.gameObject.SetActive(false);
	}
	// end of messy crap
	void FixedUpdate()
	{


		if( CurrentBreath._instance.breahState == 1 )
			player.AddForce(Vector3.up * bouyancyForce);



		if( CurrentBreath._instance.currentBreath > buoyancyThresholdGround )
		{
			player.AddForce(Vector3.up * bouyancyForce );
		}



	
		if( CurrentBreath._instance.breahState == 1 )
			player.AddForce(Vector3.up * bouyancyForce);


		if( !playerFoot.onGround )
		{
			moveForward();
		}
	
	}

	void moveForward()
	{
		if( playerFoot.distanceToGround < 3)
			ModifiedGazeForce = gazeForce * (playerFoot.distanceToGround / 3f);
		else
			ModifiedGazeForce = gazeForce;

		if (CurrentBreath._instance.breahState == -1)
			ModifiedGazeForce *= 2;

		Vector3 direction = lookComera.transform.forward * ModifiedGazeForce;
		player.AddForce( direction, theMode );
	}
}
