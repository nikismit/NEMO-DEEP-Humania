// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "AS_ConceptionGlobe"
{
	Properties
	{
		_Color1("Color 1", Color) = (0,0,0,0)
		_Color2("Color 2", Color) = (0,0,0,0)
		_Gradientamount("Gradient amount", Range( 0 , 200)) = 0.449
		_Speed1("Speed 1", Range( 0 , 200)) = 0
		_Brightnesscolorband("Brightness color band", Range( -2 , 1)) = -0.618
		_Color3("Color 3", Color) = (0,0,0,0)
		_Color4("Color 4", Color) = (0,0,0,0)
		_Gradientamountwobble("Gradient amount wobble", Range( 0 , 99)) = 4.3
		_Speed2("Speed 2", Range( 0 , 5)) = 5
		_Brightnesswobble("Brightness wobble", Range( 0 , 30)) = 0
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
			float clampResult9 = clamp( (0.0 + (sin( ( _Gradientamountwobble * ( v.texcoord.xy.y + ( _Time.x * _Speed2 ) ) * 6.28318548202515 ) ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) , 0.0 , 1.0 );
			float4 lerpResult5 = lerp( _Color3 , _Color4 , clampResult9);
			v.vertex.xyz += ( _Brightnesswobble * lerpResult5 ).rgb;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float clampResult28 = clamp( (0.0 + (sin( ( _Gradientamount * ( i.uv_texcoord.y + ( _Time.x * _Speed1 ) ) * 6.28318548202515 ) ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) , 0.0 , 1.0 );
			float4 lerpResult27 = lerp( _Color1 , _Color2 , clampResult28);
			float4 temp_output_24_0 = ( _Brightnesscolorband + lerpResult27 );
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
173;336;980;645;1086.093;523.105;1.634567;True;False
Node;AmplifyShaderEditor.TextureCoordinatesNode;38;-2633.51,-457.7756;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TimeNode;36;-2574.315,-184.7755;Float;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;35;-2409.312,113.0244;Float;False;Property;_Speed1;Speed 1;3;0;Create;True;0;0;False;0;0;0;0;200;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;22;-1917.5,580;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TimeNode;19;-1889.5,890;Float;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;23;-1931.691,1085.41;Float;False;Property;_Speed2;Speed 2;8;0;Create;True;0;0;False;0;5;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;34;-2186.311,2.424561;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;37;-2307.213,-343.3754;Float;False;True;True;True;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;16;-1591.5,870;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;17;-1646.5,770;Float;False;True;True;True;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;33;-2016.01,-258.8753;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TauNode;32;-1866.51,-128.8752;Float;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;39;-2153.81,-513.675;Float;False;Property;_Gradientamount;Gradient amount;2;0;Create;True;0;0;False;0;0.449;0;0;200;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;13;-1346.5,758;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TauNode;15;-1347.5,968;Float;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;14;-1409.5,635;Float;False;Property;_Gradientamountwobble;Gradient amount wobble;7;0;Create;True;0;0;False;0;4.3;0;0;99;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;12;-1153.5,783;Float;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;31;-1698.809,-300.4749;Float;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;11;-1021.5,750;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;30;-1492.11,-306.9749;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;29;-1314.01,-325.1751;Float;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;10;-825.5,717;Float;True;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;28;-1025.409,-352.4755;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;8;-737.2441,233;Float;False;Property;_Color3;Color 3;5;0;Create;True;0;0;False;0;0,0,0,0;1,1,1,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;9;-515.0004,712.9999;Float;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;7;-741.5,397;Float;False;Property;_Color4;Color 4;6;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;41;-1130.752,-675.0161;Float;False;Property;_Color2;Color 2;1;0;Create;True;0;0;False;0;0,0,0,0;0.9390864,0,1,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;40;-1132.352,-846.2163;Float;False;Property;_Color1;Color 1;0;0;Create;True;0;0;False;0;0,0,0,0;0.9390864,0,1,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;27;-663.7125,-467.2417;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;5;-475.4398,314.6283;Float;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;3;-551.9001,128.9999;Float;False;Property;_Brightnesswobble;Brightness wobble;9;0;Create;True;0;0;False;0;0;0;0;30;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;25;-783.8294,-193.2162;Float;False;Property;_Brightnesscolorband;Brightness color band;4;0;Create;True;0;0;False;0;-0.618;-0.83;-2;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;42;-174.6019,-284.0445;Float;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2;-160.5,218;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1;-221.4165,418.0152;Float;False;Property;_Tessellation;Tessellation;10;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;24;-408.5313,-147.3477;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;44;0,0;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;AS_ConceptionGlobe;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;34;0;36;1
WireConnection;34;1;35;0
WireConnection;37;0;38;2
WireConnection;16;0;19;1
WireConnection;16;1;23;0
WireConnection;17;0;22;2
WireConnection;33;0;37;0
WireConnection;33;1;34;0
WireConnection;13;0;17;0
WireConnection;13;1;16;0
WireConnection;12;0;14;0
WireConnection;12;1;13;0
WireConnection;12;2;15;0
WireConnection;31;0;39;0
WireConnection;31;1;33;0
WireConnection;31;2;32;0
WireConnection;11;0;12;0
WireConnection;30;0;31;0
WireConnection;29;0;30;0
WireConnection;10;0;11;0
WireConnection;28;0;29;0
WireConnection;9;0;10;0
WireConnection;27;0;40;0
WireConnection;27;1;41;0
WireConnection;27;2;28;0
WireConnection;5;0;8;0
WireConnection;5;1;7;0
WireConnection;5;2;9;0
WireConnection;2;0;3;0
WireConnection;2;1;5;0
WireConnection;24;0;25;0
WireConnection;24;1;27;0
WireConnection;44;0;24;0
WireConnection;44;2;24;0
WireConnection;44;11;2;0
ASEEND*/
//CHKSM=C7D92B402E08A7A3A91BA184E90E30F5BDEF6950