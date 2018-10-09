using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace BGE.Forms
{
    [RequireComponent(typeof(SchoolGenerator))]
    public class SchoolController : MonoBehaviour
    {

        // Use this for initialization
        void Start()
        {

        }

        // Update is called once per frame
        void Update()
        {
            if (Input.GetKeyDown(KeyCode.L))
            {
                GetComponent<SchoolGenerator>().SpawnSchool(20);
                CreatureManager.Instance.boids = FindObjectsOfType<Boid>(); // Find all the boids
                foreach (Boid boid in CreatureManager.Instance.boids)
                {
                    boid.multiThreaded = true;
                }
            }
        }
    }
}
