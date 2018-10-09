using UnityEngine;
using System.Collections;
using UnityStandardAssets.Utility;

namespace UnityStandardAssets.Characters.FirstPerson
{
    public class LandingHeadBob : MonoBehaviour
    {

        private Animator anim;
        public LerpControlledBob jumpAndLandingBob = new LerpControlledBob();
        
        // Use this for initialization
        void Start()
        {
            anim = GetComponent<Animator>();
            //DoHeadBob();
        }

        void OnEnable()
        {
            LandEvent.onLand += DoHeadBob;
        }

        void OnDisable()
        {
            LandEvent.onLand -= DoHeadBob;
        }

        void DoHeadBob()
        {
            anim.SetTrigger("doBob");
            Debug.Log("trying to jump");
        }
    }
}
