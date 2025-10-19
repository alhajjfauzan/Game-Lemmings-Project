// ==============================================
// MAIN GAME - FILE UTAMA (SUTRADARA + BOOTLOADER)
// ==============================================



// GLOBAL VARIABLE
MainGame mainGame;

// GLOBAL FUNCTIONS (Bootloader)
void settings() { 
  size(1000, 700, P3D);
}

void setup() {
  mainGame = new MainGame();
  mainGame.setup();
}

void draw() { 
  mainGame.draw(); 
}

void mousePressed() { 
  mainGame.mousePressed(); 
}

void keyPressed() { 
  mainGame.keyPressed(); 
}


// MAIN GAME CLASS (Sutradara)
class mainGame {
  String gameState = "menu";
  int currentLevel = 1;
  
  // References ke class lain
  LevelManager levelManager;
  UIManager uiManager;
  SoundManager soundManager;
  Effect3D effect3d;
  Terrain terrain;
  ArrayList<Lemming> lemmings;
  
  void setup() {
    // Inisialisasi di sini
    effect3d = new Effect3D();
    lemmings = new ArrayList<Lemming>();
    
    // TODO: Inisialisasi class lain saat sudah ready
    // levelManager = new LevelManager();
    // uiManager = new UIManager();
    // soundManager = new SoundManager();
    // terrain = new Terrain();
  }
  
  void draw() {
    background(50);
    
    switch(gameState) {
      case "menu": drawMenu(); break;
      case "playing": updateGame(); drawGame(); break;
      case "win": handleWinState(); break;
      case "gameover": handleGameOverState(); break;
    }
  }
  
  void updateGame() {
    // TODO: Panggil update class lain
    // if (levelManager != null) levelManager.update();
    
    // TODO: Update lemmings
    // for (Lemming lemming : lemmings) {
    //   lemming.update();
    // }
    
    checkWinLoseConditions();
  }
  
  void checkWinLoseConditions() {
    // TODO: Implementasi win/lose conditions
  }
  
  void drawMenu() {
    fill(255);
    textAlign(CENTER);
    text("LEMMINGS GAME - MAIN MENU", width/2, height/2);
  }
  
  void drawGame() {
    // TODO: Draw game elements
    if (terrain != null) terrain.draw();
    // for (Lemming lemming : lemmings) lemming.draw();
    if (uiManager != null) uiManager.draw();
  }
  
  void handleWinState() {
    effect3d.display();
    fill(255, 255, 0);
    text("YOU WIN!", width/2, height/2);
  }
  
  void handleGameOverState() {
    fill(255, 0, 0);
    text("GAME OVER", width/2, height/2);
  }
  
  void mousePressed() {
    // TODO: Handle mouse events
  }
  
  void keyPressed() {
    // Testing keys
    if (key == 'w') gameState = "win";
    if (key == 'l') gameState = "gameover";
    if (key == 'm') gameState = "menu";
    if (key == 'p') gameState = "playing";
  }
}
