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
    vec4 color = texture(image, model_uv);
    // vec3 luminance = (0.299,0.587,0.114);
    // FragColor = vec4(luminance, luminance, luminance, 1.0);
    float lumiance = color.r * 0.299 + color.g * 0.587 +  color.b * 0.114;
    FragColor = vec4(lumiance, lumiance, lumiance, color.a);

}
