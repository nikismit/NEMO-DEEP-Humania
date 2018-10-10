// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "NEMO/NEMO V_TLmushroom top"
{
	Properties
	{
		_Basecolor1("Base color 1", Color) = (0,0,0,0)
		_Glowcolor1("Glow color 1", Color) = (0,0,0,0)
		_Power1("Power 1", Range( -3 , 3)) = 0
		_Basecolor2("Base color 2", Color) = (0,0,0,0)
		_Glowcolor2("Glow color 2", Color) = (0,0,0,0)
		_Power2("Power 2", Range( -3 , 3)) = 0
		_Gloss("Gloss", Range( 0 , 10)) = 0
		_SpecColor("Specular Color",Color)=(1,1,1,1)
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGINCLUDE
		#include "UnityPBSLighting.cginc"
		#include "Lighting.cginc"
		#pragma target 3.0
		struct Input
		{
			float3 worldPos;
			float3 worldNormal;
		};

		uniform float4 _Basecolor1;
		uniform float4 _Glowcolor1;
		uniform float _Power1;
		uniform float4 _Basecolor2;
		uniform float4 _Glowcolor2;
		uniform float _Power2;
		uniform float _Gloss;

		void surf( Input i , inout SurfaceOutput o )
		{
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 ase_worldNormal = i.worldNormal;
			float fresnelNdotV5 = dot( ase_worldNormal, ase_worldViewDir );
			float fresnelNode5 = ( 0.0 + 1.0 * pow( 1.0 - fresnelNdotV5, _Power1 ) );
			float4 temp_output_1_0 = ( _Basecolor1 + ( _Glowcolor1 * fresnelNode5 ) );
			o.Albedo = temp_output_1_0.rgb;
			o.Emission = temp_output_1_0.rgb;
			float fresnelNdotV12 = dot( ase_worldNormal, ase_worldViewDir );
			float fresnelNode12 = ( 0.0 + 1.0 * pow( 1.0 - fresnelNdotV12, _Power2 ) );
			o.Specular = ( _Basecolor2 + ( _Glowcolor2 * fresnelNode12 ) ).r;
			o.Gloss = _Gloss;
			o.Alpha = 1;
		}

		ENDCG
		CGPROGRAM
		#pragma surface surf BlinnPhong keepalpha fullforwardshadows 

		ENDCG
		Pass
		{
			Name "ShadowCaster"
			Tags{ "LightMode" = "ShadowCaster" }
			ZWrite On
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 3.0
			#pragma multi_compile_shadowcaster
			#pragma multi_compile UNITY_PASS_SHADOWCASTER
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			#include "HLSLSupport.cginc"
			#if ( SHADER_API_D3D11 || SHADER_API_GLCORE || SHADER_API_GLES3 || SHADER_API_METAL || SHADER_API_VULKAN )
				#define CAN_SKIP_VPOS
			#endif
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			struct v2f
			{
				V2F_SHADOW_CASTER;
				float3 worldPos : TEXCOORD1;
				float3 worldNormal : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			v2f vert( appdata_full v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_INITIALIZE_OUTPUT( v2f, o );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				float3 worldPos = mul( unity_ObjectToWorld, v.vertex ).xyz;
				half3 worldNormal = UnityObjectToWorldNormal( v.normal );
				o.worldNormal = worldNormal;
				o.worldPos = worldPos;
				TRANSFER_SHADOW_CASTER_NORMALOFFSET( o )
				return o;
			}
			half4 frag( v2f IN
			#if !defined( CAN_SKIP_VPOS )
			, UNITY_VPOS_TYPE vpos : VPOS
			#endif
			) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				Input surfIN;
				UNITY_INITIALIZE_OUTPUT( Input, surfIN );
				float3 worldPos = IN.worldPos;
				half3 worldViewDir = normalize( UnityWorldSpaceViewDir( worldPos ) );
				surfIN.worldPos = worldPos;
				surfIN.worldNormal = IN.worldNormal;
				SurfaceOutput o;
				UNITY_INITIALIZE_OUTPUT( SurfaceOutput, o )
				surf( surfIN, o );
				#if defined( CAN_SKIP_VPOS )
				float2 vpos = IN.pos;
				#endif
				SHADOW_CASTER_FRAGMENT( IN )
			}
			ENDCG
		}
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15600
696;164;983;911;1382.764;-184.7941;1.392668;True;True
Node;AmplifyShaderEditor.RangedFloatNode;14;-927.1998,1024.692;Float;False;Property;_Power2;Power 2;5;0;Create;True;0;0;False;0;0;2;-3;3;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;13;-928.2479,418.2862;Float;False;Property;_Power1;Power 1;2;0;Create;True;0;0;False;0;0;3;-3;3;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;3;-637.5,65;Float;False;Property;_Glowcolor1;Glow color 1;1;0;Create;True;0;0;False;0;0,0,0,0;0,0.6319982,0.8897059,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;9;-632.0799,677.7808;Float;False;Property;_Glowcolor2;Glow color 2;4;0;Create;True;0;0;False;0;0,0,0,0;0,1,0.9568627,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FresnelNode;5;-638.2144,258.2087;Float;False;Standard;WorldNormal;ViewDir;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;12;-638.9762,864.3975;Float;False;Standard;WorldNormal;ViewDir;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4;-414.5,65;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;10;-416.7442,706.2881;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;8;-639.0428,513.8877;Float;False;Property;_Basecolor2;Base color 2;3;0;Create;True;0;0;False;0;0,0,0,0;0.5529411,0,0.5607843,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;2;-637.5,-126;Float;False;Property;_Basecolor1;Base color 1;0;0;Create;True;0;0;False;0;0,0,0,0;0.3407547,0,0.3455882,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;15;-382.7563,258.5742;Float;False;Property;_Gloss;Gloss;6;0;Create;True;0;0;False;0;0;3.55;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;7;-256.5973,640.3303;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1;-254.5,1;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;6;-895.2144,257.2087;Float;False;PerturbNormal;-1;;10;c8b64dd82fb09f542943a895dffb6c06;1,26,0;1;6;FLOAT3;0,0,0;False;4;FLOAT3;9;FLOAT;28;FLOAT;29;FLOAT;30
Node;AmplifyShaderEditor.FunctionNode;11;-895.9763,863.3975;Float;False;PerturbNormal;-1;;8;c8b64dd82fb09f542943a895dffb6c06;1,26,0;1;6;FLOAT3;0,0,0;False;4;FLOAT3;9;FLOAT;28;FLOAT;29;FLOAT;30
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;2;Float;ASEMaterialInspector;0;0;BlinnPhong;NEMO/NEMO V_TLmushroom top;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;7;0;False;-1;0;0;0;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;5;3;13;0
WireConnection;12;3;14;0
WireConnection;4;0;3;0
WireConnection;4;1;5;0
WireConnection;10;0;9;0
WireConnection;10;1;12;0
WireConnection;7;0;8;0
WireConnection;7;1;10;0
WireConnection;1;0;2;0
WireConnection;1;1;4;0
WireConnection;0;0;1;0
WireConnection;0;2;1;0
WireConnection;0;3;7;0
WireConnection;0;4;15;0
ASEEND*/
//CHKSM=530082EA4F4F17C4CC98F50320CBB1E053FB37F5