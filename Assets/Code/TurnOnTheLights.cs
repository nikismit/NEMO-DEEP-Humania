using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TurnOnTheLights : MonoBehaviour {

    public Color Sky;
    public Color Equator;
    public Color Ground;

    public Color Fog;

    [Range (0.0f, 30.0f)]
    public float lightOnTime = 5f;

    public SteamVR_TrackedController left;
    public SteamVR_TrackedController right;

    // Use this for initialization
    void Start () {
        Sky = RenderSettings.ambientSkyColor;
        Equator = RenderSettings.ambientEquatorColor;
        Ground = RenderSettings.ambientGroundColor;

        Fog = RenderSettings.fogColor;

        Invoke("TurnOff", 2f);

        TurnOff();

        if(left != null)
            left.TriggerClicked += TurnOn;
        if(right != null)
            right.TriggerClicked += TurnOn;
	}

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.L))
            TurnOnKey();
    }


    void TurnOff()
    {
        RenderSettings.ambientSkyColor = Color.black;
        RenderSettings.ambientEquatorColor = Color.black;
        RenderSettings.ambientGroundColor = Color.black;

        RenderSettings.fogColor = Color.black;
        RenderSettings.fogDensity = 0.015f;
    }

    void TurnOn(object sender, ClickedEventArgs e)
    {
        RenderSettings.ambientSkyColor = Sky;
        RenderSettings.ambientEquatorColor = Equator;
        RenderSettings.ambientGroundColor = Ground;

        RenderSettings.fogColor = Fog;
        RenderSettings.fogDensity = 0.005f;

        Invoke("TurnOff", lightOnTime);

    }


    void TurnOnKey()
    {
        RenderSettings.ambientSkyColor = Sky;
        RenderSettings.ambientEquatorColor = Equator;
        RenderSettings.ambientGroundColor = Ground;

        RenderSettings.fogColor = Fog;
        RenderSettings.fogDensity = 0.005f;

        Invoke("TurnOff", lightOnTime);

    }

}
