class Ufo extends GameObject {
  int flashTimer, shotTimer, spawnLoc;

  Ufo() {
    spawnLoc = (int)random(4); //spawns UFO from random side of screen
    switch(spawnLoc) { 
    case 0: 
      {
        location = new PVector(-size, random(50, height-50));
        velocity = new PVector(random(0.5, 1), 0); 
        break;
      }
    case 1:
      {
        location = new PVector(width+size, random(50, height-50));
        velocity = new PVector(random(-1, -0.5), 0); 
        break;
      }
    case 2: 
      {
        location = new PVector(random(50, width-50), -size);
        velocity = new PVector(0, random(0.5, 1)); 
        break;
      }
    case 3: 
      {
        location = new PVector(random(50, width-50), height-size);
        velocity = new PVector(0, random(-1, -0.5)); 
        break;
      }
    }

    size = 40;
    lives = 1;
    shotTimer=flashTimer = 0;
  }

  void show() {
    flashTimer++;
    shotTimer++;
    if (flashTimer>60) flashTimer=0;
    if (flashTimer<20) {
      fill(255, 0, 0);
    } else {
      fill(theme.x);
    }
    strokeWeight(2);
    stroke(255, 0, 0);
    ellipse(location.x, location.y, size, size);
    newText(String.valueOf(lives), location.x, location.y, 10, theme.x);
  }

  void act() {
    super.act();
 

    if (shotTimer == 100) {
      //myObjects.add(new Bullet(new PVector(myShip.location.x-location.x, myShip.location.y-location.y), new PVector(location.x, location.y)));
      shotTimer=0;
    }

    int i = 0; 
    while (i<myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet && !obj.isUFO) {
        if (dist(location.x, location.y, obj.location.x, obj.location.y) <= size/2 + obj.size) {
          size-=10;
          if (lives == 1) {
            score+=3;
            //for (int j=0; j<random(10, 20); j++) myObjects.add(new Explosion(location.x, location.y, 0, 255));
          }
          lives -=1;
          obj.lives -=1;
        }
      }
      i++;
    }
  }
}
