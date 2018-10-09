using UnityEngine;
using UnityEditor;

namespace ObjectPainter
{
	public class BrushEditor : EditorWindow 
	{	
		public static bool showing;
		public int current;	

		public static void Init()
		{
			BrushEditor window = (BrushEditor)EditorWindow.GetWindow (typeof (BrushEditor));
			window.current = 0;
			
			window.name = "painter";		
			window.maxSize = new Vector2(250, 260);
			window.minSize = new Vector2(250, 260);		
			window.Show();   			     
		}

		void OnDestroy()
		{
			showing = false;
		}

		void Update()
		{
			if ( showing == false )
			{
				BrushManager.Instance.Save();
				Close();
			}
		}

		void OnGUI()
		{
			EditorGUILayout.BeginHorizontal();		
			current = EditorGUILayout.Popup(current, 
				BrushManager.Instance.GetNameList(),
				GUILayout.MinHeight(10.0f)
			);
			
			if( current == BrushManager.Instance.brushes.Count)
			{
				BrushManager.Instance.brushes.Add(new Brush());						
			}
			if(GUILayout.Button("done", GUILayout.MinHeight(10.0f)))
				showing = false;	
			if(GUILayout.Button("delete", GUILayout.MinHeight(10.0f)))
			{			
				BrushManager.Instance.brushes.RemoveAt(current);
				--current;
				
				if( current < 0 ) 
					current = 0;
			}

			if( current < BrushManager.Instance.brushes.Count)
			{
				EditorGUILayout.EndHorizontal();
				BrushManager.Instance.brushes[current].name = EditorGUILayout.TextField(BrushManager.Instance.brushes[current].name);

				Handles.BeginGUI();

				Handles.color = Color.white;
				Handles.DrawSolidDisc(new Vector3(125, 147), Vector3.forward, 100);
				
				if( BrushManager.Instance.brushes[current].points != null)
				{
					Handles.color = Color.red;						
					for(int i = 0; i < BrushManager.Instance.brushes[current].points.Count; ++i)
					{					
						Handles.DrawSolidDisc( new Vector3(125, 147, 0) + (BrushManager.Instance.brushes[current].points[i] * 100), Vector3.forward, 30);
					}
					
					Event e = Event.current;
					Vector3 mp = e.mousePosition;
					if(e.isMouse && e.type == EventType.MouseDown)
					{
						if(e.button == 0)
						{						
							if( (mp - new Vector3(125, 147) ).magnitude < 100 )
							{
								BrushManager.Instance.brushes[current].points.Add(((mp - new Vector3(125, 147) ) / 100));							
								Repaint();
							}
						}
						else if(e.button == 1)
						{
							for(int i = 0; i < BrushManager.Instance.brushes[current].points.Count; ++i)
							{
								if( (mp-(new Vector3(125, 147, 0) + (BrushManager.Instance.brushes[current].points[i] * 100))).magnitude < 30)
								{
									BrushManager.Instance.brushes[current].points.RemoveAt(i);
									Repaint();
								}
							}
						}
					}
					
				}
				Handles.EndGUI();
			}		
		}

	}
}