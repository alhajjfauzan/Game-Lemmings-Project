// ==============================================
// MAIN GAME - ENTRY POINT
// ==============================================

UIManager uiManager;
LevelManager levelManager;

String gameState = "menu"; // menu, levelSelect, playing
int currentLevel = 0;

// contoh variabel permainan (sementara)
boolean levelStarted = false;

void setup() {
  size(800, 600);
  uiManager = new UIManager(this);
  levelManager = new LevelManager(this);
}

void draw() {
  background(0);

  if (gameState.equals("menu")) {
    uiManager.draw();
  } 
  else if (gameState.equals("levelSelect")) {
    levelManager.draw();
  } 
  else if (gameState.equals("playing")) {
    drawLevel();
  }
}

void mousePressed() {
  if (gameState.equals("menu")) {
    uiManager.mousePressed();
  } 
  else if (gameState.equals("levelSelect")) {
    levelManager.mousePressed();
  }
}

void keyPressed() {
  if (key == 'm' || key == 'M') {
    // kembali ke pemilihan level, bukan menu
    gameState = "levelSelect";
  }
  if (key == 'p' || key == 'P') {
    gameState = "levelSelect";
  }
}

// ------------------------------------------------------
// FUNGSI LEVEL
// ------------------------------------------------------

void startLevel(int level) {
  currentLevel = level;
  levelStarted = true;
  println("Memulai Level " + level);
  // di sini nanti bisa dimasukkan setup lemming, terrain, dsb
}

void drawLevel() {
  background(40, 100, 150);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(32);
  text("Sedang bermain Level " + currentLevel, width / 2, height / 2 - 40);

  textSize(16);
  text("Tekan 'M' untuk kembali ke pemilihan level", width / 2, height - 50);
}
