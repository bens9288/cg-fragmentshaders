#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

void main() {
    // Color
    vec2 scaled = vec2(model_uv.xy * 2.0) - 1.0;
    float theta = atan(scaled.y, scaled.x);
    float magnitude = length(scaled);
    float radius = pow(magnitude, 1.5);
    vec2 texture_coor = vec2(radius * cos(theta), radius * sin(theta));
    vec2 final_coor = vec2(0.5 * (texture_coor.x + 1.0), 0.5 * (texture_coor.y + 1.0));


    FragColor = texture(image, final_coor);
}
