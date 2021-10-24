void game() {
  int counter = 0;
  ufoSpawn++;

  background(theme.x);
  stroke(255);
  fill(0);
  myShip.show();
  myShip.act(); 
  
  int i = 0;
  while (i<myObjects.size()) {
    GameObject obj = myObjects.get(i); 
    if (obj.lives > 0) {
      obj.show();
      obj.act();
      if (obj instanceof Asteroid) counter++;
      i++;
    } else myObjects.remove(i);
  }
  
if (counter<1) mode = gameover;

println(counter);

  
  if (ufoSpawn == 1000) {
    myObjects.add(new Ufo());
    ufoSpawn = 0;
  }

  button(40, 30, 60, 20, 12, "Lives:"+String.valueOf(myShip.lives));
  button(40, 55, 60, 20, 12, "Score:"+score);

  

 
  }
