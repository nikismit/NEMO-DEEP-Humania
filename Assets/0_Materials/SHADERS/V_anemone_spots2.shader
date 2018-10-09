// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:1,fgcg:0.5882353,fgcb:0.8182557,fgca:1,fgde:0.03,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:1242,x:33687,y:32472,varname:node_1242,prsc:2|emission-8679-OUT,voffset-672-OUT;n:type:ShaderForge.SFN_ComponentMask,id:5835,x:30941,y:35106,varname:node_5835,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-3058-V;n:type:ShaderForge.SFN_Lerp,id:3330,x:32514,y:34914,varname:node_3330,prsc:2|A-7076-RGB,B-2942-RGB,T-8532-OUT;n:type:ShaderForge.SFN_Color,id:7076,x:31738,y:34621,ptovrint:False,ptlb:node_2739_copy,ptin:_node_2739_copy,varname:_node_2739_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Color,id:2942,x:31883,y:34863,ptovrint:False,ptlb:node_2255_copy,ptin:_node_2255_copy,varname:_node_2255_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Clamp01,id:8532,x:32104,y:35030,varname:node_8532,prsc:2|IN-2704-OUT;n:type:ShaderForge.SFN_Multiply,id:6637,x:31440,y:35053,varname:node_6637,prsc:2|A-4802-OUT,B-8507-OUT,C-6189-OUT;n:type:ShaderForge.SFN_Sin,id:1399,x:31603,y:35053,varname:node_1399,prsc:2|IN-6637-OUT;n:type:ShaderForge.SFN_RemapRange,id:2704,x:31938,y:35030,varname:node_2704,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-1399-OUT;n:type:ShaderForge.SFN_Tau,id:6189,x:31440,y:35209,varname:node_6189,prsc:2;n:type:ShaderForge.SFN_Slider,id:4802,x:30941,y:35007,ptovrint:False,ptlb:gradient amount wobl,ptin:_gradientamountwobl,varname:_gradientamount_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:4.302442,max:8;n:type:ShaderForge.SFN_Time,id:5262,x:30760,y:35243,varname:node_5262,prsc:2;n:type:ShaderForge.SFN_Add,id:8507,x:31175,y:35106,varname:node_8507,prsc:2|A-5835-OUT,B-6152-OUT;n:type:ShaderForge.SFN_Multiply,id:6152,x:31175,y:35292,varname:node_6152,prsc:2|A-5262-TSL,B-9159-OUT;n:type:ShaderForge.SFN_Slider,id:9159,x:30760,y:35402,ptovrint:False,ptlb:speed_copy,ptin:_speed_copy,varname:_speed_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:5,max:5;n:type:ShaderForge.SFN_Slider,id:2467,x:32178,y:34641,ptovrint:False,ptlb:brightness wobl,ptin:_brightnesswobl,varname:node_6903,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.40885,max:10;n:type:ShaderForge.SFN_TexCoord,id:3058,x:30760,y:35087,varname:node_3058,prsc:2,uv:1,uaff:False;n:type:ShaderForge.SFN_TexCoord,id:9772,x:30738,y:34840,varname:node_9772,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:5115,x:33101,y:33591,varname:node_5115,prsc:2|A-2467-OUT,B-3330-OUT;n:type:ShaderForge.SFN_Lerp,id:9668,x:30961,y:34741,varname:node_9668,prsc:2|A-6571-OUT,B-4322-OUT,T-9772-V;n:type:ShaderForge.SFN_Multiply,id:672,x:33149,y:33355,varname:node_672,prsc:2|A-9668-OUT,B-5115-OUT;n:type:ShaderForge.SFN_Vector3,id:6571,x:32621,y:33260,varname:node_6571,prsc:2,v1:0,v2:0,v3:0;n:type:ShaderForge.SFN_Vector3,id:4322,x:32621,y:33349,varname:node_4322,prsc:2,v1:1,v2:1,v3:1;n:type:ShaderForge.SFN_Multiply,id:8679,x:33183,y:32586,varname:node_8679,prsc:2|A-6411-RGB,B-3453-OUT;n:type:ShaderForge.SFN_Color,id:6411,x:33000,y:32484,ptovrint:False,ptlb:node_4265,ptin:_node_4265,varname:node_4265,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.8896551,c3:0,c4:1;n:type:ShaderForge.SFN_ValueProperty,id:6070,x:32385,y:32520,ptovrint:False,ptlb:_breathValue,ptin:_breathValue,varname:node_3068,prsc:2,glob:True,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Add,id:3453,x:32804,y:32573,varname:node_3453,prsc:2|A-2329-OUT,B-628-OUT;n:type:ShaderForge.SFN_Multiply,id:628,x:32595,y:32595,varname:node_628,prsc:2|A-6070-OUT,B-6499-OUT;n:type:ShaderForge.SFN_Vector1,id:6499,x:32366,y:32626,varname:node_6499,prsc:2,v1:3;n:type:ShaderForge.SFN_Vector1,id:2329,x:32595,y:32388,varname:node_2329,prsc:2,v1:1.5;proporder:7076-2942-4802-9159-2467-6411;pass:END;sub:END;*/

Shader "V_anemone_spots2" {
    Properties {
        _node_2739_copy ("node_2739_copy", Color) = (1,1,1,1)
        _node_2255_copy ("node_2255_copy", Color) = (0,0,0,1)
        _gradientamountwobl ("gradient amount wobl", Range(0, 8)) = 4.302442
        _speed_copy ("speed_copy", Range(0, 5)) = 5
        _brightnesswobl ("brightness wobl", Range(0, 10)) = 0.40885
        _node_4265 ("node_4265", Color) = (1,0.8896551,0,1)
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles n3ds wiiu 
            #pragma target 3.0
            uniform float4 _node_2739_copy;
            uniform float4 _node_2255_copy;
            uniform float _gradientamountwobl;
            uniform float _speed_copy;
            uniform float _brightnesswobl;
            uniform float4 _node_4265;
            uniform float _breathValue;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                float4 node_5262 = _Time;
                v.vertex.xyz += (lerp(float3(0,0,0),float3(1,1,1),o.uv0.g)*(_brightnesswobl*lerp(_node_2739_copy.rgb,_node_2255_copy.rgb,saturate((sin((_gradientamountwobl*(o.uv1.g.r+(node_5262.r*_speed_copy))*6.28318530718))*0.5+0.5)))));
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float3 emissive = (_node_4265.rgb*(1.5+(_breathValue*3.0)));
                float3 finalColor = emissive;
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
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles n3ds wiiu 
            #pragma target 3.0
            uniform float4 _node_2739_copy;
            uniform float4 _node_2255_copy;
            uniform float _gradientamountwobl;
            uniform float _speed_copy;
            uniform float _brightnesswobl;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float2 uv1 : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                float4 node_5262 = _Time;
                v.vertex.xyz += (lerp(float3(0,0,0),float3(1,1,1),o.uv0.g)*(_brightnesswobl*lerp(_node_2739_copy.rgb,_node_2255_copy.rgb,saturate((sin((_gradientamountwobl*(o.uv1.g.r+(node_5262.r*_speed_copy))*6.28318530718))*0.5+0.5)))));
                o.pos = UnityObjectToClipPos( v.vertex );
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
