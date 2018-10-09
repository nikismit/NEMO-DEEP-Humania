using UnityEngine;
using System.Collections;

public class GameManager : MonoBehaviour {

	public OceanFloor floor;

	void Start()
	{
		floor.Generate();
	}


}
