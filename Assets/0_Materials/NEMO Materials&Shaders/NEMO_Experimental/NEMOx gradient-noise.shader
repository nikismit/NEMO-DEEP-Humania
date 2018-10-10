// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "NEMO/NEMOx gradient-stripe"
{
	Properties
	{
		_Speed("Speed", Vector) = (2,2,0,0)
		_Stripeamount("Stripe amount", Float) = 10
		_Stripethickness("Stripe thickness", Range( 0 , 1)) = 0.8
		[HDR]_Glowcolor("Glow color", Color) = (0,4.793103,5,1)
		_Slicecompletion("Slice completion", Range( -20 , 20)) = 0
		[KeywordEnum(Linear,From_center,Towards_center,Overall)] _Slicedirection("Slice direction", Float) = 0
		_Range("Range", Range( -30 , 30)) = 8
		_Vertexoffsetstrength("Vertex offset strength", Range( 0 , 10)) = 0
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Off
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma shader_feature _SLICEDIRECTION_LINEAR _SLICEDIRECTION_FROM_CENTER _SLICEDIRECTION_TOWARDS_CENTER _SLICEDIRECTION_OVERALL
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows vertex:vertexDataFunc 
		struct Input
		{
			float2 uv_texcoord;
			float3 worldPos;
		};

		uniform float _Slicecompletion;
		uniform float _Range;
		uniform float _Stripeamount;
		uniform float2 _Speed;
		uniform float _Stripethickness;
		uniform float _Vertexoffsetstrength;
		uniform float4 _Glowcolor;
		uniform float _Cutoff = 0.5;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 ase_vertex3Pos = v.vertex.xyz;
			float3 temp_output_77_0 = abs( ase_vertex3Pos );
			#if defined(_SLICEDIRECTION_LINEAR)
				float3 staticSwitch75 = ase_vertex3Pos;
			#elif defined(_SLICEDIRECTION_FROM_CENTER)
				float3 staticSwitch75 = ( 1.0 - temp_output_77_0 );
			#elif defined(_SLICEDIRECTION_TOWARDS_CENTER)
				float3 staticSwitch75 = temp_output_77_0;
			#elif defined(_SLICEDIRECTION_OVERALL)
				float3 staticSwitch75 = float3( 0,0,0 );
			#else
				float3 staticSwitch75 = ase_vertex3Pos;
			#endif
			float4 transform28 = mul(unity_ObjectToWorld,float4( staticSwitch75 , 0.0 ));
			float Gradient17 = saturate( ( ( transform28.y + _Slicecompletion ) / _Range ) );
			float2 temp_cast_1 = (_Stripeamount).xx;
			float2 panner70 = ( _Time.y * _Speed + float2( 0,0 ));
			float2 uv_TexCoord62 = v.texcoord.xy * temp_cast_1 + panner70;
			float Stripe65 = step( frac( uv_TexCoord62.y ) , _Stripethickness );
			float3 VertexOffset53 = ( ase_vertex3Pos * Gradient17 * Stripe65 * _Vertexoffsetstrength );
			v.vertex.xyz += VertexOffset53;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 temp_cast_0 = (_Stripeamount).xx;
			float2 panner70 = ( _Time.y * _Speed + float2( 0,0 ));
			float2 uv_TexCoord62 = i.uv_texcoord * temp_cast_0 + panner70;
			float Stripe65 = step( frac( uv_TexCoord62.y ) , _Stripethickness );
			float3 ase_vertex3Pos = mul( unity_WorldToObject, float4( i.worldPos , 1 ) );
			float3 temp_output_77_0 = abs( ase_vertex3Pos );
			#if defined(_SLICEDIRECTION_LINEAR)
				float3 staticSwitch75 = ase_vertex3Pos;
			#elif defined(_SLICEDIRECTION_FROM_CENTER)
				float3 staticSwitch75 = ( 1.0 - temp_output_77_0 );
			#elif defined(_SLICEDIRECTION_TOWARDS_CENTER)
				float3 staticSwitch75 = temp_output_77_0;
			#elif defined(_SLICEDIRECTION_OVERALL)
				float3 staticSwitch75 = float3( 0,0,0 );
			#else
				float3 staticSwitch75 = ase_vertex3Pos;
			#endif
			float4 transform28 = mul(unity_ObjectToWorld,float4( staticSwitch75 , 0.0 ));
			float Gradient17 = saturate( ( ( transform28.y + _Slicecompletion ) / _Range ) );
			float4 Emission42 = ( Stripe65 * Gradient17 * _Glowcolor );
			o.Emission = Emission42.rgb;
			o.Alpha = 1;
			float temp_output_34_0 = ( Gradient17 * 4.0 );
			float OpacityMask25 = ( ( ( ( 1.0 - Gradient17 ) * Stripe65 ) - temp_output_34_0 ) + ( 1.0 - temp_output_34_0 ) );
			clip( OpacityMask25 - _Cutoff );
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15600
670;535;1275;803;3003.045;486.2422;1.6;True;True
Node;AmplifyShaderEditor.CommentaryNode;27;-2354.891,-177.4062;Float;False;1843.602;431.955;;11;78;77;75;74;17;31;30;29;16;28;15;Gradient;1,1,1,1;0;0
Node;AmplifyShaderEditor.PosVertexDataNode;74;-2303.11,-126.0385;Float;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.AbsOpNode;77;-2113.098,2.185973;Float;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;78;-1920.607,2.046187;Float;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;13;-2354.979,-689.7177;Float;False;1539.706;366.5486;;10;70;69;68;67;64;66;63;62;61;65;Stripe;1,1,1,1;0;0
Node;AmplifyShaderEditor.StaticSwitch;75;-1728.202,-126.0907;Float;False;Property;_Slicedirection;Slice direction;5;0;Create;True;0;0;False;0;0;0;0;True;;KeywordEnum;4;Linear;From_center;Towards_center;Overall;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;67;-2302.129,-541.9477;Float;False;Constant;_Speedx;Speed x;2;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;15;-1446.089,33.711;Float;False;Property;_Slicecompletion;Slice completion;4;0;Create;True;0;0;False;0;0;0;-20;20;0;1;FLOAT;0
Node;AmplifyShaderEditor.ObjectToWorldTransfNode;28;-1446.25,-125.9332;Float;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleTimeNode;69;-2143.129,-541.9477;Float;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;68;-2301.273,-445.2117;Float;False;Property;_Speed;Speed;0;0;Create;True;0;0;False;0;2,2;2,2;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;29;-1061.555,33.98346;Float;False;Property;_Range;Range;6;0;Create;True;0;0;False;0;8;5;-30;30;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;16;-1189.615,-125.563;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;61;-1918.454,-639.705;Float;False;Property;_Stripeamount;Stripe amount;1;0;Create;True;0;0;False;0;10;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;70;-1918.129,-541.9477;Float;False;3;0;FLOAT2;0,0;False;2;FLOAT2;-1,-1;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;30;-1061.766,-125.6586;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;62;-1662.552,-639.6739;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;31;-934.6469,-125.979;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;63;-1407.988,-638.2935;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;38;-2357.413,333.7409;Float;False;1190.283;355.6656;;10;26;20;25;35;21;37;22;33;34;36;Opacity Mask;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;66;-1662.824,-510.8313;Float;False;Property;_Stripethickness;Stripe thickness;2;0;Create;True;0;0;False;0;0.8;0.8;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;64;-1278.463,-638.6846;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;26;-2305.849,385.1711;Float;False;17;Gradient;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;17;-774.7146,-125.9352;Float;True;Gradient;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;65;-1062.567,-605.0219;Float;True;Stripe;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;20;-2114.843,385.0462;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;22;-2307.413,511.8259;Float;False;65;Stripe;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;33;-2050.225,574.4064;Float;False;17;Gradient;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;59;-2353.672,1485.636;Float;False;965.5748;368.7717;;6;50;51;58;56;53;52;Vertex Offset;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;34;-1857.175,555.247;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;4;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;46;-2352.479,847.2336;Float;False;710.3752;514.4218;;5;45;40;39;41;42;Emission;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;21;-1922.219,383.7409;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;58;-2047.077,1668.604;Float;False;65;Stripe;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;35;-1761.761,383.78;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;51;-2047.622,1599.278;Float;False;17;Gradient;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;56;-2047.594,1739.408;Float;False;Property;_Vertexoffsetstrength;Vertex offset strength;7;0;Create;True;0;0;False;0;0;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;50;-2303.672,1536.661;Float;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;40;-2301.479,1026.187;Float;False;17;Gradient;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;36;-1666.283,579.2646;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;39;-2302.479,897.2336;Float;False;65;Stripe;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;45;-2300.924,1154.655;Float;False;Property;_Glowcolor;Glow color;3;1;[HDR];Create;True;0;0;False;0;0,4.793103,5,1;0,4.793103,5,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;52;-1791.768,1536.801;Float;False;4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;37;-1601.987,384.1303;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;41;-2045.134,898.8067;Float;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;10;-256.7396,129.4426;Float;False;25;OpacityMask;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;44;-255.0151,0.6974335;Float;False;42;Emission;0;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;25;-1410.13,384.8115;Float;True;OpacityMask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;53;-1631.098,1535.636;Float;True;VertexOffset;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;54;-256.1531,256.9473;Float;False;53;VertexOffset;0;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;42;-1885.104,898.6608;Float;True;Emission;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;NEMO/NEMOx gradient-stripe;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;True;0;True;Transparent;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;8;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;77;0;74;0
WireConnection;78;0;77;0
WireConnection;75;1;74;0
WireConnection;75;0;78;0
WireConnection;75;2;77;0
WireConnection;28;0;75;0
WireConnection;69;0;67;0
WireConnection;16;0;28;2
WireConnection;16;1;15;0
WireConnection;70;2;68;0
WireConnection;70;1;69;0
WireConnection;30;0;16;0
WireConnection;30;1;29;0
WireConnection;62;0;61;0
WireConnection;62;1;70;0
WireConnection;31;0;30;0
WireConnection;63;0;62;2
WireConnection;64;0;63;0
WireConnection;64;1;66;0
WireConnection;17;0;31;0
WireConnection;65;0;64;0
WireConnection;20;0;26;0
WireConnection;34;0;33;0
WireConnection;21;0;20;0
WireConnection;21;1;22;0
WireConnection;35;0;21;0
WireConnection;35;1;34;0
WireConnection;36;0;34;0
WireConnection;52;0;50;0
WireConnection;52;1;51;0
WireConnection;52;2;58;0
WireConnection;52;3;56;0
WireConnection;37;0;35;0
WireConnection;37;1;36;0
WireConnection;41;0;39;0
WireConnection;41;1;40;0
WireConnection;41;2;45;0
WireConnection;25;0;37;0
WireConnection;53;0;52;0
WireConnection;42;0;41;0
WireConnection;0;2;44;0
WireConnection;0;10;10;0
WireConnection;0;11;54;0
ASEEND*/
//CHKSM=8FFCDA92CC3CD13EA560AD9F3D9FA1B696809870