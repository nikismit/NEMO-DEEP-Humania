// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "AS_Strengen"
{
	Properties
	{
		_Color1("Color 1", Color) = (0,0,0,0)
		_Color2("Color 2", Color) = (0,0,0,0)
		_Gradientamountwobble("Gradient amount wobble", Range( 0 , 8)) = 0
		_Speed2("Speed 2", Range( 0 , 5)) = 0
		_Brightnesswobble("Brightness wobble", Range( 0 , 1)) = 0
		_Color3("Color 3", Color) = (0,0,0,0)
		_Color4("Color 4", Color) = (0,0,0,0)
		_Gradientamount("Gradient amount", Range( 0 , 200)) = 0
		_Speed1("Speed 1", Range( 0 , 200)) = 0
		_Brightnesscolorband("Brightness color band", Range( -2 , 1)) = 0
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
		uniform float _Speed2;
		uniform float _Brightnesscolorband;
		uniform float4 _Color1;
		uniform float4 _Color2;
		uniform float _Gradientamount;
		uniform float _Speed1;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 lerpResult20 = lerp( float3(0,0,0) , float3(1,1,1) , v.texcoord.xy.y);
			float clampResult7 = clamp( (0.0 + (sin( ( _Gradientamountwobble * ( v.texcoord.xy.y + ( _Time.x * _Speed2 ) ) * 6.28318548202515 ) ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) , 0.0 , 1.0 );
			float4 lerpResult3 = lerp( _Color3 , _Color4 , clampResult7);
			v.vertex.xyz += ( float4( lerpResult20 , 0.0 ) * ( _Brightnesswobble * lerpResult3 ) ).rgb;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float clampResult29 = clamp( (0.0 + (sin( ( _Gradientamount * ( i.uv_texcoord.y + ( _Time.x * _Speed1 ) ) * 6.28318548202515 ) ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) , 0.0 , 1.0 );
			float4 lerpResult26 = lerp( _Color1 , _Color2 , clampResult29);
			float4 temp_output_24_0 = ( _Brightnesscolorband + lerpResult26 );
			o.Albedo = temp_output_24_0.rgb;
			o.Emission = temp_output_24_0.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15401
173;336;980;645;1225.79;261.7875;1.731072;True;False
Node;AmplifyShaderEditor.TimeNode;18;-2442,1177;Float;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;16;-2467,1038;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;19;-2442,1348;Float;False;Property;_Speed2;Speed 2;3;0;Create;True;0;0;False;0;0;2;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;39;-2555.179,263.899;Float;False;Property;_Speed1;Speed 1;8;0;Create;True;0;0;False;0;0;0;0;200;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;15;-2111,1126;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;36;-2519.179,-58.10095;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TimeNode;38;-2489.179,89.89905;Float;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;14;-2181,1033;Float;False;True;True;True;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;35;-2250.179,-63.10095;Float;False;True;True;True;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;12;-1875,1038;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;37;-2179.179,88.89905;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TauNode;13;-1857,1157;Float;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;11;-2011,944;Float;False;Property;_Gradientamountwobble;Gradient amount wobble;2;0;Create;True;0;0;False;0;0;4;0;8;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;33;-2174.179,-164.101;Float;False;Property;_Gradientamount;Gradient amount;7;0;Create;True;0;0;False;0;0;0;0;200;0;1;FLOAT;0
Node;AmplifyShaderEditor.TauNode;40;-1987.179,41.89905;Float;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;10;-1688,949;Float;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;34;-2009.179,-57.10095;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;9;-1482,950;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;32;-1786.179,-79.10095;Float;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;31;-1612.179,-79.10095;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;8;-1260,950;Float;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;5;-1059,602;Float;False;Property;_Color3;Color 3;5;0;Create;True;0;0;False;0;0,0,0,0;1,1,1,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;6;-1052,777;Float;False;Property;_Color4;Color 4;6;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCRemapNode;30;-1433.179,-79.10095;Float;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;7;-988,950;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;21;-888.1793,57.89905;Float;False;Constant;_Vector1;Vector 1;0;0;Create;True;0;0;False;0;0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Vector3Node;22;-887.1793,203.899;Float;False;Constant;_Vector2;Vector 2;0;0;Create;True;0;0;False;0;1,1,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ColorNode;28;-1275.179,-465.101;Float;False;Property;_Color1;Color 1;0;0;Create;True;0;0;False;0;0,0,0,0;0.1411763,0.0980391,0.4589998,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;4;-804,594;Float;False;Property;_Brightnesswobble;Brightness wobble;4;0;Create;True;0;0;False;0;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;27;-1274.179,-292.101;Float;False;Property;_Color2;Color 2;1;0;Create;True;0;0;False;0;0,0,0,0;0.7379313,0,1,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;3;-682,726;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;23;-946.1793,353.899;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;29;-1212.179,-79.10095;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;26;-874.1793,-122.101;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2;-443,448;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;20;-630.1793,308.899;Float;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;25;-612.1793,-165.101;Float;False;Property;_Brightnesscolorband;Brightness color band;9;0;Create;True;0;0;False;0;0;-0.5;-2;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1;-286,308;Float;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;24;-317.1793,-50.10095;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;44;0,0;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;AS_Strengen;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;15;0;18;1
WireConnection;15;1;19;0
WireConnection;14;0;16;2
WireConnection;35;0;36;2
WireConnection;12;0;14;0
WireConnection;12;1;15;0
WireConnection;37;0;38;1
WireConnection;37;1;39;0
WireConnection;10;0;11;0
WireConnection;10;1;12;0
WireConnection;10;2;13;0
WireConnection;34;0;35;0
WireConnection;34;1;37;0
WireConnection;9;0;10;0
WireConnection;32;0;33;0
WireConnection;32;1;34;0
WireConnection;32;2;40;0
WireConnection;31;0;32;0
WireConnection;8;0;9;0
WireConnection;30;0;31;0
WireConnection;7;0;8;0
WireConnection;3;0;5;0
WireConnection;3;1;6;0
WireConnection;3;2;7;0
WireConnection;29;0;30;0
WireConnection;26;0;28;0
WireConnection;26;1;27;0
WireConnection;26;2;29;0
WireConnection;2;0;4;0
WireConnection;2;1;3;0
WireConnection;20;0;21;0
WireConnection;20;1;22;0
WireConnection;20;2;23;2
WireConnection;1;0;20;0
WireConnection;1;1;2;0
WireConnection;24;0;25;0
WireConnection;24;1;26;0
WireConnection;44;0;24;0
WireConnection;44;2;24;0
WireConnection;44;11;1;0
ASEEND*/
//CHKSM=2C285BFD2152FEC5B4D4B2E7CD339355890F7549