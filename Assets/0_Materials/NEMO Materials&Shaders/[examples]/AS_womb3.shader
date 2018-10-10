// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "AS_womb3"
{
	Properties
	{
		_Colour1("Colour 1", Color) = (0,0,0,0)
		_Colour2("Colour 2", Color) = (0,0,0,0)
		_Gradientamount("Gradient amount", Range( 0 , 200)) = 0.449
		_Speed1("Speed 1", Range( 0 , 200)) = 0
		_Brightnesscolorband("Brightness color band", Range( -2 , 1)) = -0.618
		_Colour3("Colour 3", Color) = (0,0,0,0)
		_Colour4("Colour 4", Color) = (0,0,0,0)
		_Gradientamountwobble("Gradient amount wobble", Range( 0 , 99)) = 4.3
		_Speed2("Speed 2", Range( 0 , 5)) = 5
		_Brightnesswobble("Brightness wobble", Range( 0 , 30)) = 0
		_Tessellation("Tessellation", Float) = 1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#include "Tessellation.cginc"
		#pragma target 4.6
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows exclude_path:deferred vertex:vertexDataFunc tessellate:tessFunction 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform float _Brightnesswobble;
		uniform float4 _Colour3;
		uniform float4 _Colour4;
		uniform float _Gradientamountwobble;
		uniform float _Speed2;
		uniform float4 _Colour1;
		uniform float4 _Colour2;
		uniform float _Gradientamount;
		uniform float _Speed1;
		uniform float _Brightnesscolorband;
		uniform float _Tessellation;

		float4 tessFunction( appdata_full v0, appdata_full v1, appdata_full v2 )
		{
			float4 temp_cast_1 = (_Tessellation).xxxx;
			return temp_cast_1;
		}

		void vertexDataFunc( inout appdata_full v )
		{
			float clampResult26 = clamp( (0.0 + (sin( ( _Gradientamountwobble * ( v.texcoord.xy.y + ( _Time.x * _Speed2 ) ) * 6.28318548202515 ) ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) , 0.0 , 1.0 );
			float4 lerpResult29 = lerp( _Colour3 , _Colour4 , clampResult26);
			v.vertex.xyz += ( _Brightnesswobble * lerpResult29 ).rgb;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float clampResult28 = clamp( (0.0 + (sin( ( _Gradientamount * ( i.uv_texcoord.y + ( _Time.x * _Speed1 ) ) * 6.28318548202515 ) ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) , 0.0 , 1.0 );
			float4 lerpResult31 = lerp( _Colour1 , _Colour2 , clampResult28);
			o.Albedo = lerpResult31.rgb;
			o.Emission = ( _Brightnesscolorband + lerpResult31 ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15401
14;1037;889;974;983.1534;497.3174;1;True;False
Node;AmplifyShaderEditor.TextureCoordinatesNode;5;-1939.271,582.8266;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;6;-2655.282,-454.9488;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;3;-1953.463,1088.237;Float;False;Property;_Speed2;Speed 2;8;0;Create;True;0;0;False;0;5;1.17;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2;-2431.084,115.8511;Float;False;Property;_Speed1;Speed 1;3;0;Create;True;0;0;False;0;0;0;0;200;0;1;FLOAT;0
Node;AmplifyShaderEditor.TimeNode;1;-1911.271,892.8265;Float;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TimeNode;4;-2596.087,-181.9487;Float;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;10;-1668.271,772.8265;Float;False;True;True;True;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;9;-2208.083,5.251219;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;7;-2328.985,-340.5487;Float;False;True;True;True;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;8;-1613.271,872.8265;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TauNode;15;-1888.281,-126.0485;Float;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;11;-2175.582,-510.8484;Float;False;Property;_Gradientamount;Gradient amount;2;0;Create;True;0;0;False;0;0.449;1;0;200;0;1;FLOAT;0
Node;AmplifyShaderEditor.TauNode;12;-1369.271,970.8265;Float;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;16;-1431.271,637.8266;Float;False;Property;_Gradientamountwobble;Gradient amount wobble;7;0;Create;True;0;0;False;0;4.3;0;0;99;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;14;-1368.271,760.8265;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;13;-2037.782,-256.0486;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;17;-1720.58,-297.6482;Float;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;18;-1175.271,785.8265;Float;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;19;-1513.881,-304.1482;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;20;-1043.271,752.8265;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;22;-1335.781,-322.3484;Float;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;21;-847.2716,719.8265;Float;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;24;-763.2715,235.8267;Float;False;Property;_Colour3;Colour 3;5;0;Create;True;0;0;False;0;0,0,0,0;1,1,1,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;27;-1152.523,-672.1896;Float;False;Property;_Colour2;Colour 2;1;0;Create;True;0;0;False;0;0,0,0,0;1,0.8117648,0.7960785,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;25;-1154.123,-843.3898;Float;False;Property;_Colour1;Colour 1;0;0;Create;True;0;0;False;0;0,0,0,0;1,0.6705883,0.7019608,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;28;-1047.18,-349.6488;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;26;-582.2715,702.8265;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;23;-763.2715,399.8267;Float;False;Property;_Colour4;Colour 4;6;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;29;-407.2715,336.8266;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;31;-685.4841,-464.415;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;30;-805.601,-190.3895;Float;False;Property;_Brightnesscolorband;Brightness color band;4;0;Create;True;0;0;False;0;-0.618;-2;-2;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;32;-573.6716,131.8266;Float;False;Property;_Brightnesswobble;Brightness wobble;9;0;Create;True;0;0;False;0;0;0.04;0;30;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;33;-182.2716,220.8267;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;34;-207.2716,319.8267;Float;False;Property;_Tessellation;Tessellation;10;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;35;-510.3963,-115.0988;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;6;Float;ASEMaterialInspector;0;0;Standard;AS_womb3;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;ForwardOnly;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;True;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;0;0;False;-1;0;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;10;0;5;2
WireConnection;9;0;4;1
WireConnection;9;1;2;0
WireConnection;7;0;6;2
WireConnection;8;0;1;1
WireConnection;8;1;3;0
WireConnection;14;0;10;0
WireConnection;14;1;8;0
WireConnection;13;0;7;0
WireConnection;13;1;9;0
WireConnection;17;0;11;0
WireConnection;17;1;13;0
WireConnection;17;2;15;0
WireConnection;18;0;16;0
WireConnection;18;1;14;0
WireConnection;18;2;12;0
WireConnection;19;0;17;0
WireConnection;20;0;18;0
WireConnection;22;0;19;0
WireConnection;21;0;20;0
WireConnection;28;0;22;0
WireConnection;26;0;21;0
WireConnection;29;0;24;0
WireConnection;29;1;23;0
WireConnection;29;2;26;0
WireConnection;31;0;25;0
WireConnection;31;1;27;0
WireConnection;31;2;28;0
WireConnection;33;0;32;0
WireConnection;33;1;29;0
WireConnection;35;0;30;0
WireConnection;35;1;31;0
WireConnection;0;0;31;0
WireConnection;0;2;35;0
WireConnection;0;11;33;0
WireConnection;0;14;34;0
ASEEND*/
//CHKSM=6415B7F8B056D15C1390F738C75AFB20FF9354F2