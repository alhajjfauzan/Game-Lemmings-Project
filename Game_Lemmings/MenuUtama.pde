class MenuUtama {
  void draw() {
    fill(255);
    textAlign(CENTER);
    textSize(48);
    text("Lemmings", width / 2, 150);
    fill(0, 150, 255);
    rectMode(CENTER);
    rect(width / 2, 300, 200, 60, 20);
    fill(255);
    textSize(24);
    text("Start", width / 2, 308);
    fill(255, 100, 100);
    rect(width / 2, 380, 200, 60, 20);
    fill(255);
    text("Exit", width / 2, 388);
  }
}
