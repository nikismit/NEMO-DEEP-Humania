// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.04 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.04;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,rprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:0,bsrc:0,bdst:1,culm:0,dpts:2,wrdp:True,dith:2,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.009709475,fgcg:0.003027681,fgcb:0.05147058,fgca:0.4117647,fgde:1,fgrn:12,fgrf:350,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:2440,x:34917,y:32528,varname:node_2440,prsc:2|diff-984-OUT,gloss-3763-OUT,amdfl-5336-OUT;n:type:ShaderForge.SFN_Color,id:3941,x:34353,y:32095,ptovrint:False,ptlb:base color,ptin:_basecolor,varname:node_3941,prsc:2,glob:False,c1:0.251211,c2:0.2024221,c3:0.3529412,c4:1;n:type:ShaderForge.SFN_Fresnel,id:2432,x:33430,y:32715,varname:node_2432,prsc:2|NRM-9157-OUT,EXP-4880-OUT;n:type:ShaderForge.SFN_NormalVector,id:9157,x:33152,y:32651,prsc:2,pt:True;n:type:ShaderForge.SFN_Add,id:5866,x:33868,y:32477,varname:node_5866,prsc:2|B-5471-OUT;n:type:ShaderForge.SFN_Vector1,id:4880,x:33258,y:32864,varname:node_4880,prsc:2,v1:3;n:type:ShaderForge.SFN_Color,id:2418,x:34167,y:32246,ptovrint:False,ptlb:node_2418,ptin:_node_2418,varname:node_2418,prsc:2,glob:False,c1:0.4000865,c2:0.6798114,c3:0.7352941,c4:1;n:type:ShaderForge.SFN_Multiply,id:5471,x:33675,y:32569,varname:node_5471,prsc:2|B-2432-OUT;n:type:ShaderForge.SFN_Vector1,id:3763,x:34554,y:32580,varname:node_3763,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Color,id:3563,x:33465,y:32978,ptovrint:False,ptlb:base color_copy,ptin:_basecolor_copy,varname:_basecolor_copy,prsc:2,glob:False,c1:0.251211,c2:0.2024221,c3:0.3529412,c4:1;n:type:ShaderForge.SFN_Fresnel,id:3750,x:33561,y:33377,varname:node_3750,prsc:2|NRM-2687-OUT,EXP-6074-OUT;n:type:ShaderForge.SFN_NormalVector,id:2687,x:33283,y:33313,prsc:2,pt:True;n:type:ShaderForge.SFN_Add,id:5336,x:33849,y:32784,varname:node_5336,prsc:2|A-3563-RGB,B-8098-OUT;n:type:ShaderForge.SFN_Vector1,id:6074,x:33389,y:33526,varname:node_6074,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:8098,x:33806,y:33231,varname:node_8098,prsc:2|A-6633-RGB,B-3750-OUT;n:type:ShaderForge.SFN_Color,id:6633,x:33465,y:33163,ptovrint:False,ptlb:node_9448_copy,ptin:_node_9448_copy,varname:_node_9448_copy,prsc:2,glob:False,c1:0.589427,c2:0.1488971,c3:0.5955882,c4:1;n:type:ShaderForge.SFN_Lerp,id:984,x:34622,y:32355,varname:node_984,prsc:2|A-3941-RGB,B-2418-RGB,T-1267-RGB;n:type:ShaderForge.SFN_Tex2d,id:1267,x:34167,y:32419,ptovrint:False,ptlb:node_1267,ptin:_node_1267,varname:node_1267,prsc:2,tex:bec04ffdcc9761741916cb3e7a98d1be,ntxv:2,isnm:False;proporder:3941-2418-3563-6633-1267;pass:END;sub:END;*/

Shader "Rock_ravine" {
    Properties {
        _basecolor ("base color", Color) = (0.251211,0.2024221,0.3529412,1)
        _node_2418 ("node_2418", Color) = (0.4000865,0.6798114,0.7352941,1)
        _basecolor_copy ("base color_copy", Color) = (0.251211,0.2024221,0.3529412,1)
        _node_9448_copy ("node_9448_copy", Color) = (0.589427,0.1488971,0.5955882,1)
        _node_1267 ("node_1267", 2D) = "black" {}
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "ForwardBase"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _basecolor;
            uniform float4 _node_2418;
            uniform float4 _basecolor_copy;
            uniform float4 _node_9448_copy;
            uniform sampler2D _node_1267; uniform float4 _node_1267_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = mul(unity_ObjectToWorld, float4(v.normal,0)).xyz;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
/////// Vectors:
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 indirectDiffuse = float3(0,0,0);
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                indirectDiffuse += (_basecolor_copy.rgb+(_node_9448_copy.rgb*pow(1.0-max(0,dot(normalDirection, viewDirection)),2.0))); // Diffuse Ambient Light
                float4 _node_1267_var = tex2D(_node_1267,TRANSFORM_TEX(i.uv0, _node_1267));
                float3 diffuse = (directDiffuse + indirectDiffuse) * lerp(_basecolor.rgb,_node_2418.rgb,_node_1267_var.rgb);
/// Final Color:
                float3 finalColor = diffuse;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "ForwardAdd"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            Fog { Color (0,0,0,0) }
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _basecolor;
            uniform float4 _node_2418;
            uniform sampler2D _node_1267; uniform float4 _node_1267_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = mul(unity_ObjectToWorld, float4(v.normal,0)).xyz;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
/////// Vectors:
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float4 _node_1267_var = tex2D(_node_1267,TRANSFORM_TEX(i.uv0, _node_1267));
                float3 diffuse = directDiffuse * lerp(_basecolor.rgb,_node_2418.rgb,_node_1267_var.rgb);
/// Final Color:
                float3 finalColor = diffuse;
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
