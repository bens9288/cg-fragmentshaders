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
    vec2 scaled = vec2(model_uv.xy * 2.0) - 1.0;
    float radius = length(scaled);
    vec2 offset = scaled * ((sin(radius * 30.0 - u_time * 5.0) + 0.5)/60.0);
    vec2 final = model_uv.xy + offset;
    FragColor = texture(image, final);
}
