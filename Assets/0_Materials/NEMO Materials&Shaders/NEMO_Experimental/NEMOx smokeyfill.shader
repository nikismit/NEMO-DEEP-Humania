// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "NEMO/NEMOx smokeyfill"
{
	Properties
	{
		_Tiling("Tiling", Vector) = (0,0,0,0)
		_Speed("Speed", Vector) = (0,0,0,0)
		_Breathvalue("Breath value", Range( 0 , 2)) = 1
		_Breathvaluemultiplier("Breath value multiplier", Range( -10 , 10)) = -1.2
		_Glowcolor("Glow color", Color) = (1,0,0,0)
		_Luminositygradient("Luminosity gradient", Range( 0 , 10)) = 0
		_Basecolor("Base color", Color) = (0.03448248,0,1,0)
		_Basecolorintensity("Base color intensity", Range( 0 , 10)) = 0
		_1BVadd("1. BV add", Range( -20 , 20)) = -10
		_2BVmultiply("2. BV multiply", Range( -20 , 20)) = 10
		_TextureSample0("Texture Sample 0", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "TransparentCutout"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Off
		CGPROGRAM
		#include "UnityPBSLighting.cginc"
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf StandardCustomLighting keepalpha addshadow fullforwardshadows exclude_path:deferred 
		struct Input
		{
			float2 uv_texcoord;
		};

		struct SurfaceOutputCustomLightingCustom
		{
			half3 Albedo;
			half3 Normal;
			half3 Emission;
			half Metallic;
			half Smoothness;
			half Occlusion;
			half Alpha;
			Input SurfInput;
			UnityGIInput GIData;
		};

		uniform float _Breathvaluemultiplier;
		uniform float _Breathvalue;
		uniform float _1BVadd;
		uniform float _2BVmultiply;
		uniform sampler2D _TextureSample0;
		uniform float2 _Tiling;
		uniform float2 _Speed;
		uniform float4 _Glowcolor;
		uniform float _Luminositygradient;
		uniform float4 _Basecolor;
		uniform float _Basecolorintensity;

		inline half4 LightingStandardCustomLighting( inout SurfaceOutputCustomLightingCustom s, half3 viewDir, UnityGI gi )
		{
			UnityGIInput data = s.GIData;
			Input i = s.SurfInput;
			half4 c = 0;
			c.rgb = 0;
			c.a = 1;
			return c;
		}

		inline void LightingStandardCustomLighting_GI( inout SurfaceOutputCustomLightingCustom s, UnityGIInput data, inout UnityGI gi )
		{
			s.GIData = data;
		}

		void surf( Input i , inout SurfaceOutputCustomLightingCustom o )
		{
			o.SurfInput = i;
			float2 uv_TexCoord19 = i.uv_texcoord * float2( 2,2 );
			float2 panner84 = ( _Time.y * _Speed + float2( 0,0 ));
			float2 uv_TexCoord65 = i.uv_texcoord * _Tiling + panner84;
			float3 lerpResult3 = lerp( float3(1,1,1) , float3(0,0,0) , ( ( uv_TexCoord19.y + ( _Breathvaluemultiplier * _Breathvalue ) ) * ( ( _Breathvalue + _1BVadd ) * _2BVmultiply ) * tex2D( _TextureSample0, uv_TexCoord65 ) ).r);
			o.Emission = ( ( 1.0 - (( float4( lerpResult3 , 0.0 ) * _Glowcolor * _Luminositygradient )).rgba ) * _Basecolor * _Basecolorintensity ).rgb;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15600
690;477;1275;763;957.0766;33.88952;1.060237;True;True
Node;AmplifyShaderEditor.RangedFloatNode;86;-2174.86,899.9634;Float;False;Constant;_Speedx;Speed x;12;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;85;-2175.611,994.4747;Float;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;87;-2175.129,770.7239;Float;False;Property;_Speed;Speed;1;0;Create;True;0;0;False;0;0,0;0,0.2;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;15;-2175.045,387.9738;Float;False;Property;_Breathvaluemultiplier;Breath value multiplier;3;0;Create;True;0;0;False;0;-1.2;-1.96;-10;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;72;-1884.612,538.8484;Float;False;Property;_1BVadd;1. BV add;8;0;Create;True;0;0;False;0;-10;-12.1;-20;20;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;88;-2175.139,641.8137;Float;False;Property;_Tiling;Tiling;0;0;Create;True;0;0;False;0;0,0;2,2;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;14;-2174.8,454.7906;Float;False;Property;_Breathvalue;Breath value;2;0;Create;True;0;0;False;0;1;0.528;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;84;-1886.486,771.063;Float;False;3;0;FLOAT2;0,0;False;2;FLOAT2;1,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;19;-2174.216,258.5187;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;2,2;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;39;-1887.251,258.6556;Float;False;True;False;False;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;12;-1885.956,353.9477;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;65;-1885.358,643.3558;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;70;-1629.181,539.7095;Float;False;Property;_2BVmultiply;2. BV multiply;9;0;Create;True;0;0;False;0;10;-7.5;-20;20;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;69;-1887.167,450.4885;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;61;-1627.6,643.3077;Float;True;Property;_TextureSample0;Texture Sample 0;10;0;Create;True;0;0;False;0;28c7aad1372ff114b90d330f8a2dd938;28c7aad1372ff114b90d330f8a2dd938;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;41;-1662.2,259.6477;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;71;-1629.787,449.7032;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;7;-1276.209,75.17809;Float;False;Constant;_Vector1;Vector 1;0;0;Create;True;0;0;False;0;0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Vector3Node;6;-1277.508,-61.75205;Float;False;Constant;_Vector0;Vector 0;0;0;Create;True;0;0;False;0;1,1,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;66;-1277.575,257.6836;Float;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;5;-1021.667,293.3785;Float;False;Property;_Luminositygradient;Luminosity gradient;5;0;Create;True;0;0;False;0;0;0.16;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;3;-1022.038,3.066081;Float;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;4;-1020.885,130.5076;Float;False;Property;_Glowcolor;Glow color;4;0;Create;True;0;0;False;0;1,0,0,0;1,0.8482757,0,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2;-765.4968,1.686435;Float;False;3;3;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ComponentMaskNode;90;-607.4416,1.037204;Float;True;True;True;True;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;79;-608.2689,512.2218;Float;False;Property;_Basecolorintensity;Base color intensity;7;0;Create;True;0;0;False;0;0;1.7;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;91;-606.7106,256.3494;Float;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;78;-607.7002,352.9401;Float;False;Property;_Basecolor;Base color;6;0;Create;True;0;0;False;0;0.03448248,0,1,0;0.6109429,0.555958,0.8308824,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;77;-254.8722,257.1182;Float;True;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;2;Float;ASEMaterialInspector;0;0;CustomLighting;NEMO/NEMOx smokeyfill;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;True;0;True;TransparentCutout;;Geometry;ForwardOnly;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;11;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;85;0;86;0
WireConnection;84;2;87;0
WireConnection;84;1;85;0
WireConnection;39;0;19;2
WireConnection;12;0;15;0
WireConnection;12;1;14;0
WireConnection;65;0;88;0
WireConnection;65;1;84;0
WireConnection;69;0;14;0
WireConnection;69;1;72;0
WireConnection;61;1;65;0
WireConnection;41;0;39;0
WireConnection;41;1;12;0
WireConnection;71;0;69;0
WireConnection;71;1;70;0
WireConnection;66;0;41;0
WireConnection;66;1;71;0
WireConnection;66;2;61;0
WireConnection;3;0;6;0
WireConnection;3;1;7;0
WireConnection;3;2;66;0
WireConnection;2;0;3;0
WireConnection;2;1;4;0
WireConnection;2;2;5;0
WireConnection;90;0;2;0
WireConnection;91;0;90;0
WireConnection;77;0;91;0
WireConnection;77;1;78;0
WireConnection;77;2;79;0
WireConnection;0;2;77;0
ASEEND*/
//CHKSM=A6FC69254E23C9E674B57614166920E8DD1E3AB1