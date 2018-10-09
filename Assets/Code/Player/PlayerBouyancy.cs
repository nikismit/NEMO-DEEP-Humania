using UnityEngine;
using System.Collections;

public class PlayerBouyancy : MonoBehaviour
{ 
    public ForceMode theMode;

    public float grav       = -5f;
    public float upForce    = 8f;

    public float empty = 0.2f;
    public float nutral = 0.5f;
    public float nutralDeadZone = 0.025f;
    public float full = 0.7f;

    private float bouyancy;

    private Rigidbody rb;

    private float fullness;

	// Use this for initialization
	void Start () 
    {
        rb = GetComponent<Rigidbody>();
	}
	
	// Update is called once per frame
	void FixedUpdate () {

        fullness = Output._instance.fullness;

        if(fullness < empty)
        {
            bouyancy = grav;
        }
        else if(fullness < nutral - nutralDeadZone )
        {
            float range =  (nutral - nutralDeadZone) - empty;
            float value = fullness - empty;
            bouyancy = Mathf.Lerp( grav, 0, value / range);
        }
        else if(fullness < nutral + nutralDeadZone )
        {
            bouyancy = 0;
        }
        else if(fullness < full)
        {
            float range = full - ( nutral + nutralDeadZone );
            float value = fullness - nutral + nutralDeadZone;
            bouyancy = Mathf.Lerp(0, upForce, value / range);
        }
        else
        {
            bouyancy = upForce;
        }

        rb.AddForce(Vector3.up * bouyancy, theMode);

        /*
        rb.AddForce(Vector3.up * grav);

        if (pc.fullness > threshHold)
        {
            rb.AddForce(Vector3.up * upForce, theMode);
            Debug.Log("trying to push up");
        }
        */
	}
}
