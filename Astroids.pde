boolean upKey, downKey, leftKey, rightKey, spaceKey;
Ship myShip;
ArrayList<GameObject> myObjects;
PVector theme = new PVector(0, 255);

int score, mode, timer, ufoSpawn;
final int intro=0;
final int game=1;
final int pause=2;
final int gameover=3;
final int options =4;
void setup() {
  size (800, 600);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  myShip = new Ship();
  myObjects = new ArrayList<GameObject>();
  myObjects.add(myShip);
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
    ufoSpawn = 700;
}



void draw() {
  background(0);

  int i = 0;
  while (i < myObjects.size()) {
    GameObject myObj = myObjects.get(i);
    myObj.show();
    myObj.act();

    if (myObj.lives == 0) {
      myObjects.remove(i);
    } else {
      i++;
    }
  }

  if (mode==intro) {
    intro();
  } else if (mode==game) {
    game();
  } else if (mode==pause) {
    pause();
  } else if (mode==gameover) {
    gameover();
  } else {
    println("Error: Mode = " + mode);
  }

}
