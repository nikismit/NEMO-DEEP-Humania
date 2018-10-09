///////////////////////////////////
// HELLO!
// 
// This is a script to link a shader of an object to the players breath
//
// 1 - create your shader. 
//          I recomend doing it with a slider node to begin with
//          make sure the range of the slider is from 0 - 1 to create the effect you desire
//          this is for testing, you will be replacing it in step 2
// 2 - add a Value Node and give it a unique name
//          the Unique Name is very important!!!!
// 3 - add this script to the same object as the shader
// 4 - in Unity, replace the NODE NAME variable name of your Node from step 2
//          maske sure it matches exactly!!!!
// 5 - ENJOY!       
///////////////////////////////////


using UnityEngine;

public class MutateShaderWithBreath : MonoBehaviour
{
    public string NodeName = "Enter the name of the node here";

	void Update ()
    {
        Shader.SetGlobalFloat(NodeName, (Controller._instance.fullness ));
	}
}
