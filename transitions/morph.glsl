// Author: paniq
// License: MIT
uniform float strength; // = 0.1

vec4 transition(vec2 p) {
  vec4 ca = getFromColor(p);
  vec4 cb = getToColor(p);
  
  vec2 oa = (((ca.rg+ca.b)*0.5)*2.0-1.0);
  vec2 ob = (((cb.rg+cb.b)*0.5)*2.0-1.0);
  vec2 oc = mix(oa,ob,0.5)*strength;
  float tr0 = progress*0.2;
  float tr1 = (1.0 - progress)*0.2;
  
  float w0 = progress;
  float w1 = 1.0-w0;
  return mix(getFromColor(vec2(p.x, p.y+tr0)+oc*w0), getToColor(vec2(p.x, p.y+tr1)-oc*w1), progress);
}
