import java.util.*;
ArrayList<Particle> particles;
float radius;
float noise_value;
float d;

void setup()
{
  size(512, 512);
  frameRate(30);
  colorMode(HSB);
  blendMode(ADD);
  
  particles = new ArrayList<Particle>();
  d = 2;
  
  for(int i = 0; i < 32; i++)
  {
    particles.add(new Particle(new PVector(width / 2, height / 2), 10, random(360), 0, d));
    particles.add(new Particle(new PVector(width / 2, height / 2), 10, random(360), 85, d));
    particles.add(new Particle(new PVector(width / 2, height / 2), 10, random(360), 170, d));
  }
}

void draw()
{
  background(0);
  noise_value += 0.03;
   
  Iterator<Particle> it = particles.iterator();
  while(it.hasNext())
  {
    Particle p = it.next();
    p.update();
    p.display();
    if(p.isDead())
    {
      it.remove();
    }
  }
  
  if(frameCount % 90 == 0)
  {
    d *= -1;
    for(int i = 0; i < 32; i++)
    {
      particles.add(new Particle(new PVector(width / 2, height / 2), 10, random(360), 0, d));
      particles.add(new Particle(new PVector(width / 2, height / 2), 10, random(360), 85, d));
      particles.add(new Particle(new PVector(width / 2, height / 2), 10, random(360), 170, d));
    }
  }
  
  /*
  println(frameCount);
  saveFrame("screen-#####.png");
  if(frameCount > 3600)
  {
     exit();
  }
  */
}