class Bullet extends GameObject {


  int timer;
  PVector nudge;
  
  Bullet() {
    timer = 50;
    lives = 1;
    location = new PVector (myShip.location.x, myShip.location.y);
    nudge = myShip.direction.copy();
    nudge.setMag(29);
    location.add(nudge);
    velocity = new PVector (myShip.direction.x, myShip.direction.y);
    velocity.setMag(10);
    size = 10;
  }

  void show() {
    stroke (255);
    noFill ();
    ellipse (location.x, location.y, size, size);
  }

  void act() {
    super.act();

    timer--;
    if (timer == 0) {
      lives=0;
    }
  }
}
