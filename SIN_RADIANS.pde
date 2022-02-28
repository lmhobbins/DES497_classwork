float x=0;
float y=0;
float angle = 0;
void setup(){
  size(1000,1000);
  
  y=height/2;
  x=100;
}

void draw(){
  angle = angle+1;
  background(0);
  circle(x,y,100);
  x= (sin(radians(angle))*100)+(width/2.0); 
  y= (cos(radians(angle))*300)+(height/2.0);
  if(x>width-100) x= 100;
  if(angle > 360) angle =0;
  
}
