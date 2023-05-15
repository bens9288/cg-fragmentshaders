#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;
uniform float u_time;

// Output
out vec4 FragColor;

void main() {
    // Color
    vec2 scaled = vec2(model_uv.xy * 2.0) - 1.0; //scale to -1,1
    vec3 vignette_alpha = vec3(scaled * 1.0, 1.0); 
    float vignetteDot = dot(vignette_alpha, vignette_alpha); 
    float vignetteRadius = pow(vignetteDot, min(u_time / 5.0, 5.0)); //decrease radius overtime, limit to 5.0
    vec3 EdgeColor = vec3(1.0, 1.0, 1.0); //near black color
    vec4 ImageData = texture(image, model_uv); 
    vec3 video = vec3(ImageData.r, ImageData.g, ImageData.b); //rgb for image data
    vec3 finalColor = mix(EdgeColor, video, vignetteRadius); //mix between video, edgecolor and radius
    FragColor = vec4(finalColor, 1.0);

}

