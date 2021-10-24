class Explosion extends GameObject {
  int t,r ;

  Explosion(float x, float y,int r) {
    location = new PVector (x, y);
    velocity = new PVector(random(3, 5), 0);
    velocity.rotate(random(360));
    lives=1;
    size=4;
    t=400;
    
   
  }
  void show() {
    noStroke();
    fill(r,0, 0, t);
    rect(location.x, location.y, size, size);
  }
  void act() {
    super.act();
   
  }
}
