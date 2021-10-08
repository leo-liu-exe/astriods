class Ship extends GameObject {

  //Instance variables

  PVector direction;
  int shotTimer, threshold;

  //Constructor(s)
  Ship() {
    lives = 3;
    location = new PVector (width/2, height/2);
    velocity = new PVector (0, 0);
    direction = new PVector (0, -0.1);
    shotTimer = 30;
    threshold = 30;
  }

  //Behavior Functions
  void show() {
    pushMatrix ();
    translate (location.x, location.y);
    rotate (direction.heading());
    noFill ();
    stroke (255);
    triangle (-25, -12.5, -25, 12.5, 25, 0); 
    popMatrix();
  }

  void act() {
    super.act();
    
    shotTimer++;
    
    if (upKey)   {
      velocity.add(direction);
      myObjects.add (new Fire());
      myObjects.add (new Fire());
      myObjects.add (new Fire());
    }
    if (downKey)  velocity.sub(direction);
    if (leftKey)  direction.rotate(-radians(5));
    if (rightKey) direction.rotate(radians(5));
    if (spaceKey && shotTimer > threshold) { 
      myObjects.add(new Bullet()); 
      shotTimer = 0;
      
    }
  }
}
