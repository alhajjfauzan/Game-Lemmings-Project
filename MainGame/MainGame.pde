// ==============================================
// MAIN GAME - ENTRY POINT
// ==============================================

UIManager uiManager;
LevelManager levelManager;
Terrain terrain;
ArrayList<Lemming> lemmings;
SoundManager soundManager;
Effect3D effect3d;
MainGame mainGame;

String gameState = "menu"; // menu, levelSelect, playing
int currentLevel = 0;
boolean levelStarted = false;

void setup() {
  size(800, 600);
  soundManager = new SoundManager(this);
  uiManager = new UIManager(this, soundManager);
  levelManager = new LevelManager(this, soundManager);
  mainGame = this; // Simpan referensi global
  terrain = new Terrain();
  lemmings = new ArrayList<Lemming>();
  effect3d = new Effect3D();
  
  // Mainkan BGM opening saat game dimulai (di menu)
  soundManager.play("bgm");
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
  else if (gameState.equals("playing")) {
    // Cek klik pada lemming
    for (Lemming lem : lemmings) {
      if (dist(mouseX, mouseY, lem.x, lem.y) < 10) {
        // Beri skill (CONTOH: Digger)
        lem.applySkill("Digger");
        break; // Hentikan loop setelah skill diberikan
      }
    }
  }
}

void keyPressed() {
  if (key == 'm' || key == 'M') {
    // kembali ke pemilihan level, bukan menu
    gameState = "levelSelect";
    // Ganti ke BGM opening saat kembali ke levelSelect
    soundManager.play("bgm");
  }
  if (key == 'p' || key == 'P') {
    gameState = "levelSelect";
    // Ganti ke BGM opening saat kembali ke levelSelect
    soundManager.play("bgm");
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
  
  // Hapus lemming lama dan buat yang baru
  lemmings.clear();
  lemmings.add(new Lemming(100, 350)); // Tambah 1 lemming di posisi awal
  // Load ulang terrain untuk level ini
  terrain.loadLevel();
  
  // Mainkan BGM gameplay saat level dimulai
  soundManager.play("gameplay");
}

void drawLevel() {
  // Gambar elemen game, bukan cuma teks
  background(40, 100, 150);
  terrain.draw(); // Gambar terrain
  
  // Update dan gambar semua lemming
  for (int i = lemmings.size() - 1; i >= 0; i--) {
    Lemming lem = lemmings.get(i);
    lem.update();
    lem.draw();
    
    // Hapus lemming jika mati atau selamat
    if (lem.isDead() || lem.isSaved()) {
      lemmings.remove(i);
    }
  }

  // Tampilkan UI game (nanti)
  
  textSize(16);
  text("Tekan 'M' untuk kembali ke pemilihan level", width / 2, height - 50);
}
