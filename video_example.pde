import processing.video.*;
float w = 25;


Capture cam;

void setup() 
{
  size(1500, 1000);  
  cam = new Capture(this, 640, 480);
  cam.start();
}

void draw() 
{
  background(0);
  if(cam.available()) 
  {
    cam.read(); 
    cam.loadPixels(); 
  }
  grid(); 
}

void grid()
{
  float mx = float(width)/w;
  float my = float(height)/w;
  float xrat = 640.0 / mx;
  float yrat = 480.0 / my;
  for(float y = 0; y < my; y++)
  {
    for(float x = 0; x < mx; x++)
    {
      int n = round((x*xrat)+((y*yrat)*(mx*xrat)));
      //rectangles(x*w,y*w,cam.pixels[n]);
      //circles(x*w,y*w,cam.pixels[n]);  
      //rotation(x*w,y*w,cam.pixels[n]); 
      //colors(x*w,y*w,cam.pixels[n]); 
      lines(x*w,y*w,x*w,y*w,cam.pixels[n]);
    }   
  }  
}

void rectangles(float cx,float cy, color c)
{
  fill(c);
  noStroke();
  rect(cx,cy,w,w);
}

void circles(float cx,float cy, color c)
{
  noFill();
  stroke(255);
  circle(cx,cy,brightness(c)/2);
}

void rotation(float cx,float cy, color c)
{
  fill(color(255,255,255,100));
  noStroke();
  pushMatrix();
    translate(cx,cy);
    rotate(radians(brightness(c)));
    translate(0,-5);
    rect(0,0,50,10);
  popMatrix();
}

void colors(float cx,float cy, color c)
{
  //blendMode(ADD);
  noStroke();
  fill(color(red(c),0,0));
  circle(cx,cy,red(c)/10);
  fill(color(0,0,blue(c)));
  circle(cx,cy,green(c)/10);
  fill(color(0,0,blue(c)));
  circle(cx,cy,blue(c)/10);
}
void lines(float cx,float cy,float vx,float vy, color c)
{
  push();
  blendMode(ADD);
  
  stroke(color(red(c),0,0,brightness(c)/2));
  strokeWeight(8);
  line(cx,cy,vx+30,vy);

   stroke(color(0,0,blue(c),brightness(c)/0.5));
   strokeWeight(2);
    line(cx+15,cy,vx,vy);

  
  stroke(color(0,green(c),0,brightness(c)/0.5));
  strokeWeight(3);
  line(cx,cy+20,vx,vy);
 
  pop();
}
