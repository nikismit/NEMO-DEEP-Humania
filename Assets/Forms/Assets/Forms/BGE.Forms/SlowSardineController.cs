using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace BGE.Forms
{
    public class SlowSardineController : MonoBehaviour
    {
        System.Collections.IEnumerator AdjustSpeed()
        {
            Boid boid = GetComponent<Boid>();
            float originalSpeed = boid.maxSpeed;
            while (true)
            {
                boid.maxSpeed = originalSpeed * Random.Range(0.8f, 1.2f);
                yield return new WaitForSeconds(Random.Range(2, 4));
            }
        }
        // Use this for initialization
        void Start()
        {

        }

        // Update is called once per frame
        void Update()
        {

        }
    }
}
