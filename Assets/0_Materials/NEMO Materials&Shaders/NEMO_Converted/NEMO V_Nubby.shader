// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "NEMO/NEMO V_Nubbyplants"
{
	Properties
	{
		_Color1("Color 1", Color) = (0,0,0,0)
		_Breathvalue("Breath value", Range( 0 , 1)) = 0
		_Color2("Color 2", Color) = (0,0,0,0)
		_Color3("Color 3", Color) = (0,0,0,0)
		_Color4("Color 4", Color) = (0,0,0,0)
		_Gradientloc("Gradient loc", Range( -2 , 2)) = 0
		_Gradientamountwobble("Gradient amount wobble", Range( 0 , 8)) = 0
		_Speed("Speed", Range( 0 , 5)) = 0
		_Brightnesswobble("Brightness wobble", Range( 0 , 5)) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows vertex:vertexDataFunc 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform float _Brightnesswobble;
		uniform float4 _Color3;
		uniform float4 _Color4;
		uniform float _Gradientamountwobble;
		uniform float _Speed;
		uniform float4 _Color1;
		uniform float _Gradientloc;
		uniform float4 _Color2;
		uniform float _Breathvalue;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 lerpResult19 = lerp( float3(0,0,0) , float3(1,1,1) , v.texcoord.xy.y);
			float clampResult26 = clamp( (0.0 + (sin( ( _Gradientamountwobble * ( (v.texcoord.xy).x + ( _Time.x * _Speed ) ) * 6.28318548202515 ) ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) , 0.0 , 1.0 );
			float4 lerpResult23 = lerp( _Color3 , _Color4 , clampResult26);
			v.vertex.xyz += ( float4( lerpResult19 , 0.0 ) * ( _Brightnesswobble * lerpResult23 ) ).rgb;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			o.Albedo = _Color1.rgb;
			float clampResult10 = clamp( ( (0.75 + (i.uv_texcoord.y - 0.0) * (0.25 - 0.75) / (1.0 - 0.0)) + _Gradientloc ) , 0.0 , 1.0 );
			float3 lerpResult3 = lerp( float3(1,1,1) , float3(0,0,0) , clampResult10);
			o.Emission = ( float4( lerpResult3 , 0.0 ) * _Color2 * ( _Breathvalue + 0.5 ) ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15600
750;451;983;918;1207.443;134.2568;1;True;True
Node;AmplifyShaderEditor.RangedFloatNode;36;-2303.546,1440.545;Float;False;Property;_Speed;Speed;7;0;Create;True;0;0;False;0;0;2.98;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;38;-2302.546,1088.545;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TimeNode;35;-2303.546,1281.545;Float;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;37;-2046.546,1089.545;Float;False;True;False;True;True;1;0;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;33;-2048.546,1280.545;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;30;-1823.747,1024.245;Float;False;Property;_Gradientamountwobble;Gradient amount wobble;6;0;Create;True;0;0;False;0;0;2.74;0;8;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;31;-1791.546,1097.545;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TauNode;32;-1791.546,1186.545;Float;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;29;-1534.546,1090.545;Float;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;16;-1662.457,-254.088;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SinOpNode;28;-1407.546,1089.545;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;15;-1407.458,-223.188;Float;False;True;False;False;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;13;-1216.458,-65.58794;Float;False;Property;_Gradientloc;Gradient loc;5;0;Create;True;0;0;False;0;0;0.25;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;27;-1279.546,1088.545;Float;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;14;-1216.057,-223.4879;Float;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.75;False;4;FLOAT;0.25;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;26;-1023.665,1089.175;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;24;-1023.966,736.6041;Float;False;Property;_Color3;Color 3;3;0;Create;True;0;0;False;0;0,0,0,0;1,1,1,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;25;-1023.966,897.6041;Float;False;Property;_Color4;Color 4;4;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;11;-894.7579,-93.78788;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;10;-766.7567,-93.98771;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;8;-767.0565,-383.3874;Float;False;Constant;_Vector0;Vector 0;0;0;Create;True;0;0;False;0;1,1,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Vector3Node;20;-894.298,320.0346;Float;False;Constant;_Vector2;Vector 2;0;0;Create;True;0;0;False;0;0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Vector3Node;21;-894.2979,457.8345;Float;False;Constant;_Vector3;Vector 3;0;0;Create;True;0;0;False;0;1,1,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.LerpOp;23;-639.9656,737.6041;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;22;-766.9656,640.6041;Float;False;Property;_Brightnesswobble;Brightness wobble;8;0;Create;True;0;0;False;0;0;0.03;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;9;-767.0561,-244.1874;Float;False;Constant;_Vector1;Vector 1;0;0;Create;True;0;0;False;0;0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;6;-825,135;Float;False;Property;_Breathvalue;Breath value;1;0;Create;True;0;0;False;0;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;4;-513,0;Float;False;Property;_Color2;Color 2;2;0;Create;True;0;0;False;0;0,0,0,0;1,0.9803922,0.8078431,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;18;-448.1982,512.8345;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;5;-512,161;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;19;-451.1982,352.8345;Float;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;3;-512,-256;Float;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;17;-257.4671,346.4531;Float;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;1;-256,-255;Float;False;Property;_Color1;Color 1;0;0;Create;True;0;0;False;0;0,0,0,0;0.4549019,0.7960784,1,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2;-256,0;Float;False;3;3;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;NEMO/NEMO V_Nubbyplants;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;37;0;38;0
WireConnection;33;0;35;1
WireConnection;33;1;36;0
WireConnection;31;0;37;0
WireConnection;31;1;33;0
WireConnection;29;0;30;0
WireConnection;29;1;31;0
WireConnection;29;2;32;0
WireConnection;28;0;29;0
WireConnection;15;0;16;2
WireConnection;27;0;28;0
WireConnection;14;0;15;0
WireConnection;26;0;27;0
WireConnection;11;0;14;0
WireConnection;11;1;13;0
WireConnection;10;0;11;0
WireConnection;23;0;24;0
WireConnection;23;1;25;0
WireConnection;23;2;26;0
WireConnection;18;0;22;0
WireConnection;18;1;23;0
WireConnection;5;0;6;0
WireConnection;19;0;20;0
WireConnection;19;1;21;0
WireConnection;19;2;16;2
WireConnection;3;0;8;0
WireConnection;3;1;9;0
WireConnection;3;2;10;0
WireConnection;17;0;19;0
WireConnection;17;1;18;0
WireConnection;2;0;3;0
WireConnection;2;1;4;0
WireConnection;2;2;5;0
WireConnection;0;0;1;0
WireConnection;0;2;2;0
WireConnection;0;11;17;0
ASEEND*/
//CHKSM=ABF56F4B963F76674F2028DA5E3FDBDDA20DD7E5