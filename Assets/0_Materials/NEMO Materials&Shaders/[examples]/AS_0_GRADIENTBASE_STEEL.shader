// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "AS_0_GRADIENTBASE_STEEL"
{
	Properties
	{
		_InnerColor("Inner Color", Color) = (0,0,0,0)
		_OuterColor("Outer Color", Color) = (0,0,0,0)
		_Mapping("Mapping", Range( -2 , 2)) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#pragma target 4.6
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows exclude_path:deferred 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform float4 _InnerColor;
		uniform float4 _OuterColor;
		uniform float _Mapping;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float clampResult4 = clamp( ( (0.0 + (i.uv_texcoord.y - 0.0) * (1.3 - 0.0) / (1.0 - 0.0)) + _Mapping ) , -1.0 , 1.0 );
			float4 lerpResult1 = lerp( _InnerColor , _OuterColor , clampResult4);
			float4 temp_output_10_0 = saturate( lerpResult1 );
			o.Albedo = temp_output_10_0.rgb;
			o.Emission = temp_output_10_0.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15401
173;336;980;645;509.499;53.8505;1;True;False
Node;AmplifyShaderEditor.TextureCoordinatesNode;9;-1336.5,384;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;8;-1046.5,387;Float;False;True;True;True;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;6;-808.5,395;Float;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1.3;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-868.5,572;Float;False;Property;_Mapping;Mapping;2;0;Create;True;0;0;False;0;0;0;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;5;-520.5,355;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;3;-532.5,66;Float;False;Property;_OuterColor;Outer Color;1;0;Create;True;0;0;False;0;0,0,0,0;0.5411765,0,0.2392156,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;2;-531.5,-113;Float;False;Property;_InnerColor;Inner Color;0;0;Create;True;0;0;False;0;0,0,0,0;0.5647059,0.1294117,0.2588235,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;4;-374.5,355;Float;False;3;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1;-247.5,-5;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;10;-99.49854,49.64951;Float;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;221,87;Float;False;True;6;Float;ASEMaterialInspector;0;0;Standard;AS_0_GRADIENTBASE_STEEL;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;ForwardOnly;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;8;0;9;2
WireConnection;6;0;8;0
WireConnection;5;0;6;0
WireConnection;5;1;7;0
WireConnection;4;0;5;0
WireConnection;1;0;2;0
WireConnection;1;1;3;0
WireConnection;1;2;4;0
WireConnection;10;0;1;0
WireConnection;0;0;10;0
WireConnection;0;2;10;0
ASEEND*/
//CHKSM=0A212B1A9ECCB72D7893AA0C147E7B32F7CDA454