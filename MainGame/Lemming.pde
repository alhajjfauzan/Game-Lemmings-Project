class Lemming {
  float x, y;          // posisi lemming
  float speed = 1.5;   // kecepatan berjalan
  float gravity = 0.8; // gaya gravitasi
  float ySpeed = 0;    // kecepatan jatuh
  boolean facingRight = true; // arah hadap lemming
  boolean onGround = false;   // status di tanah
  boolean dead = false;       // status mati
  boolean saved = false;      // status selamat
  
  Lemming(float startX, float startY) {
    // Inisialisasi posisi awal lemming
    x = startX;
    y = startY;
  }
  
  void update() {
    if (dead || saved) return;
    
    // Simulasi gravitasi
    ySpeed += gravity;
    y += ySpeed;
    
    // Deteksi tanah sederhana (misal di bawah y = 400)
    if (y >= 400) {
      y = 400;
      ySpeed = 0;
      onGround = true;
    } else {
      onGround = false;
    }
    
    // Jika di tanah, lemming berjalan
    if (onGround) {
      if (facingRight) {
        x += speed;
      } else {
        x -= speed;
      }
    }
    
    // Deteksi tepi layar → berbalik arah
    if (x <= 0) {
      x = 0;
      facingRight = true;
    } else if (x >= width - 10) {
      x = width - 10;
      facingRight = false;
    }
    
    // Jika jatuh dari terlalu tinggi → mati
    if (y > height) {
      dead = true;
    }
    
    // Jika sampai ke area “exit” (misal kanan bawah layar)
    if (x > width - 50 && y >= 380) {
      saved = true;
    }
  }
  
  void draw() {
    if (dead) {
      fill(200, 0, 0);
      ellipse(x, y, 8, 8); // merah = mati
    } else if (saved) {
      fill(0, 200, 0);
      ellipse(x, y, 8, 8); // hijau = selamat
    } else {
      fill(0, 0, 255);
      ellipse(x, y, 10, 10); // biru = hidup
    }
  }
  
  void applySkill(Skill skill) {
    // Contoh logika sederhana (bisa dikembangkan)
    // Misal skill: "float" → mengurangi gravitasi
    //if (skill.type.equals("float")) {
    //  gravity = 0.2;
    //}
    //// Misal skill: "dig" → lemming turun perlahan
    //else if (skill.type.equals("dig")) {
    //  y += 1;
    //}
  }
  
  boolean isDead() { 
    return dead; 
  }
  
  boolean isSaved() { 
    return saved;
  }
}
