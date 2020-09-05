precision highp float;

uniform vec3 sundir;
varying vec3 pos;

#pragma glslify: atmosphere = require(./atmosphere.glsl);
// #pragma glslify: getAtmosphereBruteForce = require(../../../engine/gl/glsl/atmosphere_scatter_brute_force.glsl);

void main() {
  vec3 color = atmosphere(
    normalize(pos),
    vec3(0, 6372e3, 0),
    normalize(sundir),
    22.0,
    6371e3,
    6471e3,
    vec3(5.5e-6, 13.0e-6, 22.4e-6),
    21e-6,
    8e3,
    1.2e3,
    0.758
  );

  // vec3 color = getAtmosphereBruteForce(normalize(pos),normalize(sundir));
  gl_FragColor = vec4(color, 1);
}

// color = 1.0 - exp(-1.0 * color);