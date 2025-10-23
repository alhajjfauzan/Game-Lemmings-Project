// ==============================================
// MAIN GAME - FILE UTAMA (SUTRADARA + BOOTLOADER)
// ==============================================
// GLOBAL VARIABLE
Game mainGame;  // Renamed to match the class name

// GLOBAL FUNCTIONS (Bootloader)
void settings() { 
  size(1000, 700, P3D);
}

void setup() {
  mainGame = new Game(this);  
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
class Game {  
  String gameState = "menu";
  int currentLevel = 1;
  LevelManager levelManager;
  UIManager uiManager;
  SoundManager soundManager;
  Effect3D effect3d;
  Terrain terrain;
  ArrayList<Lemming> lemmings;
  PApplet parent;  
  Game(PApplet p) {  
    parent = p;
  }
  
  void setup() {
    effect3d = new Effect3D();
    lemmings = new ArrayList<Lemming>();
    
    soundManager = new SoundManager(parent);
    
    // TODO: Inisialisasi class lain saat sudah ready
    // levelManager = new LevelManager();
    // uiManager = new UIManager();
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
  }
  
 void drawMenu() {
  background(50);
  fill(255);
  textAlign(CENTER);
  text("LEMMINGS GAME - MAIN MENU", width/2, height/2);
  
  if (soundManager != null && soundManager.OpeningBGM != null) {
    if (!soundManager.OpeningBGM.isPlaying()) {
      soundManager.play("bgm");
    }
  }
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
    
    // Example: Play a win sound or stop BGM
    // soundManager.play("win");  // If you add a win sound
    // soundManager.OpeningBGM.stop();  // Stop BGM if playing
  }
  
  void handleGameOverState() {
    fill(255, 0, 0);
    text("GAME OVER", width/2, height/2);
    
    // Example: Play die sound or game over sound
    // soundManager.play("die");
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
    
    // Example: Play a sound on key press (e.g., for testing)
    if (key == 's') {  // Press 's' to play save sound
      soundManager.play("save");
    } else if (key == 'w'){
      soundManager.play("bgm");
    }
  }
}
