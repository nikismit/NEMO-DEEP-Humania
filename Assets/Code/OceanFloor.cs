using UnityEngine;
using System.Collections;

public class OceanFloor : MonoBehaviour {

	public FloorTile floorTilePrefab;
	public int SizeX = 20;
	public int SizeZ = 20;

	private FloorTile[,] floor;

	public void Generate()
	{
		floor = new FloorTile[SizeX, SizeZ];

		for (int x = 0; x < SizeX; x++) {
			for (int z = 0; z < SizeZ; z++) {
				MakeTile(x, z);
			}
		}

		PrepareStartArea();

	}

	private void MakeTile(int x, int z)
	{
		FloorTile newTile = Instantiate( floorTilePrefab ) as FloorTile;
		floor[x,z] = newTile;
		newTile.xPos = x;
		newTile.zPos = z;
		newTile.name = "Floor " + x + ", " + z;
		newTile.transform.parent = transform;
		newTile.transform.localPosition = new Vector3(
			(x + 0.5f) * 2,
			0,
			(z + 0.5f ) * 2);


		newTile.distanceToCenter = Mathf.Sqrt( Mathf.Pow((SizeX / 2) - x,2) + Mathf.Pow((SizeZ / 2) - z,2) );

		newTile.RadnomYScale();
	}

	private void PrepareStartArea()
	{
		floor[0,0].gameObject.transform.localScale = new Vector3(2f, 19f, 2f);
	}
}
