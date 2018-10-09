using UnityEngine;
using UnityEditor;

namespace ObjectPainter
{
    public class ObjectPainterEditor : EditorWindow
    {
        public enum InputType
        {
            Click,
            Drag,
			Brush
        }  

        private InputType it; // inputType
        private ObjectPainter painter;
        private RaycastHit hitInfo;
        private bool randomValues, mouseDown, panning, paint, inEditor;
        private float spacing;
        private int _currentBrush;
        private ObjectData[] objects;
        private RaycastHit[] hits;// brush object local raycast data;
        private SceneView sceneView; 
        private Vector3 lastSpawnPos;
        private Vector2 scrollPos;       
        private static GUIStyle ToggleButtonStyleNormal = null, ToggleButtonStyleToggled = null;

		private float maxScale = 3, minScale = 0;

        public InputType inputType{
            get { return it; }
            set { 
                if ( value == InputType.Brush && value != it)
                    objects = painter.GetObjectData(BrushManager.Instance[currentBrush]);

                it = value;
            } 
        }

        public int currentBrush{
            get { return _currentBrush; }
            set{
                if ( _currentBrush != value )
                    objects = painter.GetObjectData(BrushManager.Instance[value]); 
                
                _currentBrush = value;
            }
        }

        [MenuItem ("Tools/Object Painter")]
        public static void Init()
        {
            ObjectPainterEditor window = (ObjectPainterEditor)EditorWindow.GetWindow (typeof (ObjectPainterEditor));
            window.titleContent.text = "object painter";
            window.painter = new ObjectPainter();
            window.maxSize = new Vector2(401, 401);
            window.minSize = new Vector2(400, 300);
            window.Show();        
        }

        void OnEnable()
        {          
            SceneView.onSceneGUIDelegate += this.OnSceneGUI; 
            objects = new ObjectData[0];   
            
            painter = new ObjectPainter();
            BrushManager.Instance = new BrushManager();

            if( it == InputType.Brush )
			    objects = painter.GetObjectData(BrushManager.Instance[currentBrush]);
        }
        void OnDisable() 
        {
            SceneView.onSceneGUIDelegate -= this.OnSceneGUI;
        }

        void Update()
        {
            if(sceneView != null)
                sceneView.Repaint();
            Repaint();  

            if ( inEditor != BrushEditor.showing)
                objects = painter.GetObjectData(BrushManager.Instance.brushes[currentBrush]);         
        }

        void LateUpdate()
        {
            inEditor = BrushEditor.showing;
        }

        public void OnSceneGUI(SceneView sceneView)
        {                  
            Event e = Event.current;             

            if (e.isKey == true ) 
            {     
                if ( e.type == EventType.KeyDown )
                {
                    if ( e.keyCode == KeyCode.D && panning == false )            
                        paint = true;
                    else if ( e.keyCode == KeyCode.LeftAlt )
                        paint = false;
                }
                else if ( e.type == EventType.KeyUp)
                {
                    if ( e.keyCode == KeyCode.D)
                        paint = false;
                }
            }
            
            if ( e.button == 2 && e.type == EventType.MouseDown )
            {
                panning = true;
                paint = false;
            }
            else if ( e.button == 2 && e.type == EventType.MouseUp)
            {
                panning = false;
            }

            if ( paint == false || painter.Prefab == null)
                return; 
            
            if (mouseOverWindow != null)
                if (mouseOverWindow.titleContent.text != "Scene")
                    return;

            if ( e != null )
            {            
                int controlID = GUIUtility.GetControlID(FocusType.Passive); // get controlID
                GUIUtility.hotControl = controlID; // assign controlID           
                EventType eventType = e.GetTypeForControl(controlID); // get eventtype of focused control 
                
                float scale = (painter.height * painter.scaleOffset); // calc scale for preview line
                Vector3 mp = e.mousePosition; // get mouse position from event        
                mp.y = sceneView.camera.pixelHeight - mp.y; // fix inverted y-coord

                hitInfo = painter.Cast(mp); // get raycast info from painter
                
                if(this.sceneView == null) // assign sceneView to local variable
                    this.sceneView = sceneView; 

                // draw preview handles
                if( inputType ==  InputType.Brush )
                {
                    Handles.color = new Color( 1, 0, 0.5f, 0.2f );
                    Handles.DrawSolidDisc( hitInfo.point, hitInfo.normal, painter.radius / 2.0f );
                    
                    hits = painter.GetCastedPositions(hitInfo.point, objects, hitInfo.normal);

                    /*for ( int i =0; i < objects.Length; ++i )
                    {     
                        if ( objects[i] != null )  
                        {                 
                            Handles.color = new Color( 0, 1, 0, 1 );
                            
                            Handles.DrawLine(
                                hits[i].point, 
                                hits[i].point + (hits[i].normal * objects[i].scale * scale)
                            );
                            
                            Handles.color = new Color( 0, 1, 0, 0.3f);                                                        
                            Handles.DrawSolidDisc( hits[i].point, hits[i].normal, painter.width * painter.scaleOffset );
                        }
                    }*/
                }
                else
                {        
                    Handles.color = new Color( 1, 0, 0.5f, 1 );           
                    Handles.DrawLine( hitInfo.point, hitInfo.point + hitInfo.normal * scale );
                }

                // handle left mouse button events
                if( hitInfo.point != new Vector3(10000,10000,10000) && e.button == 0 )
                {
                    if ( eventType == EventType.MouseUp)
                    {
                        if(inputType == InputType.Drag)
                            lastSpawnPos = new Vector3(10000, 10000, 10000);

                        mouseDown = false;
                    }       
                    else if ( eventType == EventType.MouseDown) 
                        mouseDown = true;             
                         
                    if( inputType == InputType.Drag 
                        && eventType == EventType.MouseDrag 
                        && mouseDown 
                        && (lastSpawnPos - hitInfo.point).magnitude > spacing                         
                    )
                    {                                                                
                        painter.SpawnPrefab(hitInfo.point, hitInfo.normal); 
                        lastSpawnPos = hitInfo.point;                       
                        e.Use();             
                    }
                    else if ( inputType == InputType.Brush && e.type == EventType.MouseDown)
                    {
                        painter.SpawnPrefab(hitInfo.point, objects, hitInfo.normal);
                        objects = painter.GetObjectData(BrushManager.Instance.brushes[currentBrush]);
                        e.Use();
                    }
                    else if (inputType == InputType.Click && e.type == EventType.MouseDown)
                    {           
                        painter.SpawnPrefab(hitInfo.point, hitInfo.normal);               
                        e.Use();
                    }      
                    GUIUtility.hotControl = 0;
                }                
            }
        }

        void OnGUI()
        {        
            if(ToggleButtonStyleNormal == null)// make button style when its null
            {
                ToggleButtonStyleNormal = "Button";        
                ToggleButtonStyleToggled = new GUIStyle(ToggleButtonStyleNormal);
                ToggleButtonStyleToggled.normal.background = ToggleButtonStyleToggled.active.background;
            }
            scrollPos = EditorGUILayout.BeginScrollView(scrollPos);
            
            EditorGUILayout.BeginVertical();                        
                EditorGUI.indentLevel = 0;                        
    
                EditorGUILayout.Separator();
                EditorGUILayout.Separator();

                EditorGUILayout.BeginHorizontal();
                    GUILayout.Button("Paint", 
                        paint? ToggleButtonStyleToggled : ToggleButtonStyleNormal, 
                        GUILayout.MinWidth(40.0f), GUILayout.MaxWidth(40.0f), GUILayout.MinHeight(40.0f), GUILayout.MaxHeight(40.0f)
                    );                
            
					EditorGUILayout.BeginVertical();

					EditorGUILayout.BeginHorizontal();
						EditorGUILayout.LabelField("Prefab:", GUILayout.MaxWidth(45.0f), GUILayout.MinWidth(45.0f));
						painter.Prefab = (GameObject)EditorGUILayout.ObjectField(painter.Prefab, typeof(GameObject), false);
					EditorGUILayout.EndHorizontal();

					EditorGUILayout.BeginHorizontal();
						painter.normalIsUp = EditorGUILayout.Toggle(painter.normalIsUp, GUILayout.MaxWidth(15));
						EditorGUILayout.LabelField("Use normal direction");	
					EditorGUILayout.EndHorizontal();

					EditorGUILayout.EndVertical();
                EditorGUILayout.EndHorizontal();
                			
                EditorGUILayout.Separator();
                
                // input type
                EditorGUILayout.Separator();
                EditorGUILayout.BeginHorizontal();
                    EditorGUILayout.LabelField("Input type: ", GUILayout.MaxWidth(80.0f), GUILayout.MinWidth(80.0f));
                    inputType = (InputType)EditorGUILayout.EnumPopup(inputType);
                    // correct input so brush input is disabled
                    inputType = (inputType == InputType.Brush)? InputType.Click : inputType;
                EditorGUILayout.EndHorizontal();				

				EditorGUILayout.Separator();

                EditorGUILayout.BeginVertical();
					EditorGUI.indentLevel = 1;

					EditorGUILayout.BeginHorizontal();
					Rect rect = EditorGUILayout.GetControlRect();
					
					EditorGUI.LabelField(new Rect(68, rect.y, 60, 40), "Min");
					EditorGUI.LabelField(new Rect( position.width - 55, rect.y, 60, 40), "Max");

					EditorGUILayout.EndHorizontal();

					EditorGUILayout.BeginHorizontal();
                        EditorGUILayout.LabelField("Scale: ", GUILayout.MaxWidth(55.0f), GUILayout.MaxWidth(60.0f));
						minScale = EditorGUILayout.FloatField(minScale, GUILayout.MaxWidth(50));
                        painter.scaleOffset = EditorGUILayout.Slider(painter.scaleOffset, minScale, maxScale);
						maxScale = EditorGUILayout.FloatField(maxScale, GUILayout.MaxWidth(50));
					EditorGUILayout.EndHorizontal();
                    painter.rotationOffset = EditorGUILayout.Vector3Field("Rotation offset", painter.rotationOffset);
                    
                    EditorGUILayout.Separator();

                    // random rotation                    
                    painter.randomRot = EditorGUILayout.Foldout(painter.randomRot, "Random rotation");//, EditorStyles.boldLabel);
                    if(painter.randomRot == true)
                    {
                        EditorGUILayout.BeginVertical();
							rect = EditorGUILayout.GetControlRect();
							EditorGUI.LabelField(new Rect(212, rect.y, 60, 40), "Min");
							EditorGUI.LabelField(new Rect(position.width - 94, rect.y, 60, 40), "Max");
							
							EditorGUILayout.BeginHorizontal();
								EditorGUILayout.LabelField("X:");
								painter.minRot.x = EditorGUILayout.FloatField(painter.minRot.x);
								painter.maxRot.x = EditorGUILayout.FloatField(painter.maxRot.x);
							EditorGUILayout.EndHorizontal();

							EditorGUILayout.BeginHorizontal();
								EditorGUILayout.LabelField("Y:");
								painter.minRot.y = EditorGUILayout.FloatField(painter.minRot.y);
								painter.maxRot.y = EditorGUILayout.FloatField(painter.maxRot.y);
							EditorGUILayout.EndHorizontal();

							EditorGUILayout.BeginHorizontal();
								EditorGUILayout.LabelField("Z:");
								painter.minRot.z = EditorGUILayout.FloatField(painter.minRot.z);
								painter.maxRot.z = EditorGUILayout.FloatField(painter.maxRot.z);
							EditorGUILayout.EndHorizontal();


						EditorGUILayout.EndVertical();
                    }
                    
                    // random scale
                    painter.randomScale = EditorGUILayout.Foldout(painter.randomScale, "Random scale");//, EditorStyles.boldLabel);                                                
                    if(painter.randomScale == true)
                    {
                        EditorGUILayout.BeginVertical();
                            painter.minScale = EditorGUILayout.FloatField("Min", painter.minScale);
                            painter.maxScale = EditorGUILayout.FloatField("Max", painter.maxScale);
                        EditorGUILayout.EndVertical();
                    }
                    
                    for(int i = 0; i < 2; ++i)
                        EditorGUILayout.Separator();

                    EditorGUILayout.BeginHorizontal();
                        EditorGUILayout.LabelField("Ground offset: ", GUILayout.MaxWidth(100.0f));
                        painter.indent = EditorGUILayout.Slider(painter.indent, -3, 3);
                    EditorGUILayout.EndHorizontal();

                    if( inputType == InputType.Drag)
                    {
                        EditorGUILayout.BeginHorizontal();
                            EditorGUILayout.LabelField("Spacing:", GUILayout.MaxWidth(80.0f));
                            spacing = EditorGUILayout.Slider(spacing, 0.1f, 2.0f);                    
                        EditorGUILayout.EndHorizontal();
                    }
                    else if ( inputType == InputType.Brush )
                    {
                        float oldR = painter.radius;
                        painter.radius = EditorGUILayout.Slider("Brush size:", painter.radius, 1, 40);

                        if( oldR != painter.radius )
                            objects = painter.GetObjectData(BrushManager.Instance.brushes[currentBrush]);

                        if( GUILayout.Button("Randomize", GUILayout.MinHeight(16.0f), GUILayout.MaxWidth(80.0f)) ) 
                        {                            
                            objects = painter.GetPositions();
                        }

                        EditorGUILayout.BeginHorizontal();
                        if(GUILayout.Button("BrushEditor", GUILayout.MinHeight(16.0f), GUILayout.MaxWidth(80.0f)) && BrushEditor.showing == false) 
                        {                            
                            BrushEditor.showing = true;
                            BrushEditor.Init();
                        } 

                        currentBrush = EditorGUILayout.Popup( currentBrush, BrushManager.Instance.GetNameList(), GUILayout.MinHeight(10.0f) );
                        

                        EditorGUILayout.EndHorizontal();
                    }

                EditorGUILayout.EndVertical();
                
                EditorGUILayout.Separator();
                EditorGUILayout.Separator();
                EditorGUILayout.Separator();
            EditorGUILayout.EndVertical();
            
            EditorGUILayout.EndScrollView();
        }

    }
}