void gameover() {
    
  background(theme.x);
  button(400, 400, 100, 50, 20, "restart");


  
  timer++;
  if (timer>60) timer=0;

  if (myShip.lives < 1) {
     newText("u died ", width/2, 250, 60, theme.y);
    
  } else {
     newText("gg you win", width/2, 250, 60, theme.y);
   
  }
}
