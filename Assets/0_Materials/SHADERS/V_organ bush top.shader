// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.35 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.35;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0,fgcg:0,fgcb:0,fgca:0.4117647,fgde:0.015,fgrn:50,fgrf:557.3,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:1242,x:33687,y:32472,varname:node_1242,prsc:2|diff-1468-RGB,emission-9179-OUT,lwrap-1468-RGB,amdfl-1468-RGB;n:type:ShaderForge.SFN_Color,id:1468,x:33133,y:32431,ptovrint:False,ptlb:base color,ptin:_basecolor,varname:node_1468,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:1,c3:0.08965516,c4:1;n:type:ShaderForge.SFN_Lerp,id:9556,x:33133,y:32571,varname:node_9556,prsc:2|A-9489-OUT,B-4874-OUT,T-6941-OUT;n:type:ShaderForge.SFN_Vector3,id:4874,x:32763,y:32619,varname:node_4874,prsc:2,v1:0,v2:0,v3:0;n:type:ShaderForge.SFN_Vector3,id:9489,x:32763,y:32534,varname:node_9489,prsc:2,v1:1,v2:1,v3:1;n:type:ShaderForge.SFN_TexCoord,id:9590,x:32082,y:32845,varname:node_9590,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_ComponentMask,id:6893,x:32266,y:32865,varname:node_6893,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-9590-V;n:type:ShaderForge.SFN_RemapRange,id:8666,x:32554,y:32743,varname:node_8666,prsc:2,frmn:0,frmx:1,tomn:0.5,tomx:1|IN-6893-OUT;n:type:ShaderForge.SFN_Add,id:3677,x:32763,y:32743,varname:node_3677,prsc:2|A-8666-OUT,B-2593-OUT;n:type:ShaderForge.SFN_Slider,id:7344,x:32109,y:33127,ptovrint:False,ptlb:gradient loc (not working),ptin:_gradientlocnotworking,varname:_node_778_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-2,cur:0.2393162,max:2;n:type:ShaderForge.SFN_ConstantClamp,id:6941,x:32931,y:32743,varname:node_6941,prsc:2,min:0,max:1|IN-3677-OUT;n:type:ShaderForge.SFN_Color,id:6600,x:33133,y:32728,ptovrint:False,ptlb:glow color,ptin:_glowcolor,varname:node_6600,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:9179,x:33421,y:32565,varname:node_9179,prsc:2|A-9556-OUT,B-6600-RGB,C-9078-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9078,x:33112,y:32949,ptovrint:False,ptlb:luminosity gradient,ptin:_luminositygradient,varname:node_9078,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:2106,x:32407,y:33206,ptovrint:False,ptlb:_breathValue,ptin:_breathValue,varname:node_3068,prsc:2,glob:True,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:2117,x:32569,y:33107,varname:node_2117,prsc:2|A-2106-OUT,B-2111-OUT;n:type:ShaderForge.SFN_Vector1,id:2111,x:32407,y:33268,varname:node_2111,prsc:2,v1:-1;n:type:ShaderForge.SFN_Add,id:2593,x:32671,y:32933,varname:node_2593,prsc:2|A-2117-OUT,B-8804-OUT;n:type:ShaderForge.SFN_Vector1,id:8804,x:32471,y:32985,varname:node_8804,prsc:2,v1:0.5;proporder:1468-7344-6600-9078;pass:END;sub:END;*/

Shader "V_organ bush top" {
    Properties {
        _basecolor ("base color", Color) = (0,1,0.08965516,1)
        _gradientlocnotworking ("gradient loc (not working)", Range(-2, 2)) = 0.2393162
        _glowcolor ("glow color", Color) = (1,0,0,1)
        _luminositygradient ("luminosity gradient", Float ) = 0
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
            #pragma only_renderers d3d9 d3d11 glcore gles n3ds wiiu 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _basecolor;
            uniform float4 _glowcolor;
            uniform float _luminositygradient;
            uniform float _breathValue;
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
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 w = _basecolor.rgb*0.5; // Light wrapping
                float3 NdotLWrap = NdotL * ( 1.0 - w );
                float3 forwardLight = max(float3(0.0,0.0,0.0), NdotLWrap + w );
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = forwardLight * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                indirectDiffuse += _basecolor.rgb; // Diffuse Ambient Light
                float3 diffuseColor = _basecolor.rgb;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float3 emissive = (lerp(float3(1,1,1),float3(0,0,0),clamp(((i.uv0.g.r*0.5+0.5)+((_breathValue*(-1.0))+0.5)),0,1))*_glowcolor.rgb*_luminositygradient);
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
            #pragma only_renderers d3d9 d3d11 glcore gles n3ds wiiu 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _basecolor;
            uniform float4 _glowcolor;
            uniform float _luminositygradient;
            uniform float _breathValue;
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
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 w = _basecolor.rgb*0.5; // Light wrapping
                float3 NdotLWrap = NdotL * ( 1.0 - w );
                float3 forwardLight = max(float3(0.0,0.0,0.0), NdotLWrap + w );
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = forwardLight * attenColor;
                float3 diffuseColor = _basecolor.rgb;
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
