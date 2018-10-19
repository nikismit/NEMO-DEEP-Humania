// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:2,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.2157349,fgcg:0.1005623,fgcb:0.4558824,fgca:0.4117647,fgde:1,fgrn:50,fgrf:400,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:7313,x:33022,y:32775,varname:node_7313,prsc:2|emission-6878-OUT;n:type:ShaderForge.SFN_Lerp,id:6878,x:32847,y:32775,varname:node_6878,prsc:2|A-7401-RGB,B-8347-OUT,T-1264-OUT;n:type:ShaderForge.SFN_Color,id:7401,x:32573,y:32455,ptovrint:False,ptlb:node_7401,ptin:_node_7401,varname:node_7401,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.7426471,c2:0.7426471,c3:0.7426471,c4:1;n:type:ShaderForge.SFN_Color,id:4265,x:32445,y:32638,ptovrint:False,ptlb:node_4265,ptin:_node_4265,varname:node_4265,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.8896551,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:8347,x:32628,y:32740,varname:node_8347,prsc:2|A-4265-RGB,B-6531-OUT;n:type:ShaderForge.SFN_Vector1,id:6531,x:32445,y:32784,varname:node_6531,prsc:2,v1:10;n:type:ShaderForge.SFN_OneMinus,id:5318,x:32382,y:32889,varname:node_5318,prsc:2|IN-1026-OUT;n:type:ShaderForge.SFN_NormalVector,id:4538,x:31995,y:32889,prsc:2,pt:False;n:type:ShaderForge.SFN_Fresnel,id:1026,x:32164,y:32889,varname:node_1026,prsc:2|NRM-4538-OUT,EXP-126-OUT;n:type:ShaderForge.SFN_Multiply,id:1264,x:32628,y:32889,varname:node_1264,prsc:2|A-5318-OUT,B-9806-OUT;n:type:ShaderForge.SFN_Slider,id:9806,x:32260,y:33041,ptovrint:False,ptlb:node_9806,ptin:_node_9806,varname:node_9806,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_ValueProperty,id:126,x:31995,y:33059,ptovrint:False,ptlb:node_126,ptin:_node_126,varname:node_126,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;proporder:7401-4265-9806-126;pass:END;sub:END;*/

Shader "Alveolus" {
    Properties {
        _node_7401 ("node_7401", Color) = (0.7426471,0.7426471,0.7426471,1)
        _node_4265 ("node_4265", Color) = (1,0.8896551,0,1)
        _node_9806 ("node_9806", Range(0, 1)) = 1
        _node_126 ("node_126", Float ) = 1
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal xboxone ps4 psp2 n3ds wiiu 
            #pragma target 3.0
            uniform float4 _node_7401;
            uniform float4 _node_4265;
            uniform float _node_9806;
            uniform float _node_126;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float3 emissive = lerp(_node_7401.rgb,(_node_4265.rgb*10.0),((1.0 - pow(1.0-max(0,dot(i.normalDir, viewDirection)),_node_126))*_node_9806));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
