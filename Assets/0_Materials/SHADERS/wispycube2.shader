// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:2,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.1873378,fgcg:0.2067996,fgcb:0.4044118,fgca:0.4117647,fgde:1,fgrn:50,fgrf:400,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:7194,x:32880,y:32715,varname:node_7194,prsc:2|emission-2145-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6898,x:31750,y:33169,ptovrint:False,ptlb:node_126,ptin:_node_126,varname:node_126,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_NormalVector,id:4419,x:31750,y:32999,prsc:2,pt:False;n:type:ShaderForge.SFN_Fresnel,id:8669,x:31919,y:32999,varname:node_8669,prsc:2|NRM-4419-OUT,EXP-6898-OUT;n:type:ShaderForge.SFN_Slider,id:4639,x:32015,y:33151,ptovrint:False,ptlb:node_9806,ptin:_node_9806,varname:node_9806,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_OneMinus,id:6150,x:32137,y:32999,varname:node_6150,prsc:2|IN-8669-OUT;n:type:ShaderForge.SFN_Multiply,id:1481,x:32383,y:32999,varname:node_1481,prsc:2|A-6150-OUT,B-4639-OUT;n:type:ShaderForge.SFN_Multiply,id:2360,x:32383,y:32850,varname:node_2360,prsc:2|A-7207-RGB,B-2856-OUT;n:type:ShaderForge.SFN_Color,id:7207,x:32200,y:32748,ptovrint:False,ptlb:node_4265,ptin:_node_4265,varname:node_4265,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.8896551,c3:0,c4:1;n:type:ShaderForge.SFN_Color,id:310,x:32328,y:32565,ptovrint:False,ptlb:node_7401,ptin:_node_7401,varname:node_7401,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.7426471,c2:0.7426471,c3:0.7426471,c4:1;n:type:ShaderForge.SFN_Lerp,id:2145,x:32602,y:32885,varname:node_2145,prsc:2|A-310-RGB,B-2360-OUT,T-1481-OUT;n:type:ShaderForge.SFN_Vector1,id:2856,x:32137,y:32900,varname:node_2856,prsc:2,v1:10;proporder:6898-4639-7207-310;pass:END;sub:END;*/

Shader "Shader Forge/wispycube2" {
    Properties {
        _node_126 ("node_126", Float ) = 1
        _node_9806 ("node_9806", Range(0, 1)) = 1
        _node_4265 ("node_4265", Color) = (1,0.8896551,0,1)
        _node_7401 ("node_7401", Color) = (0.7426471,0.7426471,0.7426471,1)
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
            #pragma exclude_renderers xbox360 ps3 
            #pragma target 3.0
            uniform float _node_126;
            uniform float _node_9806;
            uniform float4 _node_4265;
            uniform float4 _node_7401;
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
                o.pos = UnityObjectToClipPos(v.vertex );
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
