using UnityEngine;
using System.Collections;

public class LookAtPlayer : MonoBehaviour {

    public Transform player;
    public float LookSpeed = 0.5f;
    public float noticeRadius = 5f;

    private Quaternion rotationToPlayer;
    private Vector3 myPosition; 

    void Start()
    {
        if (player == null)
            player = GameObject.Find("Player Single").transform;
        myPosition = transform.position;

    }

    void Update()
    {
        // instant look at
        // not good
        //transform.LookAt(player);


        if (Vector3.Distance(myPosition, player.position) < noticeRadius)
        {
            // slow look at
            rotationToPlayer = Quaternion.LookRotation(-(player.position - myPosition));
            transform.rotation = Quaternion.Slerp(transform.rotation, rotationToPlayer, LookSpeed * Time.deltaTime);
        }
        
    }
}
