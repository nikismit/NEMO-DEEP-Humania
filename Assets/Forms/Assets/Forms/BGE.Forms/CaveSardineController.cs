﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace BGE.Forms
{
    public class CaveSardineController : MonoBehaviour
    {
        Boid boid;
        GameObject player;
        public enum State { idle, curious };
        public State state;

        void IdleState()
        {
            //Debug.Log("Idle State");
            boid.GetComponent<JitterWander>().Activate(true);
            boid.GetComponent<Seek>().Activate(false);
            boid.GetComponent<Constrain>().Activate(true);
            Invoke("CuriousState", Random.Range(10, 20));
            state = State.idle;
        }

        void CuriousState()
        {
            //Debug.Log("Curious State");
            boid.GetComponent<Constrain>().Activate(false);
            //boid.GetComponent<JitterWander>().Activate(false);
            boid.GetComponent<Seek>().Activate(true);
            boid.GetComponent<Seek>().targetGameObject = player;
            state = State.curious;
            Invoke("IdleState", Random.Range(10, 20));
        }

        // Use this for initialization
        void Start()
        {
            boid = GetComponent<Boid>();
            player = GameObject.FindGameObjectWithTag("Player");
            IdleState();
        }

        // Update is called once per frame
        void Update()
        {
            if (state == State.curious)
            {
                float dist = Vector3.Distance(this.transform.position, player.transform.position);
                if (dist < 100)
                {
                    IdleState();
                }
            }
        }
    }
}
