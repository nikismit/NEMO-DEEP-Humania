// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:2,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.2157349,fgcg:0.1005623,fgcb:0.4558824,fgca:0.4117647,fgde:1,fgrn:50,fgrf:400,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:9325,x:33045,y:32283,varname:node_9325,prsc:2|diff-8673-OUT,amdfl-8170-RGB;n:type:ShaderForge.SFN_Lerp,id:8673,x:32774,y:32273,varname:node_8673,prsc:2|A-2241-RGB,B-8415-RGB,T-6969-OUT;n:type:ShaderForge.SFN_Color,id:2241,x:32580,y:31981,ptovrint:False,ptlb:node_2241,ptin:_node_2241,varname:node_2241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.7794118,c2:0.7583851,c3:0.6705234,c4:1;n:type:ShaderForge.SFN_Color,id:8415,x:32580,y:32138,ptovrint:False,ptlb:node_8415,ptin:_node_8415,varname:node_8415,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9809331,c2:0.6544118,c3:1,c4:1;n:type:ShaderForge.SFN_Power,id:754,x:32568,y:32464,varname:node_754,prsc:2|VAL-8976-OUT,EXP-3201-OUT;n:type:ShaderForge.SFN_Divide,id:8976,x:32568,y:32594,varname:node_8976,prsc:2|A-8105-OUT,B-7879-OUT;n:type:ShaderForge.SFN_Distance,id:8105,x:32568,y:32729,varname:node_8105,prsc:2|A-8253-XYZ,B-187-XYZ;n:type:ShaderForge.SFN_Vector1,id:3201,x:32402,y:32481,varname:node_3201,prsc:2,v1:2;n:type:ShaderForge.SFN_Vector1,id:7879,x:32402,y:32228,varname:node_7879,prsc:2,v1:150;n:type:ShaderForge.SFN_FragmentPosition,id:8253,x:32572,y:32862,varname:node_8253,prsc:2;n:type:ShaderForge.SFN_ViewPosition,id:187,x:32572,y:32984,varname:node_187,prsc:2;n:type:ShaderForge.SFN_Clamp01,id:6969,x:32567,y:32292,varname:node_6969,prsc:2|IN-754-OUT;n:type:ShaderForge.SFN_Color,id:8170,x:32799,y:32448,ptovrint:False,ptlb:node_8170,ptin:_node_8170,varname:node_8170,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.05882353,c2:0.05882353,c3:0.05882353,c4:1;proporder:2241-8415-8170;pass:END;sub:END;*/

Shader "Shader Forge/distance blend ravine" {
    Properties {
        _node_2241 ("node_2241", Color) = (0.7794118,0.7583851,0.6705234,1)
        _node_8415 ("node_8415", Color) = (0.9809331,0.6544118,1,1)
        _node_8170 ("node_8170", Color) = (0.05882353,0.05882353,0.05882353,1)
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
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
            #pragma exclude_renderers xbox360 ps3 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _node_2241;
            uniform float4 _node_8415;
            uniform float4 _node_8170;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
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
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                indirectDiffuse += _node_8170.rgb; // Diffuse Ambient Light
                float3 diffuseColor = lerp(_node_2241.rgb,_node_8415.rgb,saturate(pow((distance(i.posWorld.rgb,_WorldSpaceCameraPos)/150.0),2.0)));
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
            #pragma exclude_renderers xbox360 ps3 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _node_2241;
            uniform float4 _node_8415;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
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
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 diffuseColor = lerp(_node_2241.rgb,_node_8415.rgb,saturate(pow((distance(i.posWorld.rgb,_WorldSpaceCameraPos)/150.0),2.0)));
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
