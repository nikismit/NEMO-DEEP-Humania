using UnityEngine;
using System.Collections;
using System;

namespace BGE.Forms
{
    public class Formation : SteeringBehaviour
    {
        public Boid leaderBoid;
        public Vector3 offset;
        private Vector3 targetPos;
        public bool useDeadReconing = false;

        public float reformationDistance = 10.0f;


        public void Start()
        {
            base.Awake();
            offset = transform.position - leaderBoid.transform.position;
            offset = Quaternion.Inverse(leaderBoid.transform.rotation) * offset;
            targetPos = transform.position;
        }

         public void OnDrawGizmos()
        {
            if (isActiveAndEnabled && CreatureManager.drawGizmos && leaderBoid != null)
            {
                Gizmos.color = Color.magenta;
                if (Application.isPlaying)
                {
                    Gizmos.DrawLine(transform.position, targetPos);
                }
                Gizmos.color = Color.magenta;
                Gizmos.DrawLine(transform.position, leaderBoid.transform.position);
            }
        }

        public override Vector3 Calculate()
        {
            if (leaderBoid != null)
            {
                Vector3 newTarget = leaderBoid.TransformPoint(offset);
                //newTarget.y = leaderBoid.position.y + offset.y;

                if (useDeadReconing)
                {
                    float dist = Vector3.Distance(boid.position, leaderBoid.position);
                    float lookAhead = (dist / boid.maxSpeed);
                    newTarget = newTarget + (lookAhead * leaderBoid.velocity);
                }
                targetPos = Vector3.Lerp(targetPos, newTarget, boid.TimeDelta * 0.2f);

                return boid.ArriveForce(targetPos, 5, 5f);
            }
            else
            {
                return Vector3.zero;
            }
        }
    }
}