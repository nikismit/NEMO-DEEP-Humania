using UnityEngine;
using System.Collections;

public class EmitOnLandEvent : MonoBehaviour {

    EllipsoidParticleEmitter particle;
    
	// Use this for initialization
	void Start () {
        particle = GetComponentInChildren<EllipsoidParticleEmitter>();
        pop();
	}
	
    void OnTriggerEnter()
    {
        //todo: check lable
        LandEvent.onLand += pop;
    }

    void OnTriggerExit()
    {
        LandEvent.onLand -= pop;
    }

	void pop()
    {
        particle.Emit();
    }

}
