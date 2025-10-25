// ==============================================
// LEVEL MANAGER - PEMILIH LEVEL
// ==============================================
class LevelManager {
  PApplet parent;
  PFont font;
  Button btnLevel1, btnLevel2, btnBack;
  int selectedLevel = 0;

  LevelManager(PApplet p) {
    parent = p;
    font = createFont("Arial", 24);
    btnLevel1 = new Button(width / 2 - 100, height / 2 - 80, 200, 50, "LEVEL 1");
    btnLevel2 = new Button(width / 2 - 100, height / 2, 200, 50, "LEVEL 2");
    btnBack   = new Button(width / 2 - 100, height / 2 + 80, 200, 50, "BACK");
  }

  void draw() {
    parent.background(30, 60, 100);
    parent.textAlign(CENTER);
    parent.textFont(font);
    parent.fill(255);
    parent.textSize(36);
    parent.text("PILIH LEVEL", width / 2, 150);

    btnLevel1.display();
    btnLevel2.display();
    btnBack.display();

    parent.textSize(16);
    parent.fill(200);
    parent.text("Klik level yang ingin dimainkan", width / 2, height - 50);
  }

  void mousePressed() {
    if (btnLevel1.isHovered()) {
      selectedLevel = 1;
      startLevel(selectedLevel);
      gameState = "playing";
    } 
    else if (btnLevel2.isHovered()) {
      selectedLevel = 2;
      startLevel(selectedLevel);
      gameState = "playing";
    } 
    else if (btnBack.isHovered()) {
      gameState = "menu";
    }
  }
}
