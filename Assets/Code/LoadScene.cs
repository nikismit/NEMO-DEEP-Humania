using UnityEngine;
using System.Collections;

public class LoadScene : MonoBehaviour 
{
    public void loadScene(string sceneToLoad)
    {
        Application.LoadLevel(sceneToLoad);
    }
	
}
