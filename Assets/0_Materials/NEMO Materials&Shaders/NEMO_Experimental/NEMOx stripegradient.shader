// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "NEMO/NEMOx stripegradient"
{
	Properties
	{
		_Breathvalue("Breath value", Range( 0 , 2)) = 0
		_Stripecolor("Stripe color", Color) = (1,0,0,0)
		_Stripeintensity("Stripe intensity", Range( 0 , 5)) = 0
		_Distribution("Distribution", Range( 0 , 1)) = 0.2
		_StartPoint("Start Point", Range( -5 , 5)) = -0.3069279
		[KeywordEnum(X,Y,Z)] _Orientation("Orientation", Float) = 0
		[Toggle(_CLEANCUT_ON)] _Cleancut("Clean cut?", Float) = 0
		[Toggle(_BREATHINGAFFECTSDISTRIBUTION_ON)] _Breathingaffectsdistribution("Breathing affects distribution", Float) = 0
		_Color0("Color 0", Color) = (0,0,0,0)
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 4.6
		#pragma shader_feature _CLEANCUT_ON
		#pragma shader_feature _ORIENTATION_X _ORIENTATION_Y _ORIENTATION_Z
		#pragma shader_feature _BREATHINGAFFECTSDISTRIBUTION_ON
		#pragma surface surf Standard keepalpha noshadow vertex:vertexDataFunc 
		struct Input
		{
			float3 worldPos;
		};

		uniform float _Breathvalue;
		uniform float4 _Color0;
		uniform float4 _Stripecolor;
		uniform float _Stripeintensity;
		uniform float _StartPoint;
		uniform float _Distribution;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 ase_vertex3Pos = v.vertex.xyz;
			v.vertex.xyz += ( _Breathvalue * ase_vertex3Pos );
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			o.Albedo = _Color0.rgb;
			float4 _Basecolor = float4(0,0,0,0);
			float3 ase_vertex3Pos = mul( unity_WorldToObject, float4( i.worldPos , 1 ) );
			#if defined(_ORIENTATION_X)
				float staticSwitch108 = ase_vertex3Pos.x;
			#elif defined(_ORIENTATION_Y)
				float staticSwitch108 = ase_vertex3Pos.y;
			#elif defined(_ORIENTATION_Z)
				float staticSwitch108 = ase_vertex3Pos.z;
			#else
				float staticSwitch108 = ase_vertex3Pos.x;
			#endif
			#ifdef _BREATHINGAFFECTSDISTRIBUTION_ON
				float staticSwitch114 = ( _Breathvalue * _Distribution );
			#else
				float staticSwitch114 = _Distribution;
			#endif
			float temp_output_100_0 = saturate( ( ( ( staticSwitch108 + _StartPoint ) + ( staticSwitch114 / 2.0 ) ) / staticSwitch114 ) );
			float4 lerpResult83 = lerp( _Basecolor , ( _Stripecolor * _Stripeintensity * _Breathvalue ) , temp_output_100_0);
			float4 lerpResult85 = lerp( lerpResult83 , _Basecolor , temp_output_100_0);
			#ifdef _CLEANCUT_ON
				float4 staticSwitch111 = round( lerpResult85 );
			#else
				float4 staticSwitch111 = lerpResult85;
			#endif
			o.Emission = staticSwitch111.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15600
7;29;1906;1004;1388.018;798.3087;1;True;False
Node;AmplifyShaderEditor.RangedFloatNode;88;-1793.23,385.3416;Float;False;Property;_Distribution;Distribution;3;0;Create;True;0;0;False;0;0.2;0.29;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;109;-1791.163,-127.1741;Float;False;Property;_Breathvalue;Breath value;0;0;Create;True;0;0;False;0;0;0.788;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;105;-2048.325,1.12923;Float;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;115;-1471.348,319.9377;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;108;-1792.502,128.8983;Float;False;Property;_Orientation;Orientation;5;0;Create;True;0;0;False;0;0;0;2;True;;KeywordEnum;3;X;Y;Z;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;87;-1793.551,290.5405;Float;False;Property;_StartPoint;Start Point;4;0;Create;True;0;0;False;0;-0.3069279;-0.6;-5;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;114;-1280.263,351.8758;Float;False;Property;_Breathingaffectsdistribution;Breathing affects distribution;7;0;Create;True;0;0;False;0;0;0;0;True;;Toggle;2;Key0;Key1;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;91;-1152.624,224.8686;Float;False;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;92;-1407.455,126.6898;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;95;-1152.668,128.3494;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;72;-1151.627,-383.1466;Float;False;Property;_Stripecolor;Stripe color;1;0;Create;True;0;0;False;0;1,0,0,0;0.4926471,0.5381337,1,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;73;-1151.561,-217.4538;Float;False;Property;_Stripeintensity;Stripe intensity;2;0;Create;True;0;0;False;0;0;0.42;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;97;-896.3302,127.0184;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;84;-1020.998,-152.1865;Float;False;Constant;_Basecolor;Base color;9;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;71;-894.6655,-384.2316;Float;False;3;3;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;100;-768.5189,129.446;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;83;-703.6926,-321.7916;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;85;-511.7623,-257.4786;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RoundOpNode;113;-319.7649,-159.6406;Float;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;118;-310.0178,-513.3087;Float;False;Property;_Color0;Color 0;8;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;111;-128.9492,-256.3664;Float;False;Property;_Cleancut;Clean cut?;6;0;Create;True;0;0;False;0;0;0;0;True;;Toggle;2;Stripe_width;Stripe_intensity;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;117;-1364.917,-69.24271;Float;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;129.9141,-383.3432;Float;False;True;6;Float;ASEMaterialInspector;0;0;Standard;NEMO/NEMOx stripegradient;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;False;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;115;0;109;0
WireConnection;115;1;88;0
WireConnection;108;1;105;1
WireConnection;108;0;105;2
WireConnection;108;2;105;3
WireConnection;114;1;88;0
WireConnection;114;0;115;0
WireConnection;91;0;114;0
WireConnection;92;0;108;0
WireConnection;92;1;87;0
WireConnection;95;0;92;0
WireConnection;95;1;91;0
WireConnection;97;0;95;0
WireConnection;97;1;114;0
WireConnection;71;0;72;0
WireConnection;71;1;73;0
WireConnection;71;2;109;0
WireConnection;100;0;97;0
WireConnection;83;0;84;0
WireConnection;83;1;71;0
WireConnection;83;2;100;0
WireConnection;85;0;83;0
WireConnection;85;1;84;0
WireConnection;85;2;100;0
WireConnection;113;0;85;0
WireConnection;111;1;85;0
WireConnection;111;0;113;0
WireConnection;117;0;109;0
WireConnection;117;1;105;0
WireConnection;0;0;118;0
WireConnection;0;2;111;0
WireConnection;0;11;117;0
ASEEND*/
//CHKSM=DD337CB983A26E5813B77DD085E6339F777B1E44