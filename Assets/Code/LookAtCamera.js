private var cameraToLookAt : Camera;

var startRotation;

function Start()
{
	cameraToLookAt = Camera.main;
	startRotation = transform.eulerAngles;
}

function Update() {
	var v : Vector3 = cameraToLookAt.transform.position - transform.position;	
	//transform.forward = v + Vector3( 0, 1, 0 );
	//transform.eulerAngles += startRotation;

	v.x = v.z = 0.0;
	transform.LookAt(cameraToLookAt.transform.position - v); 
}