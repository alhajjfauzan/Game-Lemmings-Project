// ==============================================
// UI MANAGER - MENU UTAMA GAME
// ==============================================
class UIManager {
  PApplet parent;
  PFont font;
  Button btnPlay, btnQuit;

  UIManager(PApplet p) {
    parent = p;
    font = createFont("Arial", 24);
    btnPlay = new Button(width / 2 - 100, height / 2 - 30, 200, 50, "PLAY");
    btnQuit = new Button(width / 2 - 100, height / 2 + 40, 200, 50, "QUIT");
  }

  void draw() {
    parent.background(20, 40, 70);
    parent.textAlign(CENTER);
    parent.textFont(font);
    parent.fill(255);
    parent.textSize(40);
    parent.text("LEMMINGS GAME", width / 2, 150);

    btnPlay.display();
    btnQuit.display();

    parent.textSize(16);
    parent.fill(200);
    parent.text("Tekan 'P' untuk bermain, 'M' untuk kembali ke menu", width / 2, height - 50);
  }

  void mousePressed() {
    if (btnPlay.isHovered()) {
      gameState = "levelSelect";
    } else if (btnQuit.isHovered()) {
      exit();
    }
  }
}

// ==============================================
// CLASS BUTTON
// ==============================================
class Button {
  float x, y, w, h;
  String label;

  Button(float x, float y, float w, float h, String label) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.label = label;
  }

  void display() {
    if (isHovered()) {
      fill(60, 130, 250);
    } else {
      fill(40, 90, 200);
    }
    noStroke();
    rect(x, y, w, h, 10);

    fill(255);
    textAlign(CENTER, CENTER);
    textSize(20);
    text(label, x + w / 2, y + h / 2);
  }

  boolean isHovered() {
    return (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h);
  }
}
