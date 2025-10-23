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
    // Border dihapus: Tidak ada deteksi tepi layar lagi
    // Jika jatuh dari terlalu tinggi → mati
    if (y > height) {
      dead = true;
    }
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
    // Gambar semut sederhana
    // Simpan transformasi saat ini
    pushMatrix();
    translate(x, y); // Pindah ke posisi lemming
    // Jika menghadap kiri, flip horizontal
    if (!facingRight) {
      scale(-1, 1);
    }
    // Kepala (lingkaran kecil)
    ellipse(0, -5, 6, 6);
    // Antena (dua garis kecil dari kepala)
    line(-2, -7, -4, -9);
    line(2, -7, 4, -9);
    // Thorax (tubuh tengah, elips)
    ellipse(0, 0, 8, 6);
    // Abdomen (tubuh belakang, lingkaran)
    ellipse(0, 5, 10, 8);
    // Kaki (6 kaki sederhana, garis)
    // Kaki depan
    line(-3, -2, -5, 0);
    line(3, -2, 5, 0);
    // Kaki tengah
    line(-2, 1, -4, 3);
    line(2, 1, 4, 3);
    // Kaki belakang
    line(-1, 4, -3, 6);
    line(1, 4, 3, 6);
    // Kembalikan transformasi
    popMatrix();
  }
  void applySkill(String skill) {
    //if (skill.equals("mining")) {
    //  mining = true;
    //  miningTimer = 300; // Durasi 5 detik (pada 60 FPS)
    //}
  }
  boolean isDead() {
    return dead;
  }

  boolean isSaved() {
    return saved;
  }
}
