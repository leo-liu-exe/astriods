void keyPressed() {
  if (keyCode == UP) upKey = true;
  if (keyCode == DOWN) downKey = true;
  if (keyCode == LEFT) leftKey = true;
  if (keyCode == RIGHT) rightKey = true;
  if (keyCode == ' ') spaceKey = true;
   if (mode==game) {
    if (keyCode =='p'||keyCode=='P') {
      mode=pause;
    }
  } else if (mode==pause) {
    if (key=='p'||key=='P') {
      mode=game;
    }
  }
}

void keyReleased() {
  if (keyCode == UP) upKey = false;
  if (keyCode == DOWN) downKey = false;
  if (keyCode == LEFT) leftKey = false;
  if (keyCode == RIGHT) rightKey = false;
  if (keyCode == ' ') spaceKey = false;
}

void mouseReleased() {

  if (onButton(400, 400, 100, 50) && mode == intro) mode = game;
  if (onButton(400, 400, 100, 50) && mode == gameover) mode = intro;
  if (onButton(40, 80, 60, 20) && mode == game) mode = pause;

 
}

void button(int x, int y, int w, int h, int textSize, String label) {
  if (onButton(x, y, w, h)) { 
    strokeWeight(4);
    stroke(theme.y);
  } else {
    strokeWeight(1);
    stroke(theme.y);
  }
  fill(theme.x); 
  rect(x, y, w, h);
  fill(theme.y);
  textSize(textSize);
  text(label, x, y); //text, xy
}

void newText(String txt, float x, float y, int size, float col) {
  fill(col);
  textSize(size);
  text(txt, x, y);
}

boolean onButton(int x, int y, int w, int h) {
  if ( mouseX>x-w/2 && mouseX<x+w/2 && mouseY<y+h/2 && mouseY>y-h/2) return true;
  return false;
}
