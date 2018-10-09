using UnityEngine;
using System.Collections;

public class FloorTile : MonoBehaviour {

	public int xPos;
	public int zPos;

	public float distanceToCenter;

	public void RadnomYScale()
	{
		Vector3 tempScale = transform.localScale;
		tempScale.y =  (Random.Range(1.0f, 3.0f) * (distanceToCenter / 15)) * 3;
		transform.localScale = tempScale;
	}
}
