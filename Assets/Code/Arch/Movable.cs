using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Movable : MonoBehaviour {



        private Transform startParent;
        public bool canGrip;
        public bool moving = false;

        private SteamVR_TrackedController controller;

        void Start()
        {
            startParent = transform.parent;
        }

        void OnTriggerEnter(Collider other)
        {
            if (other.GetComponent<SteamVR_TrackedController>() != null)
            {
                canGrip = true;
                controller = other.GetComponent<SteamVR_TrackedController>();
            }
        }

        void OnTriggerExit(Collider other)
        {
            if (other.GetComponent<SteamVR_TrackedController>() != null)
            {
                canGrip = false;
                //controller = null;
            }
        }


        void Update()
        {
            if (canGrip && controller.gripped && !moving)
            {
                transform.parent = controller.transform;
                moving = true;
            }
            if (moving && !controller.gripped)
            {
                moving = false;
                transform.parent = startParent;
            }
        }

    


}
