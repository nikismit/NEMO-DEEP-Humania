using UnityEngine;
using System.Collections.Generic;

namespace BGE.Forms
{
    public class SpineAnimator : MonoBehaviour {

        public enum AlignmentStrategy { LookAt, AlignToHead, LocalAlignToHead }
        public AlignmentStrategy alignmentStrategy = AlignmentStrategy.LookAt;
        public bool autoAssignBones = true;    

        public List<GameObject> bones = new List<GameObject>();

        List<Vector3> bondOffsets = new List<Vector3>();
        List<Quaternion> startRotations = new List<Quaternion>();

        public List<JointParam> jointParams = new List<JointParam>();

        public float bondDamping = 10;
        public float angularBondDamping = 12;

        [HideInInspector]
        public Vector3 centerOfMass;
        [HideInInspector]
        public Quaternion averageRotation;

        /*
        public int updatesPerSecond = 60;
        System.Collections.IEnumerator Animate()
        {
            while (true)
            {
                Transform prevFollower;
                for (int i = 0; i < bones.Count; i++)
                {
                    if (i == 0)
                    {
                        prevFollower = this.transform;
                    }
                    else
                    {
                        prevFollower = bones[i - 1].transform;
                    }

                    Transform follower = bones[i].transform;

                    DelayedMovement(prevFollower, follower, bondOffsets[i], i);
                }
                yield return new WaitForSeconds(1.0f / (float)updatesPerSecond);
            }
        }
        */

        void Start()
        {
            Transform prevFollower;
            bondOffsets.Clear();

            if (autoAssignBones)
            {
                bones.Clear();
                startRotations.Add(transform.rotation);
                Transform parent = (transform.parent.childCount > 1) ? transform.parent : transform.parent.parent;
                for (int i = 0; i < transform.parent.childCount; i++)
                {
                    GameObject child = transform.parent.GetChild(i).gameObject;
                    if (child != this.gameObject)
                    {
                        bones.Add(child);
                        startRotations.Add(child.transform.rotation);
                    }
                }
            }

            for (int i = 0; i < bones.Count; i++)
            {
                if (i == 0)
                {
                    prevFollower = this.transform;
                }
                else
                {
                    prevFollower = bones[i - 1].transform;
                }

                Transform follower = bones[i].transform;
                Vector3 offset = follower.position - prevFollower.position;
                offset = Quaternion.Inverse(prevFollower.transform.rotation) * offset;
                bondOffsets.Add(offset);

            }
            //StartCoroutine(Animate());
        }

        void Update()
        {
            Transform prevFollower;
            for (int i = 0; i < bones.Count; i++)
            {
                if (i == 0)
                {
                    prevFollower = this.transform;
                }
                else
                {
                    prevFollower = bones[i - 1].transform;
                    // Must do this more beautifully.
                    if (jointParams.Count > i)
                    {
                        JointParam jp = jointParams[i];
                        if (jp.alignToHead)
                        {
                            prevFollower = this.transform;
                        }
                    }
                }

                Transform follower = bones[i].transform;

                DelayedMovement(prevFollower, follower, bondOffsets[i], i);
            }
        }
    
        void DelayedMovement(Transform target, Transform follower, Vector3 bondOffset, int i)
        {
            float bondDamping;
            float angularBondDamping;

            if (jointParams.Count > i)
            {
                JointParam jp = jointParams[i];
                bondDamping = jp.bondDamping;
                angularBondDamping = jp.angularBondDamping;
            }
            else
            {
                bondDamping = this.bondDamping;
                angularBondDamping = this.angularBondDamping;
            }

        
            Vector3 wantedPosition = Utilities.TransformPointNoScale(bondOffset, target.transform);
            follower.transform.position = Vector3.Lerp(follower.transform.position, wantedPosition, Time.deltaTime * bondDamping);

            Quaternion wantedRotation;
            switch (alignmentStrategy)
            {

                case AlignmentStrategy.LookAt:
                    wantedRotation = Quaternion.LookRotation(target.position - follower.transform.position, target.up);
                    follower.transform.rotation = Quaternion.Slerp(follower.transform.rotation, wantedRotation, Time.deltaTime * angularBondDamping);
                    break;
                case AlignmentStrategy.AlignToHead:
                    wantedRotation = target.transform.rotation;
                    follower.transform.rotation = Quaternion.Slerp(follower.transform.rotation, wantedRotation, Time.deltaTime * angularBondDamping);
                    break;
                case AlignmentStrategy.LocalAlignToHead:
                    wantedRotation = target.transform.localRotation;
                    follower.transform.localRotation = Quaternion.Slerp(follower.transform.localRotation, wantedRotation, Time.deltaTime * angularBondDamping);
                    break;
            }
        }
    }

    [System.Serializable]
    public class JointParam
    {
        public float bondDamping = 25;
        public float angularBondDamping = 2;
        public bool alignToHead = false;

        public JointParam(float bondDamping, float angularBondDamping, bool alignToHead)
        {
            this.bondDamping = bondDamping;
            this.angularBondDamping = angularBondDamping;
            this.alignToHead = alignToHead;
        }
    }
}