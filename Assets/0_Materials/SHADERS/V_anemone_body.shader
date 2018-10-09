// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:1,fgcg:0.5882353,fgcb:0.8182557,fgca:1,fgde:0.03,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:1242,x:33687,y:32472,varname:node_1242,prsc:2|diff-8430-OUT,diffpow-8430-OUT,amdfl-2793-OUT,voffset-672-OUT;n:type:ShaderForge.SFN_ComponentMask,id:5835,x:30941,y:35106,varname:node_5835,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-3058-V;n:type:ShaderForge.SFN_Lerp,id:3330,x:32514,y:34914,varname:node_3330,prsc:2|A-7076-RGB,B-2942-RGB,T-8532-OUT;n:type:ShaderForge.SFN_Color,id:7076,x:31738,y:34621,ptovrint:False,ptlb:node_2739_copy,ptin:_node_2739_copy,varname:_node_2739_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Color,id:2942,x:31883,y:34863,ptovrint:False,ptlb:node_2255_copy,ptin:_node_2255_copy,varname:_node_2255_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Clamp01,id:8532,x:32104,y:35030,varname:node_8532,prsc:2|IN-2704-OUT;n:type:ShaderForge.SFN_Multiply,id:6637,x:31440,y:35053,varname:node_6637,prsc:2|A-4802-OUT,B-8507-OUT,C-6189-OUT;n:type:ShaderForge.SFN_Sin,id:1399,x:31603,y:35053,varname:node_1399,prsc:2|IN-6637-OUT;n:type:ShaderForge.SFN_RemapRange,id:2704,x:31938,y:35030,varname:node_2704,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-1399-OUT;n:type:ShaderForge.SFN_Tau,id:6189,x:31440,y:35209,varname:node_6189,prsc:2;n:type:ShaderForge.SFN_Slider,id:4802,x:30941,y:35007,ptovrint:False,ptlb:gradient amount wobl,ptin:_gradientamountwobl,varname:_gradientamount_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:4.302442,max:8;n:type:ShaderForge.SFN_Time,id:5262,x:30760,y:35243,varname:node_5262,prsc:2;n:type:ShaderForge.SFN_Add,id:8507,x:31175,y:35106,varname:node_8507,prsc:2|A-5835-OUT,B-6152-OUT;n:type:ShaderForge.SFN_Multiply,id:6152,x:31175,y:35292,varname:node_6152,prsc:2|A-5262-TSL,B-9159-OUT;n:type:ShaderForge.SFN_Slider,id:9159,x:30760,y:35402,ptovrint:False,ptlb:speed_copy,ptin:_speed_copy,varname:_speed_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:5,max:5;n:type:ShaderForge.SFN_Slider,id:2467,x:32178,y:34641,ptovrint:False,ptlb:brightness wobl,ptin:_brightnesswobl,varname:node_6903,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:10;n:type:ShaderForge.SFN_TexCoord,id:3058,x:30760,y:35087,varname:node_3058,prsc:2,uv:0;n:type:ShaderForge.SFN_TexCoord,id:9772,x:30568,y:34872,varname:node_9772,prsc:2,uv:0;n:type:ShaderForge.SFN_Multiply,id:5115,x:33101,y:33591,varname:node_5115,prsc:2|A-2467-OUT,B-3330-OUT;n:type:ShaderForge.SFN_Lerp,id:9668,x:30903,y:34771,varname:node_9668,prsc:2|A-6571-OUT,B-4322-OUT,T-9772-V;n:type:ShaderForge.SFN_Multiply,id:672,x:33401,y:32831,varname:node_672,prsc:2|A-9668-OUT,B-5115-OUT;n:type:ShaderForge.SFN_Vector3,id:6571,x:30603,y:34678,varname:node_6571,prsc:2,v1:0,v2:0,v3:0;n:type:ShaderForge.SFN_Vector3,id:4322,x:30603,y:34585,varname:node_4322,prsc:2,v1:1,v2:1,v3:1;n:type:ShaderForge.SFN_Color,id:3037,x:32017,y:32098,ptovrint:False,ptlb:base color,ptin:_basecolor,varname:node_3941,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.251211,c2:0.2024221,c3:0.3529412,c4:1;n:type:ShaderForge.SFN_Fresnel,id:6880,x:32113,y:32497,varname:node_6880,prsc:2|NRM-1144-OUT,EXP-8080-OUT;n:type:ShaderForge.SFN_NormalVector,id:1144,x:31835,y:32433,prsc:2,pt:True;n:type:ShaderForge.SFN_Add,id:8430,x:32808,y:32256,varname:node_8430,prsc:2|A-3037-RGB,B-9423-OUT;n:type:ShaderForge.SFN_Vector1,id:8080,x:31941,y:32646,varname:node_8080,prsc:2,v1:2;n:type:ShaderForge.SFN_Color,id:5267,x:32017,y:32283,ptovrint:False,ptlb:node_2418,ptin:_node_2418,varname:node_2418,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.4000865,c2:0.6798114,c3:0.7352941,c4:1;n:type:ShaderForge.SFN_Multiply,id:9423,x:32274,y:32321,varname:node_9423,prsc:2|A-5267-RGB,B-6880-OUT;n:type:ShaderForge.SFN_Vector1,id:4656,x:32422,y:32129,varname:node_4656,prsc:2,v1:0.2;n:type:ShaderForge.SFN_Color,id:6565,x:32742,y:32500,ptovrint:False,ptlb:base color_copy,ptin:_basecolor_copy,varname:_basecolor_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5511157,c2:0,c3:0.5588235,c4:1;n:type:ShaderForge.SFN_Fresnel,id:8336,x:32794,y:32876,varname:node_8336,prsc:2|NRM-4813-OUT,EXP-992-OUT;n:type:ShaderForge.SFN_NormalVector,id:4813,x:32581,y:32876,prsc:2,pt:True;n:type:ShaderForge.SFN_Add,id:2793,x:33042,y:32438,varname:node_2793,prsc:2|A-6565-RGB,B-8785-OUT;n:type:ShaderForge.SFN_Vector1,id:992,x:32502,y:33008,varname:node_992,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:8785,x:32940,y:32669,varname:node_8785,prsc:2|A-2352-RGB,B-8336-OUT;n:type:ShaderForge.SFN_Color,id:2352,x:32621,y:32689,ptovrint:False,ptlb:node_9448_copy,ptin:_node_9448_copy,varname:_node_9448_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:1,c3:0.9586205,c4:1;proporder:7076-2942-4802-9159-2467-3037-5267-6565-2352;pass:END;sub:END;*/

Shader "V_anemone_body" {
    Properties {
        _node_2739_copy ("node_2739_copy", Color) = (1,1,1,1)
        _node_2255_copy ("node_2255_copy", Color) = (0,0,0,1)
        _gradientamountwobl ("gradient amount wobl", Range(0, 8)) = 4.302442
        _speed_copy ("speed_copy", Range(0, 5)) = 5
        _brightnesswobl ("brightness wobl", Range(0, 10)) = 0
        _basecolor ("base color", Color) = (0.251211,0.2024221,0.3529412,1)
        _node_2418 ("node_2418", Color) = (0.4000865,0.6798114,0.7352941,1)
        _basecolor_copy ("base color_copy", Color) = (0.5511157,0,0.5588235,1)
        _node_9448_copy ("node_9448_copy", Color) = (0,1,0.9586205,1)
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
            uniform float4 _TimeEditor;
            uniform float4 _node_2739_copy;
            uniform float4 _node_2255_copy;
            uniform float _gradientamountwobl;
            uniform float _speed_copy;
            uniform float _brightnesswobl;
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
                float4 node_5262 = _Time + _TimeEditor;
                v.vertex.xyz += (lerp(float3(0,0,0),float3(1,1,1),o.uv0.g)*(_brightnesswobl*lerp(_node_2739_copy.rgb,_node_2255_copy.rgb,saturate((sin((_gradientamountwobl*(o.uv0.g.r+(node_5262.r*_speed_copy))*6.28318530718))*0.5+0.5)))));
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
                float3 node_8430 = (_basecolor.rgb+(_node_2418.rgb*pow(1.0-max(0,dot(normalDirection, viewDirection)),2.0)));
                float3 directDiffuse = pow(max( 0.0, NdotL), node_8430) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                indirectDiffuse += (_basecolor_copy.rgb+(_node_9448_copy.rgb*pow(1.0-max(0,dot(normalDirection, viewDirection)),2.0))); // Diffuse Ambient Light
                float3 diffuseColor = node_8430;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
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
            uniform float4 _TimeEditor;
            uniform float4 _node_2739_copy;
            uniform float4 _node_2255_copy;
            uniform float _gradientamountwobl;
            uniform float _speed_copy;
            uniform float _brightnesswobl;
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
                float4 node_5262 = _Time + _TimeEditor;
                v.vertex.xyz += (lerp(float3(0,0,0),float3(1,1,1),o.uv0.g)*(_brightnesswobl*lerp(_node_2739_copy.rgb,_node_2255_copy.rgb,saturate((sin((_gradientamountwobl*(o.uv0.g.r+(node_5262.r*_speed_copy))*6.28318530718))*0.5+0.5)))));
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
                float3 node_8430 = (_basecolor.rgb+(_node_2418.rgb*pow(1.0-max(0,dot(normalDirection, viewDirection)),2.0)));
                float3 directDiffuse = pow(max( 0.0, NdotL), node_8430) * attenColor;
                float3 diffuseColor = node_8430;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform float4 _node_2739_copy;
            uniform float4 _node_2255_copy;
            uniform float _gradientamountwobl;
            uniform float _speed_copy;
            uniform float _brightnesswobl;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                float4 node_5262 = _Time + _TimeEditor;
                v.vertex.xyz += (lerp(float3(0,0,0),float3(1,1,1),o.uv0.g)*(_brightnesswobl*lerp(_node_2739_copy.rgb,_node_2255_copy.rgb,saturate((sin((_gradientamountwobl*(o.uv0.g.r+(node_5262.r*_speed_copy))*6.28318530718))*0.5+0.5)))));
                o.pos = UnityObjectToClipPos(v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
