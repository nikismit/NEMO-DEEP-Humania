using UnityEngine;
using UnityEditor;

namespace ObjectPainter
{
	public class ObjectData
	{
		public Vector3 point;
		public float scale;
		public Vector3 angle;

		public ObjectData(Vector3 point, Vector3 angle, float scale)
		{
			this.point = point;
			this.angle = angle;
			this.scale = scale;
		}		
	}

	public class ObjectPainter
	{
		public float minDistance, intensity = 3, radius = 4;
		public float minScale = 0.5f, maxScale = 1.0f, scaleOffset = 1, indent = 0; // rotation / scale values
		public Vector3 minRot, maxRot; // minRot = 0, maxRot = 360
		public bool randomRot, randomScale, normalIsUp = true;
		public Vector3 rotationOffset;		
		public float height, width;
		private RaycastHit hit;
		private GameObject prefab;
		private Ray ray;
		
		public GameObject Prefab{
			get { return prefab; }
			set { 				
				if ( value != null && prefab != value )
				{
					prefab = value;
					Vector2 b = GetPrefabScale();
					width = b.x;
					Debug.Log(b.y);
					height = b.y;	
				}
			}
		}

		public RaycastHit Cast(Vector3 mousePos)
		{
			hit.point = new Vector3(10000,10000,10000);
			ray = Camera.current.ScreenPointToRay(mousePos);			
			Physics.Raycast(ray, out hit, Mathf.Infinity);
			
			return hit;		
		}

		///<summary>
		/// returns a random set of positions for the brush paint type
		///</summary>
		public ObjectData[] GetPositions()
		{
			ObjectData[] points = new ObjectData[(int)intensity];
			return points;
			int safeGaurd = 300;
			for ( int i =0; i < intensity; ++i)
			{
				Vector3 rr = new Vector3(Random.Range(minRot.x, maxRot.x), Random.Range(minRot.y, maxRot.y), Random.Range(minRot.z, maxRot.z));
				safeGaurd = 300;
				do{
					points[i] = new ObjectData(
						new Vector3(
							Mathf.Cos(Mathf.Deg2Rad * (Random.value * 360 )) * (radius/3f),
							0, 
							Mathf.Sin(Mathf.Deg2Rad * (Random.value * 360 )) * (radius/3f)
						),
						randomRot ? rr : Vector3.zero,
						randomScale ? Random.Range(minScale, maxScale * Mathf.Min(0.7f,(safeGaurd/300))) : 1
					);
					--safeGaurd;
				}while(CheckDist(i, points) == false && safeGaurd > 0);      		
			}
		}

		public ObjectData[] GetObjectData(Brush brush)
		{
			if ( brush == null )
				return new ObjectData[0];

			ObjectData[] objects = new ObjectData[brush.points.Count];
			
			float angle = Random.value * 360;			
			for( int i = 0; i < brush.points.Count; ++i )
			{
				Debug.Log(brush.points[i]);

				Vector3 rr = new Vector3(Random.Range(minRot.x, maxRot.x), Random.Range(minRot.y, maxRot.y), Random.Range(minRot.z, maxRot.z));

				objects[i] = new ObjectData(
					new Vector3(
						Mathf.Cos(Mathf.Deg2Rad * angle) * brush.points[i].x - Mathf.Sin(Mathf.Deg2Rad * angle) * brush.points[i].x, 
						0, 
						Mathf.Sin(Mathf.Deg2Rad * angle) * brush.points[i].x + Mathf.Cos(Mathf.Deg2Rad * angle) *brush.points[i].y
					) * (radius/2.0f), 
					randomRot ? rr : Vector3.zero, 
					(randomScale ? Random.Range( minScale, maxScale ) : 1)
				);				
			}

			return objects;
		}

		public RaycastHit[] GetCastedPositions(Vector3 pos, ObjectData[] objects, Vector3 normal)
		{
			RaycastHit[] hits = new RaycastHit[objects.Length];
			for( int i = 0; i < objects.Length; ++i )
			{		
				if( objects[i] == null ) 
					continue;

				RaycastHit hit;
				Handles.color = Color.white;				
				
				Handles.DrawLine(
					RotatePoint(objects[i].point + Vector3.up, normal, pos) + pos, 
					RotatePoint(objects[i].point, normal, pos) - (normal * 3) + pos
				);
				if(Physics.Linecast( 
					RotatePoint(objects[i].point + Vector3.up, normal, pos) + pos, 
					RotatePoint(objects[i].point, normal, pos) + pos - (normal * 3), 
					out hit) )
				{
					hits[i] = hit;					
				}
				
			} 

			return hits;
		}


		///<summary>
		/// spawn prefab object on target position and rotation
		///</summary>
		public void SpawnPrefab(Vector3 point, Vector3 normal)
		{			
			GameObject obj = PrefabUtility.InstantiatePrefab(prefab) as GameObject;
			obj.transform.position = point - (indent * -normal);
			
			if( normalIsUp == true )
				obj.transform.up = normal;

			float rs = Random.Range(minScale, maxScale);
			Vector3 rr = new Vector3(Random.Range(minRot.x, maxRot.x), Random.Range(minRot.y, maxRot.y), Random.Range(minRot.z, maxRot.z));
			
			obj.transform.localScale = obj.transform.localScale * scaleOffset;
			if( randomScale == true )
				obj.transform.localScale = new Vector3(obj.transform.localScale.x * scaleOffset * rs, obj.transform.localScale.y * scaleOffset * rs, obj.transform.localScale.z *scaleOffset * rs);

			if (randomRot == true)
				obj.transform.Rotate(prefab.transform.eulerAngles + rotationOffset + rr);
			else
				obj.transform.Rotate(prefab.transform.eulerAngles + rotationOffset);

			Undo.RegisterCreatedObjectUndo(obj, "Object painter");
		}

		///<summary>
		/// spawns a array of ObjectData object as prefab
		///</summary>
		public void SpawnPrefab(Vector3 pos, ObjectData[] objects, Vector3 normal)
		{			
			for( int i = 0; i < objects.Length; ++i )
			{		
				if( objects[i] == null ) 
					continue;

				RaycastHit hit;
				if(Physics.Linecast(objects[i].point + pos + (Vector3.up * 0.1f), (objects[i].point + pos) - (normal * 2), out hit))
				{
					if( Vector3.Angle(normal, hit.normal) > 90)
						continue;

					GameObject obj = PrefabUtility.InstantiatePrefab(prefab) as GameObject;
					obj.transform.position = hit.point - (indent * -hit.normal);
					
					if( normalIsUp == true )
						obj.transform.up = hit.normal;
									
					obj.transform.localScale = new Vector3(objects[i].scale, objects[i].scale, objects[i].scale) * scaleOffset;
					obj.transform.Rotate(prefab.transform.eulerAngles + rotationOffset + objects[i].angle);							
					
					Undo.RegisterCreatedObjectUndo(obj, "Object painter");
				}				
			}
		}

		public Vector2 GetPrefabScale()
		{
			Bounds b = new Bounds(prefab.transform.position, Vector3.zero);
			float originalScaleMultilpier = (1.0f /  prefab.transform.localScale.x);
			
			foreach(Renderer renderer in prefab.GetComponentsInChildren<Renderer>())
			{
				b.Encapsulate(renderer.bounds);
			}
			Vector3 localPivot = b.center - prefab.transform.position;			
			b.center = localPivot;
			return new Vector2(b.max.x, b.max.y) * originalScaleMultilpier;
		}

		///<summary>
		/// check if position of objects[index] is to close to another object in the array
		///</summary>
		private bool CheckDist(int index, ObjectData[] objects)
		{			
			float dist = 0, colliderSize = 1000;

			for ( int i = 0; i < objects.Length; ++i)
			{				
				if ( i == index || objects[i] == null )
					continue;

				dist = (objects[index].point - objects[i].point).magnitude;
				colliderSize = ((width * objects[i].scale) + (width * objects[i].scale)) * 0.3f;								
				
				if(dist < colliderSize)
				{
					return false;
				}
			}
									
			return true;
		}

		private Vector3 RotatePoint(Vector3 relativePosition, Vector3 circleDirection, Vector3 circlePosition)
		{					
			Debug.Log(circleDirection.normalized);			
			return (Quaternion.Euler(circleDirection.normalized *360) * relativePosition);
		}

		private Vector3 Multiply(Vector3 a, Vector3 b)
		{
			return new Vector3(a.x * b.x, a.y * b.y, a.z * b.z);
		}
	}
}