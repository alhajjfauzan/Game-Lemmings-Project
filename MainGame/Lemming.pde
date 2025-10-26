// File: Lemming.pde

class Lemming {
  float x, y;          // posisi lemming
  float speed = 1.5;   // kecepatan berjalan
  float gravity = 0.8; // gaya gravitasi
  float ySpeed = 0;    // kecepatan jatuh
  boolean facingRight = true; // arah hadap lemming
  boolean onGround = false;   // status di tanah
  boolean dead = false;       // status mati
  boolean saved = false;      // status selamat
  
  // --- Variabel Tambahan untuk Skill ---
  Skill currentSkill = null; // Menyimpan skill yang sedang aktif
  boolean isBlocking = false;  // Status untuk skill Blocker
  // ------------------------------------
  
  Lemming(float startX, float startY) {
    // Inisialisasi posisi awal lemming
    x = startX;
    y = startY;
  }
  
  void update() {
    if (dead || saved) return; // Jangan update jika sudah mati atau selamat
    
    // --- Logika Eksekusi Skill ---
    // Jika lemming punya skill, gunakan skill itu
    if (currentSkill != null) {
      currentSkill.use(this);
    }
    // -----------------------------

    // --- MODIFIKASI: Logika Gravitasi & Deteksi Tanah ---
    // Cek apakah ada tanah tepat 1 piksel di bawah kaki lemming
    if (mainGame.terrain.isGround(x, y + 1)) {
      
      // Cek apakah lemming mati karena jatuh (jika kecepatan jatuh tinggi)
      if (ySpeed > 20) {
         dead = true;
         mainGame.soundManager.play("die"); // Mainkan suara mati
      }
      
      ySpeed = 0;       // Hentikan kecepatan jatuh
      onGround = true;    // Set status 'di tanah'
      
      // Koreksi posisi agar pas di atas tanah (mencegah tenggelam)
      y = int(y); 
      while (mainGame.terrain.isGround(x, y)) {
         y--;
      }
      y++;
      
    } else {
      // Jika tidak ada tanah, lemming 'di udara'
      onGround = false;
      ySpeed += gravity; // Terapkan gravitasi
    }
    
    // Terapkan pergerakan vertikal (jatuh atau naik)
    y += ySpeed;
    // ----------------------------------------------------
    
    // Jika di tanah, lemming berjalan
    if (onGround) {
      if (facingRight) {
        x += speed;
      } else {
        x -= speed;
      }
    }
    
    // --- TAMBAHAN: Deteksi Dinding ---
    // Cek apakah ada dinding di depan lemming (setinggi badannya)
    if (onGround && mainGame.terrain.isGround(x + (facingRight ? 5 : -5), y - 5)) {
      facingRight = !facingRight; // Berbalik arah
    }
    // ----------------------------------

    // Deteksi batas bawah layar (mati)
    if (y > height) {
      dead = true;
    }
    
    // Deteksi Pintu Keluar (Selamat) - Asumsi sederhana
    if (x > width - 50 && y >= 380) {
      saved = true;
    }
  }
  
  void draw() {
    // Tentukan warna berdasarkan status
    if (dead) {
      fill(200, 0, 0); // Merah untuk mati
      stroke(200, 0, 0);
    } else if (saved) {
      fill(0, 200, 0); // Hijau untuk selamat
      stroke(0, 200, 0);
    } else {
      fill(0, 0, 255); // Biru untuk hidup
      stroke(0, 0, 255);
    }
    
    // Gambar semut sederhana (dari file asli Anda)
    pushMatrix();
    translate(x, y); 
    if (!facingRight) {
      scale(-1, 1);
    }
    ellipse(0, -5, 6, 6);
    line(-2, -7, -4, -9);
    line(2, -7, 4, -9);
    ellipse(0, 0, 8, 6);
    ellipse(0, 5, 10, 8);
    line(-3, -2, -5, 0);
    line(3, -2, 5, 0);
    line(-2, 1, -4, 3);
    line(2, 1, 4, 3);
    line(-1, 4, -3, 6);
    line(1, 4, 3, 6);
    popMatrix();
  }
  
  // --- MODIFIKASI: Mengisi fungsi applySkill ---
  void applySkill(String skill) {
    // Hanya bisa menerima skill jika belum punya skill
    if (currentSkill != null) return; 
    
    switch(skill) {
      case "Builder": 
        currentSkill = new Builder(); 
        break;
      case "Digger":  
        currentSkill = new Digger(); 
        break;
      case "Blocker": 
        currentSkill = new Blocker(); 
        break;
      case "Floater": 
        currentSkill = new Floater(); 
        break;
      case "Basher":  
        currentSkill = new Basher(); 
        break;
      case "Miner":   
        currentSkill = new Miner(); 
        break;
      // "Bomber" dan "Climber" sudah dihapus sesuai permintaan
    }
  }
  // -------------------------------------------
  
  boolean isDead() {
    return dead;
  }

  boolean isSaved() {
    return saved;
  }
}
