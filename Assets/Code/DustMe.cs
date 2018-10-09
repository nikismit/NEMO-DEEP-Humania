using UnityEngine;
using System.Collections;

public class DustMe : MonoBehaviour {

	public GameObject dustMote;
	public int quantity = 1000;
	public int radius = 100;

	// Use this for initialization
	void Start () 
	{
		for (int i = 0; i < quantity; i++) {
			Instantiate (dustMote, Random.insideUnitSphere * radius, transform.rotation);
		}
	}
	

}
