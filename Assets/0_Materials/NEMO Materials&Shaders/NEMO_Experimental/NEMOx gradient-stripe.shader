// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "NEMO/NEMOx gradient-noise"
{
	Properties
	{
		_Speed("Speed", Vector) = (2,2,0,0)
		_Tiling("Tiling", Vector) = (5,5,0,0)
		[HDR]_Glowcolor("Glow color", Color) = (0,4.793103,5,1)
		_Slicecompletion("Slice completion", Range( -20 , 20)) = 0
		[KeywordEnum(Linear,From_center,Towards_center,Overall)] _Slicedirection("Slice direction", Float) = 0
		[KeywordEnum(X,Y,Z)] _Sliceorientation("Slice orientation", Float) = 0
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
		#pragma shader_feature _SLICEORIENTATION_X _SLICEORIENTATION_Y _SLICEORIENTATION_Z
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows vertex:vertexDataFunc 
		struct Input
		{
			float2 uv_texcoord;
			float3 worldPos;
		};

		uniform float _Slicecompletion;
		uniform float _Range;
		uniform float2 _Tiling;
		uniform float2 _Speed;
		uniform float _Vertexoffsetstrength;
		uniform float4 _Glowcolor;
		uniform float _Cutoff = 0.5;


		float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }

		float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }

		float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }

		float snoise( float2 v )
		{
			const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
			float2 i = floor( v + dot( v, C.yy ) );
			float2 x0 = v - i + dot( i, C.xx );
			float2 i1;
			i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
			float4 x12 = x0.xyxy + C.xxzz;
			x12.xy -= i1;
			i = mod2D289( i );
			float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
			float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
			m = m * m;
			m = m * m;
			float3 x = 2.0 * frac( p * C.www ) - 1.0;
			float3 h = abs( x ) - 0.5;
			float3 ox = floor( x + 0.5 );
			float3 a0 = x - ox;
			m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
			float3 g;
			g.x = a0.x * x0.x + h.x * x0.y;
			g.yz = a0.yz * x12.xz + h.yz * x12.yw;
			return 130.0 * dot( m, g );
		}


		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 ase_vertex3Pos = v.vertex.xyz;
			#if defined(_SLICEORIENTATION_X)
				float staticSwitch67 = ase_vertex3Pos.x;
			#elif defined(_SLICEORIENTATION_Y)
				float staticSwitch67 = ase_vertex3Pos.y;
			#elif defined(_SLICEORIENTATION_Z)
				float staticSwitch67 = ase_vertex3Pos.z;
			#else
				float staticSwitch67 = ase_vertex3Pos.x;
			#endif
			float temp_output_61_0 = abs( staticSwitch67 );
			#if defined(_SLICEDIRECTION_LINEAR)
				float staticSwitch62 = staticSwitch67;
			#elif defined(_SLICEDIRECTION_FROM_CENTER)
				float staticSwitch62 = ( 1.0 - temp_output_61_0 );
			#elif defined(_SLICEDIRECTION_TOWARDS_CENTER)
				float staticSwitch62 = temp_output_61_0;
			#elif defined(_SLICEDIRECTION_OVERALL)
				float staticSwitch62 = 0.0;
			#else
				float staticSwitch62 = staticSwitch67;
			#endif
			float4 temp_cast_0 = (staticSwitch62).xxxx;
			float4 transform28 = mul(unity_ObjectToWorld,temp_cast_0);
			float Gradient17 = saturate( ( ( transform28.y + _Slicecompletion ) / _Range ) );
			float2 panner6 = ( _Time.y * _Speed + float2( 0,0 ));
			float2 uv_TexCoord1 = v.texcoord.xy * _Tiling + panner6;
			float simplePerlin2D2 = snoise( uv_TexCoord1 );
			float Noise9 = ( simplePerlin2D2 + 1.0 );
			float3 VertexOffset53 = ( ase_vertex3Pos * Gradient17 * Noise9 * _Vertexoffsetstrength );
			v.vertex.xyz += VertexOffset53;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 panner6 = ( _Time.y * _Speed + float2( 0,0 ));
			float2 uv_TexCoord1 = i.uv_texcoord * _Tiling + panner6;
			float simplePerlin2D2 = snoise( uv_TexCoord1 );
			float Noise9 = ( simplePerlin2D2 + 1.0 );
			float3 ase_vertex3Pos = mul( unity_WorldToObject, float4( i.worldPos , 1 ) );
			#if defined(_SLICEORIENTATION_X)
				float staticSwitch67 = ase_vertex3Pos.x;
			#elif defined(_SLICEORIENTATION_Y)
				float staticSwitch67 = ase_vertex3Pos.y;
			#elif defined(_SLICEORIENTATION_Z)
				float staticSwitch67 = ase_vertex3Pos.z;
			#else
				float staticSwitch67 = ase_vertex3Pos.x;
			#endif
			float temp_output_61_0 = abs( staticSwitch67 );
			#if defined(_SLICEDIRECTION_LINEAR)
				float staticSwitch62 = staticSwitch67;
			#elif defined(_SLICEDIRECTION_FROM_CENTER)
				float staticSwitch62 = ( 1.0 - temp_output_61_0 );
			#elif defined(_SLICEDIRECTION_TOWARDS_CENTER)
				float staticSwitch62 = temp_output_61_0;
			#elif defined(_SLICEDIRECTION_OVERALL)
				float staticSwitch62 = 0.0;
			#else
				float staticSwitch62 = staticSwitch67;
			#endif
			float4 temp_cast_0 = (staticSwitch62).xxxx;
			float4 transform28 = mul(unity_ObjectToWorld,temp_cast_0);
			float Gradient17 = saturate( ( ( transform28.y + _Slicecompletion ) / _Range ) );
			float4 Emission42 = ( Noise9 * Gradient17 * _Glowcolor );
			o.Emission = Emission42.rgb;
			o.Alpha = 1;
			float temp_output_34_0 = ( Gradient17 * 4.0 );
			float OpacityMask25 = ( ( ( ( 1.0 - Gradient17 ) * Noise9 ) - temp_output_34_0 ) + ( 1.0 - temp_output_34_0 ) );
			clip( OpacityMask25 - _Cutoff );
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15600
464;565;1275;803;4071.214;1039.622;4.251397;True;True
Node;AmplifyShaderEditor.CommentaryNode;27;-2353.415,-177.4062;Float;False;1874.115;433.2058;;12;67;17;31;30;29;16;28;15;62;14;61;79;Gradient;1,1,1,1;0;0
Node;AmplifyShaderEditor.PosVertexDataNode;14;-2302.915,-127.0143;Float;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;67;-2111.591,-126.0209;Float;False;Property;_Sliceorientation;Slice orientation;5;0;Create;True;0;0;False;0;0;0;0;True;;KeywordEnum;3;X;Y;Z;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;61;-2112.903,1.210092;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;79;-1920.414,1.070291;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;13;-2354.979,-689.7177;Float;False;1573.769;433.3497;;10;60;9;11;2;12;1;5;6;7;8;Noise;1,1,1,1;0;0
Node;AmplifyShaderEditor.StaticSwitch;62;-1728.008,-127.0665;Float;False;Property;_Slicedirection;Slice direction;4;0;Create;True;0;0;False;0;0;0;0;True;;KeywordEnum;4;Linear;From_center;Towards_center;Overall;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;8;-2303.858,-511.0306;Float;False;Constant;_Speedx;Speed x;2;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;7;-2144.858,-511.0306;Float;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ObjectToWorldTransfNode;28;-1406.381,-127.9332;Float;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector2Node;60;-2303.002,-414.2946;Float;False;Property;_Speed;Speed;0;0;Create;True;0;0;False;0;2,2;2,2;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;15;-1406.22,31.711;Float;False;Property;_Slicecompletion;Slice completion;3;0;Create;True;0;0;False;0;0;0;-20;20;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;5;-1919.679,-639.2789;Float;False;Property;_Tiling;Tiling;1;0;Create;True;0;0;False;0;5,5;5,5;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;29;-1021.686,31.98346;Float;False;Property;_Range;Range;6;0;Create;True;0;0;False;0;8;5;-30;30;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;16;-1149.746,-127.563;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;6;-1919.857,-511.0306;Float;False;3;0;FLOAT2;0,0;False;2;FLOAT2;-1,-1;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;1;-1664.836,-639.7177;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleDivideOpNode;30;-1021.897,-127.6586;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;2;-1407.217,-639.0382;Float;True;Simplex2D;1;0;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;38;-2357.413,333.7409;Float;False;1190.283;355.6656;;10;26;20;25;35;21;37;22;33;34;36;Opacity Mask;1,1,1,1;0;0
Node;AmplifyShaderEditor.SaturateNode;31;-894.7785,-127.979;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;12;-1408.177,-415.0551;Float;False;Constant;_Glowboost;Glow boost;3;0;Create;True;0;0;False;0;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;11;-1151.177,-639.0551;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;26;-2305.849,385.1711;Float;False;17;Gradient;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;17;-734.8473,-127.9352;Float;True;Gradient;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;33;-2050.225,574.4064;Float;False;17;Gradient;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;22;-2307.413,511.8259;Float;False;9;Noise;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;9;-1024.205,-639.4214;Float;True;Noise;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;20;-2114.843,385.0462;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;34;-1857.175,555.247;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;4;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;21;-1922.219,383.7409;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;46;-2352.479,847.2336;Float;False;710.3752;514.4218;;5;45;40;39;41;42;Emission;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;59;-2353.672,1485.636;Float;False;965.5748;368.7717;;6;50;51;58;56;53;52;Vertex Offset;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;56;-2047.594,1739.408;Float;False;Property;_Vertexoffsetstrength;Vertex offset strength;7;0;Create;True;0;0;False;0;0;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;51;-2047.622,1599.278;Float;False;17;Gradient;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;40;-2301.479,1026.187;Float;False;17;Gradient;0;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;50;-2303.672,1536.661;Float;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;58;-2047.077,1668.604;Float;False;9;Noise;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;35;-1761.761,383.78;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;45;-2300.924,1154.655;Float;False;Property;_Glowcolor;Glow color;2;1;[HDR];Create;True;0;0;False;0;0,4.793103,5,1;0,4.793103,5,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;39;-2302.479,897.2336;Float;False;9;Noise;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;36;-1666.283,579.2646;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;37;-1601.987,384.1303;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;41;-2045.134,898.8067;Float;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;52;-1791.768,1536.801;Float;False;4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;10;-256.7396,129.4426;Float;False;25;OpacityMask;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;53;-1631.098,1535.636;Float;True;VertexOffset;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;54;-256.1531,256.9473;Float;False;53;VertexOffset;0;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;25;-1410.13,384.8115;Float;True;OpacityMask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;44;-255.0151,0.6974335;Float;False;42;Emission;0;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;42;-1885.104,898.6608;Float;True;Emission;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;NEMO/NEMOx gradient-noise;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;True;0;True;Transparent;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;8;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;67;1;14;1
WireConnection;67;0;14;2
WireConnection;67;2;14;3
WireConnection;61;0;67;0
WireConnection;79;0;61;0
WireConnection;62;1;67;0
WireConnection;62;0;79;0
WireConnection;62;2;61;0
WireConnection;7;0;8;0
WireConnection;28;0;62;0
WireConnection;16;0;28;2
WireConnection;16;1;15;0
WireConnection;6;2;60;0
WireConnection;6;1;7;0
WireConnection;1;0;5;0
WireConnection;1;1;6;0
WireConnection;30;0;16;0
WireConnection;30;1;29;0
WireConnection;2;0;1;0
WireConnection;31;0;30;0
WireConnection;11;0;2;0
WireConnection;11;1;12;0
WireConnection;17;0;31;0
WireConnection;9;0;11;0
WireConnection;20;0;26;0
WireConnection;34;0;33;0
WireConnection;21;0;20;0
WireConnection;21;1;22;0
WireConnection;35;0;21;0
WireConnection;35;1;34;0
WireConnection;36;0;34;0
WireConnection;37;0;35;0
WireConnection;37;1;36;0
WireConnection;41;0;39;0
WireConnection;41;1;40;0
WireConnection;41;2;45;0
WireConnection;52;0;50;0
WireConnection;52;1;51;0
WireConnection;52;2;58;0
WireConnection;52;3;56;0
WireConnection;53;0;52;0
WireConnection;25;0;37;0
WireConnection;42;0;41;0
WireConnection;0;2;44;0
WireConnection;0;10;10;0
WireConnection;0;11;54;0
ASEEND*/
//CHKSM=B394A5DB7ACBCC2233A7996E3797AF1BF4326A1F