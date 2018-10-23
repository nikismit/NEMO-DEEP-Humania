using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PingpongAxis : MonoBehaviour {

    private Transform attacher;
    public int height = 10;//max height of Box's movement
    public float zCenter = 0f;

    // Use this for initialization
    void Start()
    {
        attacher = this.transform.Find("PingpongAxis");
    }

    // Update is called once per frame
    void Update()
    {
        transform.position = new Vector3(transform.position.y, zCenter + Mathf.PingPong(Time.time * 2, height) - height / 2f, transform.position.y);//move on y axis only
                                                                                                                                                  //Box is moving with Mathf.PingPong (http://docs.unity3d.com/Documentation/ScriptReference/Mathf.PingPong.html)
    }
}
