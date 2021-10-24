void intro() {
  setup();

  background(theme.x);
  button(400, 400, 100, 50, 20, "START");



  timer++;
  if (timer>60) timer=0;
  newText("ASTEROIDS", width/2, 250, 60, theme.y);

}
