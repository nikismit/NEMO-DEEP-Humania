// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "AS_WombStraight"
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
		_Tessellation("Tessellation", Float) = 0
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
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows vertex:vertexDataFunc tessellate:tessFunction 
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
		uniform float _Tessellation;

		float4 tessFunction( appdata_full v0, appdata_full v1, appdata_full v2 )
		{
			float4 temp_cast_1 = (_Tessellation).xxxx;
			return temp_cast_1;
		}

		void vertexDataFunc( inout appdata_full v )
		{
			float clampResult26 = clamp( (0.0 + (sin( ( _Gradientamountwobble * ( v.texcoord.xy.x + ( _Time.x * _Speed2 ) ) ) ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) , 0.0 , 1.0 );
			float4 lerpResult28 = lerp( _Color3 , _Color4 , clampResult26);
			v.vertex.xyz += ( _Brightnesswobble * lerpResult28 ).rgb;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float clampResult27 = clamp( (0.0 + (sin( ( _Gradientamount * ( i.uv_texcoord.y + ( _Time.x * _Speed1 ) ) * 6.28318548202515 ) ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) , 0.0 , 1.0 );
			float4 lerpResult29 = lerp( _Color1 , _Color2 , clampResult27);
			o.Albedo = lerpResult29.rgb;
			o.Emission = ( _Brightnesscolorband + lerpResult29 ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15401
9;1043;1906;988;1402.827;740.1187;1;True;False
Node;AmplifyShaderEditor.TimeNode;4;-2294.584,1098.112;Float;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;3;-2359.584,1240.112;Float;False;Property;_Speed2;Speed 2;8;0;Create;True;0;0;False;0;0;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;1;-2320.584,960.1119;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TimeNode;2;-2165.735,-180.0672;Float;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;6;-2188.353,-314.3404;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;5;-2226.513,-7.63251;Float;False;Property;_Speed1;Speed 1;3;0;Create;True;0;0;False;0;0;0;0;200;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;7;-2056.584,983.1119;Float;False;True;True;True;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;10;-1892.95,-312.9271;Float;False;True;True;True;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;9;-2032.584,1098.112;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;8;-1825.107,-201.2683;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;12;-1712.036,-428.8253;Float;False;Property;_Gradientamount;Gradient amount;2;0;Create;True;0;0;False;0;0;0;0;200;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;14;-1553.732,-259.2178;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TauNode;15;-1541.012,-82.54282;Float;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;11;-1841.585,821.1118;Float;False;Property;_Gradientamountwobble;Gradient amount wobble;7;0;Create;True;0;0;False;0;0;0;0;99;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;13;-1671.584,989.1119;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;16;-1371.405,-325.6475;Float;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;17;-1533.584,914.1119;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;19;-1291.584,914.1119;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;18;-1196.141,-325.6477;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;20;-1072.585,914.1119;Float;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;21;-1015.23,-325.6476;Float;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;23;-989.4178,-703.0257;Float;False;Property;_Color1;Color 1;0;0;Create;True;0;0;False;0;0,0,0,0;1,0.6980392,0.7960784,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;27;-800.0233,-325.6477;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;22;-991.197,-524.9367;Float;False;Property;_Color2;Color 2;1;0;Create;True;0;0;False;0;0,0,0,0;0.9921569,0.2666667,0.5058824,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;24;-1078.518,550.2017;Float;False;Property;_Color4;Color 4;6;0;Create;True;0;0;False;0;0,0,0,0;0.9921569,0.5137255,1,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;25;-1075.585,360.1115;Float;False;Property;_Color3;Color 3;5;0;Create;True;0;0;False;0;0,0,0,0;0,1,0.7529412,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;26;-724.5846,914.1119;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;28;-552.5845,483.1115;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;31;-624.5845,299.1116;Float;False;Property;_Brightnesswobble;Brightness wobble;9;0;Create;True;0;0;False;0;0;0;0;30;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;30;-716.6321,-98.09074;Float;False;Property;_Brightnesscolorband;Brightness color band;4;0;Create;True;0;0;False;0;0;-0.3;-2;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;29;-549.8504,-370.8767;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;33;-261.5169,-92.43717;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;34;-229.8265,412.8813;Float;False;Property;_Tessellation;Tessellation;10;0;Create;True;0;0;False;0;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;32;-200.5846,282.1116;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;6;Float;ASEMaterialInspector;0;0;Standard;AS_WombStraight;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;True;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;7;0;1;1
WireConnection;10;0;6;2
WireConnection;9;0;4;1
WireConnection;9;1;3;0
WireConnection;8;0;2;1
WireConnection;8;1;5;0
WireConnection;14;0;10;0
WireConnection;14;1;8;0
WireConnection;13;0;7;0
WireConnection;13;1;9;0
WireConnection;16;0;12;0
WireConnection;16;1;14;0
WireConnection;16;2;15;0
WireConnection;17;0;11;0
WireConnection;17;1;13;0
WireConnection;19;0;17;0
WireConnection;18;0;16;0
WireConnection;20;0;19;0
WireConnection;21;0;18;0
WireConnection;27;0;21;0
WireConnection;26;0;20;0
WireConnection;28;0;25;0
WireConnection;28;1;24;0
WireConnection;28;2;26;0
WireConnection;29;0;23;0
WireConnection;29;1;22;0
WireConnection;29;2;27;0
WireConnection;33;0;30;0
WireConnection;33;1;29;0
WireConnection;32;0;31;0
WireConnection;32;1;28;0
WireConnection;0;0;29;0
WireConnection;0;2;33;0
WireConnection;0;11;32;0
WireConnection;0;14;34;0
ASEEND*/
//CHKSM=C53F11B6399C5C814F9EE7A447D5719D75634607