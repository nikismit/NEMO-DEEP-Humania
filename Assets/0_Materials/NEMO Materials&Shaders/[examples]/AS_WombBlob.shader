// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "AS_WombBlob"
{
	Properties
	{
		_Color1("Color 1", Color) = (0,0,0,0)
		_Color2("Color 2", Color) = (0,0,0,0)
		_Gradientamount("Gradient amount", Range( 0 , 200)) = 0
		_Speed1("Speed 1", Range( 0 , 200)) = 0
		_Brightnesscolorband("Brightness color band", Range( -2 , 1)) = 0
		_Color3("Color 3", Color) = (0,0,0,0)
		_Color4("Color 4", Color) = (0,0,0,0)
		_Gradientamountwobble("Gradient amount wobble", Range( 0 , 99)) = 0
		_Speed2("Speed 2", Range( 0 , 5)) = 0
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
		uniform float4 _Color1;
		uniform float4 _Color2;
		uniform float _Gradientamount;
		uniform float _Speed1;
		uniform float _Brightnesscolorband;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float clampResult6 = clamp( (0.0 + (sin( ( _Gradientamountwobble * ( v.texcoord.xy.x + ( _Time.x * _Speed2 ) ) ) ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) , 0.0 , 1.0 );
			float4 lerpResult2 = lerp( _Color3 , _Color4 , clampResult6);
			v.vertex.xyz += ( _Brightnesswobble * lerpResult2 ).rgb;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float clampResult20 = clamp( (0.0 + (sin( ( _Gradientamount * ( i.uv_texcoord.y + ( _Time.x * _Speed1 ) ) * 6.28318548202515 ) ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) , 0.0 , 1.0 );
			float4 lerpResult19 = lerp( _Color1 , _Color2 , clampResult20);
			o.Albedo = lerpResult19.rgb;
			o.Emission = ( _Brightnesscolorband + lerpResult19 ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15401
173;336;980;645;2368.165;295.0521;3.241025;True;False
Node;AmplifyShaderEditor.TimeNode;14;-2371.867,1775.179;Float;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;33;-2303.796,669.4353;Float;False;Property;_Speed1;Speed 1;3;0;Create;True;0;0;False;0;0;0;0;200;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;31;-2265.635,362.7274;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;16;-2436.867,1917.179;Float;False;Property;_Speed2;Speed 2;8;0;Create;True;0;0;False;0;0;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;13;-2397.867,1637.179;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TimeNode;32;-2243.018,497.0005;Float;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;15;-2109.867,1775.179;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;29;-1970.233,364.1407;Float;False;True;True;True;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;30;-1902.39,475.7994;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;12;-2133.867,1660.179;Float;False;True;True;True;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;11;-1748.867,1666.179;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;28;-1631.015,417.85;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TauNode;27;-1618.295,594.525;Float;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-1918.867,1498.179;Float;False;Property;_Gradientamountwobble;Gradient amount wobble;7;0;Create;True;0;0;False;0;0;0;0;99;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;26;-1789.319,248.2422;Float;False;Property;_Gradientamount;Gradient amount;2;0;Create;True;0;0;False;0;0;0;0;200;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;9;-1610.867,1591.179;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;25;-1448.687,351.4202;Float;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;8;-1368.867,1591.179;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;24;-1273.424,351.42;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;23;-1092.512,351.4201;Float;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;7;-1149.867,1591.179;Float;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;4;-1152.867,1037.179;Float;False;Property;_Color3;Color 3;5;0;Create;True;0;0;False;0;0,0,0,0;0,1,0.7529412,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;6;-801.8667,1591.179;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;20;-877.3053,351.42;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;5;-1155.8,1227.27;Float;False;Property;_Color4;Color 4;6;0;Create;True;0;0;False;0;0,0,0,0;0.9921568,0.5137254,1,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;22;-1068.479,152.1308;Float;False;Property;_Color2;Color 2;1;0;Create;True;0;0;False;0;0,0,0,0;0.827451,0.1019608,0.8745098,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;21;-1066.7,-25.95819;Float;False;Property;_Color1;Color 1;0;0;Create;True;0;0;False;0;0,0,0,0;0.827451,0.1019608,0.8745098,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;18;-793.9142,578.9771;Float;False;Property;_Brightnesscolorband;Brightness color band;4;0;Create;True;0;0;False;0;0;-0.83;-2;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3;-701.8667,976.1794;Float;False;Property;_Brightnesswobble;Brightness wobble;9;0;Create;True;0;0;False;0;0;0;0;30;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;19;-627.1326,306.1909;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;2;-629.8667,1160.179;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1;-277.8667,959.1794;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;17;-338.7991,584.6306;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;AS_WombBlob;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;15;0;14;1
WireConnection;15;1;16;0
WireConnection;29;0;31;2
WireConnection;30;0;32;1
WireConnection;30;1;33;0
WireConnection;12;0;13;1
WireConnection;11;0;12;0
WireConnection;11;1;15;0
WireConnection;28;0;29;0
WireConnection;28;1;30;0
WireConnection;9;0;10;0
WireConnection;9;1;11;0
WireConnection;25;0;26;0
WireConnection;25;1;28;0
WireConnection;25;2;27;0
WireConnection;8;0;9;0
WireConnection;24;0;25;0
WireConnection;23;0;24;0
WireConnection;7;0;8;0
WireConnection;6;0;7;0
WireConnection;20;0;23;0
WireConnection;19;0;21;0
WireConnection;19;1;22;0
WireConnection;19;2;20;0
WireConnection;2;0;4;0
WireConnection;2;1;5;0
WireConnection;2;2;6;0
WireConnection;1;0;3;0
WireConnection;1;1;2;0
WireConnection;17;0;18;0
WireConnection;17;1;19;0
WireConnection;0;0;19;0
WireConnection;0;2;17;0
WireConnection;0;11;1;0
ASEEND*/
//CHKSM=D53D9ED21D651247705F3DCA7CE6C217BED5C104