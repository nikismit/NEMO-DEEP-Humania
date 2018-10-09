using System.Collections;
using System.Collections.Generic;
using UnityEngine;
//using UnityEngine.PostProcessing;

public class BreathBalls : MonoBehaviour {


    public GameObject breathBall;
    public int NumberOfBreaths = 64;
    public float radius = 1f;

    public int currentBreath = 0;

    public List<GameObject> breathBalls = new List<GameObject>();

    public AudioSource finalBreaths;

    //public PostProcessingProfile pp;


	// Use this for initialization
	void Start () {
        SpawnBreathBalls();

        Output._instance.breathComplete += DropBreathBall;
	}
	
	// Update is called once per frame
	void Update () {
		
	}

    void SpawnBreathBalls()
    {
        float angleIncrement = 360f / NumberOfBreaths;

        for (int i = 0; i < NumberOfBreaths; i++)
        {
            float angle = angleIncrement * i;
            Vector3 pos = transform.position;
            pos.x += radius * Mathf.Sin(angle * Mathf.Deg2Rad);
            pos.z += radius * Mathf.Cos(angle * Mathf.Deg2Rad);

            GameObject bb = Instantiate(breathBall, pos, transform.rotation) as GameObject;
            bb.transform.parent = transform.parent;
            breathBalls.Add(bb);
        }
    }

    void DropBreathBall()
    {
        if (currentBreath < NumberOfBreaths)
        {
            breathBalls[currentBreath].transform.parent = null;
            Rigidbody rb = breathBalls[currentBreath].AddComponent<Rigidbody>();
            rb.mass = 10f;
            breathBalls[currentBreath].GetComponent<Collider>().enabled = true;
            currentBreath++;
            if (NumberOfBreaths - currentBreath < 3)
                finalBreaths.Play();
        }
        else
        {
            finalBreaths.Play();
            GameOver();
        }
    }

    void GameOver()
    {
        print("Game Over");
        //var vig = pp.vignette.settings;
        //vig.opacity += 0.2f;
        //pp.vignette.settings = vig;
        //pp.vignette.enabled = true;
       // StartCoroutine(getDarker());

    }


    //IEnumerator getDarker()
    //{
       // print("starting");
        //var vig = pp.vignette.settings;
        //float t = vig.opacity + 0.3f;
        //while (vig.opacity < t)
       // {
            //print("step");
           // vig.opacity = Mathf.Lerp(vig.opacity, t, 1 * Time.deltaTime);
            //pp.vignette.settings = vig;
           // yield return null;
       // }
    //}

    void OnDisable()
    {
        //var vig = pp.vignette.settings;
        //vig.opacity = 0f;
        ////pp.vignette.settings = vig;
        //pp.vignette.enabled = false;
    }
}
