class Particle
{
  PVector center;
  float radius;
  float angle;
  float direction;
  PVector[] history;
  float color_value;
  color bodyColor;
  int len;
  float alpha_span;
  
  Particle(PVector ce, float r, float a, float c, float d)
  {
    center = ce.copy();
    radius = r;
    angle = a;
    direction = d;
    len = 32;
    alpha_span = 360 / len;
    color_value = c;
    bodyColor = color(color_value, 255, 255);
    
    history = new PVector[len];
    for(int i = 0; i < history.length; i++)
    {
      history[i] = new PVector(-width, -height);
    }
  }
  
  void update()
  {
    float tmp_r = radius + map(noise(noise_value), 0, 1, -150, 150);
    float x = tmp_r * cos(radians(angle));
    float y = tmp_r * sin(radians(angle));
    
    for(int i = history.length - 1; i > 0; i--)
    {
      history[i] = history[i - 1].copy();
    }
    history[0] = new PVector(x, y);
    
    angle += direction;
    radius += 1;
  }
  
  void display()
  {
    pushMatrix();
    translate(center.x, center.y);
    
    for(int i = history.length - 1; i > 0; i--)
    {
      noStroke();
      fill(bodyColor, 255 - i * alpha_span);
      ellipse(history[i].x, history[i].y, 10, 10);
    }
    
    popMatrix();
  }
  
  boolean isDead()
  {
    if(radius > width || radius > height)
    {
      return true;
    }
    
    return false;
  }
}