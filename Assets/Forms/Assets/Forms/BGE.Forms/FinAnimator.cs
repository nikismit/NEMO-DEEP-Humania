using UnityEngine;
using System.Collections;

namespace BGE.Forms
{
    public class FinAnimator : Animator {

        public enum Axis {X, Y, Z};
        public Axis axis = Axis.X;
        public enum Side { left, right , tail};
        public Side side = Side.left;
        private Harmonic harmonic;

        [Range(0.0f, Utilities.TWO_PI)]
        public float theta = 0;
        float initialAmplitude;
        public float amplitude = 40.0f;

        public float rotationOffset = 220;

        public float angleDamping = 1.0f;

        [Range(0, 8)]
        public float wigglyness = 1;

        public bool flipDirection = false;
        // Use this for initialization
        void Start () {
            if (boid != null)
            {
                harmonic = boid.GetComponent<Harmonic>();
                if (harmonic != null)
                {
                    initialAmplitude = harmonic.amplitude;
                    theta = harmonic.theta;
                }
            }
        }

        public float bankThreshold = 5.0f;

        [HideInInspector]
        public float lerpedAmplitude;

        [HideInInspector]
        public float lerpedAngle = 0;

        // Update is called once per frame
        void Update () {        
            if (harmonic != null)
            {
                theta = harmonic.theta;
                float offset = rotationOffset * Mathf.Deg2Rad;

                lerpedAmplitude = Mathf.Lerp(lerpedAmplitude, amplitude, Time.deltaTime);

                float angle;


                // Are we Banking?
                if (((side == Side.left && boid.bank < -bankThreshold) || (side == Side.right && boid.bank > bankThreshold)))
                {
                    angle = Mathf.Sin((Mathf.PI * wigglyness + offset))
              * (harmonic.rampedAmplitude / initialAmplitude) * lerpedAmplitude;
                }
                else
                {
                    angle = Mathf.Sin((theta * wigglyness + offset))
              * (harmonic.rampedAmplitude / initialAmplitude) * lerpedAmplitude;
                    
                }
                angle = flipDirection ? -angle : angle;

                lerpedAngle = Mathf.Lerp(lerpedAngle, angle, Time.deltaTime * angleDamping);

                switch (axis)
                {
                    case Axis.X:
                        transform.localRotation = Quaternion.Euler(lerpedAngle, 0, 0);
                        break;
                    case Axis.Y:
                        transform.localRotation = Quaternion.Euler(0, lerpedAngle, 0);
                        break;
                    case Axis.Z:
                        transform.localRotation = Quaternion.Euler(0, 0, lerpedAngle);
                        break;
                }
            }
        }
    }
}