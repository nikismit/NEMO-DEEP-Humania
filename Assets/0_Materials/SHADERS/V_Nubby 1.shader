// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.35 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.35;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:0,lgpr:1,limd:1,spmd:0,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:1,fgcg:0.5882353,fgcb:0.8182557,fgca:1,fgde:0.03,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:1242,x:34023,y:33283,varname:node_1242,prsc:2|diff-1468-RGB,emission-9179-OUT,voffset-608-OUT;n:type:ShaderForge.SFN_Color,id:1468,x:34018,y:33070,ptovrint:False,ptlb:node_1468,ptin:_node_1468,varname:node_1468,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:1,c3:0.08965516,c4:1;n:type:ShaderForge.SFN_Lerp,id:9556,x:33133,y:32571,varname:node_9556,prsc:2|A-9489-OUT,B-4874-OUT,T-6941-OUT;n:type:ShaderForge.SFN_Vector3,id:4874,x:32763,y:32619,varname:node_4874,prsc:2,v1:0,v2:0,v3:0;n:type:ShaderForge.SFN_Vector3,id:9489,x:32763,y:32534,varname:node_9489,prsc:2,v1:1,v2:1,v3:1;n:type:ShaderForge.SFN_ComponentMask,id:6893,x:32353,y:32743,varname:node_6893,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-7116-V;n:type:ShaderForge.SFN_RemapRange,id:8666,x:32554,y:32743,varname:node_8666,prsc:2,frmn:0,frmx:1,tomn:0.75,tomx:0.25|IN-6893-OUT;n:type:ShaderForge.SFN_Add,id:3677,x:32782,y:32743,varname:node_3677,prsc:2|A-8666-OUT,B-7344-OUT;n:type:ShaderForge.SFN_Slider,id:7344,x:32755,y:32944,ptovrint:False,ptlb:gradient loc,ptin:_gradientloc,varname:_node_778_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-2,cur:0.2393162,max:2;n:type:ShaderForge.SFN_ConstantClamp,id:6941,x:32912,y:32743,varname:node_6941,prsc:2,min:0,max:1|IN-3677-OUT;n:type:ShaderForge.SFN_Color,id:6600,x:33430,y:33127,ptovrint:False,ptlb:node_6600,ptin:_node_6600,varname:node_6600,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:9179,x:33727,y:33110,varname:node_9179,prsc:2|A-9556-OUT,B-6600-RGB,C-2593-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2106,x:33218,y:33200,ptovrint:False,ptlb:_breathValue,ptin:_breathValue,varname:node_3068,prsc:2,glob:True,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Add,id:2593,x:33297,y:33357,varname:node_2593,prsc:2|A-2106-OUT,B-8804-OUT;n:type:ShaderForge.SFN_Vector1,id:8804,x:33189,y:32984,varname:node_8804,prsc:2,v1:0.5;n:type:ShaderForge.SFN_TexCoord,id:7116,x:32072,y:32820,varname:node_7116,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_ComponentMask,id:2342,x:31227,y:35464,varname:node_2342,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-9363-UVOUT;n:type:ShaderForge.SFN_Lerp,id:1510,x:32800,y:35272,varname:node_1510,prsc:2|A-31-RGB,B-274-RGB,T-6451-OUT;n:type:ShaderForge.SFN_Color,id:31,x:32024,y:34979,ptovrint:False,ptlb:node_2739_copy,ptin:_node_2739_copy,varname:_node_2739_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Color,id:274,x:32169,y:35221,ptovrint:False,ptlb:node_2255_copy,ptin:_node_2255_copy,varname:_node_2255_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Clamp01,id:6451,x:32390,y:35388,varname:node_6451,prsc:2|IN-4733-OUT;n:type:ShaderForge.SFN_Multiply,id:4431,x:31726,y:35411,varname:node_4431,prsc:2|A-4543-OUT,B-5409-OUT,C-5172-OUT;n:type:ShaderForge.SFN_Sin,id:4694,x:31889,y:35411,varname:node_4694,prsc:2|IN-4431-OUT;n:type:ShaderForge.SFN_RemapRange,id:4733,x:32224,y:35388,varname:node_4733,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-4694-OUT;n:type:ShaderForge.SFN_Tau,id:5172,x:31726,y:35567,varname:node_5172,prsc:2;n:type:ShaderForge.SFN_Slider,id:4543,x:31227,y:35365,ptovrint:False,ptlb:gradient amount wobl,ptin:_gradientamountwobl,varname:_gradientamount_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:4.302442,max:8;n:type:ShaderForge.SFN_Time,id:8703,x:31046,y:35601,varname:node_8703,prsc:2;n:type:ShaderForge.SFN_Add,id:5409,x:31461,y:35464,varname:node_5409,prsc:2|A-2342-OUT,B-643-OUT;n:type:ShaderForge.SFN_Multiply,id:643,x:31461,y:35650,varname:node_643,prsc:2|A-8703-TSL,B-9632-OUT;n:type:ShaderForge.SFN_Slider,id:9632,x:31046,y:35760,ptovrint:False,ptlb:speed_copy,ptin:_speed_copy,varname:_speed_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:5,max:5;n:type:ShaderForge.SFN_Slider,id:5046,x:32464,y:34999,ptovrint:False,ptlb:brightness wobl,ptin:_brightnesswobl,varname:node_6903,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.40885,max:5;n:type:ShaderForge.SFN_TexCoord,id:9363,x:31046,y:35445,varname:node_9363,prsc:2,uv:1,uaff:False;n:type:ShaderForge.SFN_Multiply,id:1324,x:33387,y:33949,varname:node_1324,prsc:2|A-5046-OUT,B-1510-OUT;n:type:ShaderForge.SFN_Multiply,id:608,x:33435,y:33713,varname:node_608,prsc:2|A-9233-OUT,B-1324-OUT;n:type:ShaderForge.SFN_Lerp,id:9233,x:33144,y:33772,varname:node_9233,prsc:2|A-8225-OUT,B-1331-OUT,T-7116-V;n:type:ShaderForge.SFN_Vector3,id:8225,x:32907,y:33618,varname:node_8225,prsc:2,v1:0,v2:0,v3:0;n:type:ShaderForge.SFN_Vector3,id:1331,x:32907,y:33707,varname:node_1331,prsc:2,v1:1,v2:1,v3:1;proporder:1468-7344-6600-31-274-4543-9632-5046;pass:END;sub:END;*/

Shader "V_Nubbyplants" {
    Properties {
        _node_1468 ("node_1468", Color) = (0,1,0.08965516,1)
        _gradientloc ("gradient loc", Range(-2, 2)) = 0.2393162
        _node_6600 ("node_6600", Color) = (1,0,0,1)
        _node_2739_copy ("node_2739_copy", Color) = (1,1,1,1)
        _node_2255_copy ("node_2255_copy", Color) = (0,0,0,1)
        _gradientamountwobl ("gradient amount wobl", Range(0, 8)) = 4.302442
        _speed_copy ("speed_copy", Range(0, 5)) = 5
        _brightnesswobl ("brightness wobl", Range(0, 5)) = 0.40885
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
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles n3ds wiiu 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform float4 _node_1468;
            uniform float _gradientloc;
            uniform float4 _node_6600;
            uniform float _breathValue;
            uniform float4 _node_2739_copy;
            uniform float4 _node_2255_copy;
            uniform float _gradientamountwobl;
            uniform float _speed_copy;
            uniform float _brightnesswobl;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
                float3 normalDir : TEXCOORD4;
                float3 tangentDir : TEXCOORD5;
                float3 bitangentDir : TEXCOORD6;
                LIGHTING_COORDS(7,8)
                UNITY_FOG_COORDS(9)
                #if defined(LIGHTMAP_ON) || defined(UNITY_SHOULD_SAMPLE_SH)
                    float4 ambientOrLightmapUV : TEXCOORD10;
                #endif
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                #ifdef LIGHTMAP_ON
                    o.ambientOrLightmapUV.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
                    o.ambientOrLightmapUV.zw = 0;
                #elif UNITY_SHOULD_SAMPLE_SH
                #endif
                #ifdef DYNAMICLIGHTMAP_ON
                    o.ambientOrLightmapUV.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
                #endif
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                float4 node_8703 = _Time + _TimeEditor;
                v.vertex.xyz += (lerp(float3(0,0,0),float3(1,1,1),o.uv0.g)*(_brightnesswobl*lerp(_node_2739_copy.rgb,_node_2255_copy.rgb,saturate((sin((_gradientamountwobl*(o.uv1.r+(node_8703.r*_speed_copy))*6.28318530718))*0.5+0.5)))));
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// GI Data:
                UnityLight light;
                #ifdef LIGHTMAP_OFF
                    light.color = lightColor;
                    light.dir = lightDirection;
                    light.ndotl = LambertTerm (normalDirection, light.dir);
                #else
                    light.color = half3(0.f, 0.f, 0.f);
                    light.ndotl = 0.0f;
                    light.dir = half3(0.f, 0.f, 0.f);
                #endif
                UnityGIInput d;
                d.light = light;
                d.worldPos = i.posWorld.xyz;
                d.worldViewDir = viewDirection;
                d.atten = attenuation;
                #if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
                    d.ambient = 0;
                    d.lightmapUV = i.ambientOrLightmapUV;
                #else
                    d.ambient = i.ambientOrLightmapUV;
                #endif
                Unity_GlossyEnvironmentData ugls_en_data;
                ugls_en_data.roughness = 1.0 - 0;
                ugls_en_data.reflUVW = viewReflectDirection;
                UnityGI gi = UnityGlobalIllumination(d, 1, normalDirection, ugls_en_data );
                lightDirection = gi.light.dir;
                lightColor = gi.light.color;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += gi.indirect.diffuse;
                float3 diffuseColor = _node_1468.rgb;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float3 emissive = (lerp(float3(1,1,1),float3(0,0,0),clamp(((i.uv0.g.r*-0.5+0.75)+_gradientloc),0,1))*_node_6600.rgb*(_breathValue+0.5));
/// Final Color:
                float3 finalColor = diffuse + emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
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
            Cull Back
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles n3ds wiiu 
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
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float2 uv1 : TEXCOORD2;
                float2 uv2 : TEXCOORD3;
                float4 posWorld : TEXCOORD4;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                float4 node_8703 = _Time + _TimeEditor;
                v.vertex.xyz += (lerp(float3(0,0,0),float3(1,1,1),o.uv0.g)*(_brightnesswobl*lerp(_node_2739_copy.rgb,_node_2255_copy.rgb,saturate((sin((_gradientamountwobl*(o.uv1.r+(node_8703.r*_speed_copy))*6.28318530718))*0.5+0.5)))));
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
        Pass {
            Name "Meta"
            Tags {
                "LightMode"="Meta"
            }
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_META 1
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #include "UnityMetaPass.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles n3ds wiiu 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform float4 _node_1468;
            uniform float _gradientloc;
            uniform float4 _node_6600;
            uniform float _breathValue;
            uniform float4 _node_2739_copy;
            uniform float4 _node_2255_copy;
            uniform float _gradientamountwobl;
            uniform float _speed_copy;
            uniform float _brightnesswobl;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                float4 node_8703 = _Time + _TimeEditor;
                v.vertex.xyz += (lerp(float3(0,0,0),float3(1,1,1),o.uv0.g)*(_brightnesswobl*lerp(_node_2739_copy.rgb,_node_2255_copy.rgb,saturate((sin((_gradientamountwobl*(o.uv1.r+(node_8703.r*_speed_copy))*6.28318530718))*0.5+0.5)))));
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST );
                return o;
            }
            float4 frag(VertexOutput i) : SV_Target {
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                UnityMetaInput o;
                UNITY_INITIALIZE_OUTPUT( UnityMetaInput, o );
                
                o.Emission = (lerp(float3(1,1,1),float3(0,0,0),clamp(((i.uv0.g.r*-0.5+0.75)+_gradientloc),0,1))*_node_6600.rgb*(_breathValue+0.5));
                
                float3 diffColor = _node_1468.rgb;
                o.Albedo = diffColor;
                
                return UnityMetaFragment( o );
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
