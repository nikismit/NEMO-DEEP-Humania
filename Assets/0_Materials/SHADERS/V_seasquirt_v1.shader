// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:1,fgcg:0.5882353,fgcb:0.8182557,fgca:1,fgde:0.03,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:1242,x:34116,y:31861,varname:node_1242,prsc:2|diff-365-OUT,emission-9179-OUT,amdfl-7210-OUT;n:type:ShaderForge.SFN_Color,id:1468,x:33133,y:32431,ptovrint:False,ptlb:node_1468,ptin:_node_1468,varname:node_1468,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:1,c3:0.08965516,c4:1;n:type:ShaderForge.SFN_Lerp,id:9556,x:33133,y:32571,varname:node_9556,prsc:2|A-9489-OUT,B-4874-OUT,T-6941-OUT;n:type:ShaderForge.SFN_Vector3,id:4874,x:32763,y:32619,varname:node_4874,prsc:2,v1:0,v2:0,v3:0;n:type:ShaderForge.SFN_Vector3,id:9489,x:32763,y:32534,varname:node_9489,prsc:2,v1:1,v2:1,v3:1;n:type:ShaderForge.SFN_TexCoord,id:9590,x:32082,y:32845,varname:node_9590,prsc:2,uv:0;n:type:ShaderForge.SFN_ComponentMask,id:6893,x:32266,y:32865,varname:node_6893,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-9590-V;n:type:ShaderForge.SFN_RemapRange,id:8666,x:32554,y:32743,varname:node_8666,prsc:2,frmn:0,frmx:1,tomn:0.25,tomx:0.75|IN-6893-OUT;n:type:ShaderForge.SFN_Add,id:3677,x:32763,y:32743,varname:node_3677,prsc:2|A-8666-OUT,B-7344-OUT;n:type:ShaderForge.SFN_Slider,id:7344,x:32455,y:33036,ptovrint:False,ptlb:gradient loc,ptin:_gradientloc,varname:_node_778_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-2,cur:0.2393162,max:2;n:type:ShaderForge.SFN_ConstantClamp,id:6941,x:32931,y:32743,varname:node_6941,prsc:2,min:0,max:1|IN-3677-OUT;n:type:ShaderForge.SFN_Color,id:6600,x:33133,y:32728,ptovrint:False,ptlb:node_6600,ptin:_node_6600,varname:node_6600,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:9179,x:33421,y:32565,varname:node_9179,prsc:2|A-9556-OUT,B-6600-RGB,C-4908-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4908,x:33148,y:32958,ptovrint:False,ptlb:node_4908,ptin:_node_4908,varname:node_4908,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Color,id:4885,x:32690,y:31384,ptovrint:False,ptlb:base color,ptin:_basecolor,varname:node_3941,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.251211,c2:0.2024221,c3:0.3529412,c4:1;n:type:ShaderForge.SFN_Fresnel,id:7644,x:32786,y:31783,varname:node_7644,prsc:2|NRM-3086-OUT,EXP-5052-OUT;n:type:ShaderForge.SFN_NormalVector,id:3086,x:32508,y:31719,prsc:2,pt:True;n:type:ShaderForge.SFN_Add,id:365,x:33481,y:31542,varname:node_365,prsc:2|A-4885-RGB,B-145-OUT;n:type:ShaderForge.SFN_Vector1,id:5052,x:32614,y:31932,varname:node_5052,prsc:2,v1:2;n:type:ShaderForge.SFN_Color,id:3317,x:32690,y:31569,ptovrint:False,ptlb:node_2418,ptin:_node_2418,varname:node_2418,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.4000865,c2:0.6798114,c3:0.7352941,c4:1;n:type:ShaderForge.SFN_Multiply,id:145,x:32947,y:31607,varname:node_145,prsc:2|A-3317-RGB,B-7644-OUT;n:type:ShaderForge.SFN_Vector1,id:7097,x:33095,y:31415,varname:node_7097,prsc:2,v1:0.2;n:type:ShaderForge.SFN_Color,id:648,x:33415,y:31786,ptovrint:False,ptlb:base color_copy,ptin:_basecolor_copy,varname:_basecolor_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5511157,c2:0,c3:0.5588235,c4:1;n:type:ShaderForge.SFN_Fresnel,id:8279,x:33467,y:32162,varname:node_8279,prsc:2|NRM-6542-OUT,EXP-7439-OUT;n:type:ShaderForge.SFN_NormalVector,id:6542,x:33254,y:32162,prsc:2,pt:True;n:type:ShaderForge.SFN_Add,id:7210,x:33715,y:31724,varname:node_7210,prsc:2|A-648-RGB,B-4677-OUT;n:type:ShaderForge.SFN_Vector1,id:7439,x:33175,y:32294,varname:node_7439,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:4677,x:33613,y:31955,varname:node_4677,prsc:2|A-5282-RGB,B-8279-OUT;n:type:ShaderForge.SFN_Color,id:5282,x:33294,y:31975,ptovrint:False,ptlb:node_9448_copy,ptin:_node_9448_copy,varname:_node_9448_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:1,c3:0.9586205,c4:1;proporder:1468-7344-6600-4908-648-5282-4885-3317;pass:END;sub:END;*/

Shader "V_seasquirt_v1" {
    Properties {
        _node_1468 ("node_1468", Color) = (0,1,0.08965516,1)
        _gradientloc ("gradient loc", Range(-2, 2)) = 0.2393162
        _node_6600 ("node_6600", Color) = (1,0,0,1)
        _node_4908 ("node_4908", Float ) = 0
        _basecolor_copy ("base color_copy", Color) = (0.5511157,0,0.5588235,1)
        _node_9448_copy ("node_9448_copy", Color) = (0,1,0.9586205,1)
        _basecolor ("base color", Color) = (0.251211,0.2024221,0.3529412,1)
        _node_2418 ("node_2418", Color) = (0.4000865,0.6798114,0.7352941,1)
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        LOD 200
        Pass {
            Name "FORWARD"
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
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float _gradientloc;
            uniform float4 _node_6600;
            uniform float _node_4908;
            uniform float4 _basecolor;
            uniform float4 _node_2418;
            uniform float4 _basecolor_copy;
            uniform float4 _node_9448_copy;
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
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                indirectDiffuse += (_basecolor_copy.rgb+(_node_9448_copy.rgb*pow(1.0-max(0,dot(normalDirection, viewDirection)),2.0))); // Diffuse Ambient Light
                float3 diffuseColor = (_basecolor.rgb+(_node_2418.rgb*pow(1.0-max(0,dot(normalDirection, viewDirection)),2.0)));
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float3 emissive = (lerp(float3(1,1,1),float3(0,0,0),clamp(((i.uv0.g.r*0.5+0.25)+_gradientloc),0,1))*_node_6600.rgb*_node_4908);
/// Final Color:
                float3 finalColor = diffuse + emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float _gradientloc;
            uniform float4 _node_6600;
            uniform float _node_4908;
            uniform float4 _basecolor;
            uniform float4 _node_2418;
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
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 diffuseColor = (_basecolor.rgb+(_node_2418.rgb*pow(1.0-max(0,dot(normalDirection, viewDirection)),2.0)));
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
