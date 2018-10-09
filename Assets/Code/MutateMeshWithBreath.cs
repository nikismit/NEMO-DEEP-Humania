using UnityEngine;
using System.Collections;

public class MutateMeshWithBreath : MonoBehaviour
{

    private SkinnedMeshRenderer smr;

    void Start()
    {
        smr = GetComponent<SkinnedMeshRenderer>();
    }

    void Update()
    {
        smr.SetBlendShapeWeight(0, 100 - (Output._instance.fullness * 100));
    }
	
}
