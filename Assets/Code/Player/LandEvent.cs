using UnityEngine;
using System.Collections;
using UnityStandardAssets.Utility;



    public class LandEvent : MonoBehaviour
    {

        public delegate void playerAction();
        public static event playerAction onLand;
        public RigidbodyFirstPersonController rb;

        private bool wasGroundedOnTheLastFrame = false;


        void Start()
        {
            rb = GetComponent<RigidbodyFirstPersonController>();
            onLand += tempFunction;
        }


        // Update is called once per frame
        void Update()
        {
            if ( !wasGroundedOnTheLastFrame && rb.Grounded )
                if( onLand != null)
                    onLand();

            wasGroundedOnTheLastFrame = rb.Grounded;
        
             
        }

        void tempFunction()
        {
            Debug.Log("landed");
        }
    }


