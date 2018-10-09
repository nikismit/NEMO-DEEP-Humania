using UnityEngine;
using System.IO;
using System.Collections.Generic;

namespace ObjectPainter
{
	public class Brush{
		public string name = "brush";
		public List<Vector3> points = new List<Vector3>();	
	}

	public class BrushManager 
	{	
		public static Brush current;
		public List<Brush> brushes;

		private static BrushManager brushManager;
		
		public Brush this[int index]{		
			get{ 
				current = brushes[index];
				return current;
			}
		}

		public static BrushManager Instance{
			get { return brushManager; }
			set { brushManager = value; }
		}	

		public BrushManager()
		{
			brushes = new List<Brush>();	
			//Load();
		}

		public void Load()
		{
			
			using (StreamReader sr = new StreamReader("Assets/Prefab Spawner/Editor/brushes"))
			{
				// Read the stream to a string, and write the string to the console.
				string line;// = sr.ReadToEnd();
				string[] vectors, vector;
				Brush newBrush;
				while( (line = sr.ReadLine()) != null)
				{
					if( line.StartsWith("[") && line.EndsWith("]"))
					{
						newBrush = new Brush();
						newBrush.name = line.Replace("[", string.Empty).Replace("]", string.Empty);

						line = sr.ReadLine();
						vectors = line.Split(',');
						for( int i = 0; i < vectors.Length; ++i )
						{
							vector = vectors[i].Replace("(", string.Empty).Replace(")", string.Empty).Split(' ');						
							newBrush.points.Add( new Vector3( 
								float.Parse(vector[0]), 
								float.Parse(vector[1]), 
								float.Parse(vector[2]) 
							));
						}									
						brushes.Add(newBrush);
					}
				}
			}
		}

		public void Save()
		{
			using(StreamWriter sw = new StreamWriter("Assets/Prefab Spawner/Editor/brushes"))
			{
				sw.Flush();

				for(int i = 0; i < brushes.Count; ++i )
				{
					sw.WriteLine("[" + brushes[i].name + "]");
					for(int j = 0; j < brushes[i].points.Count; ++j)
						sw.Write(
							"("+brushes[i].points[j].x+" "+
							brushes[i].points[j].y+" "+
							brushes[i].points[j].z+")" + 
							((j<brushes[i].points.Count-1)?"," : sw.NewLine)
						);								
				}

			}
		}

		public string[] GetNameList()
		{
			string[] names = new string[brushes.Count+1];
			for(int i = 0; i < brushes.Count; ++i)
				names[i] = (i+1).ToString() + ". " + brushes[i].name;

			names[brushes.Count] = "new brush";
			return names;
		}

	}
}