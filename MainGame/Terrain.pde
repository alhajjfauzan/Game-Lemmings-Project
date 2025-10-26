// File: Terrain.pde (Versi Perbaikan)

class Terrain {
  PGraphics canvas; // Kanvas terpisah untuk menggambar terrain
  color terrainColor;

  Terrain() {
    // Inisialisasi kanvas seukuran layar
    canvas = createGraphics(width, height);
    terrainColor = color(139, 69, 19); // Warna coklat untuk tanah
    loadLevel();
  }
  
  void loadLevel() {
    // Menggambar terrain awal ke kanvas
    canvas.beginDraw();
    canvas.background(0, 0); // Background transparan (langit)
    canvas.fill(terrainColor);
    canvas.noStroke();
    // Membuat platform tanah sederhana
    canvas.rect(0, 400, width, height - 400); 
    canvas.rect(200, 300, 300, 50);
    canvas.endDraw();
  }

  void draw() {
    // Tampilkan kanvas terrain ke layar utama
    image(canvas, 0, 0);
  }
  
  // Deteksi apakah ada tanah di posisi (x,y)
  boolean isGround(float x, float y) {
    if (x < 0 || x >= width || y < 0 || y >= height) {
      return false;
    }
    return alpha(canvas.get(int(x), int(y))) != 0;
  }
  
  // --- PERBAIKAN: Method destroy() ---
  // Menghancurkan terrain (untuk Digger, Basher, Miner)
  void destroy(float x, float y, float radius) {
    canvas.beginDraw();
    // Gunakan blendMode(REMOVE) untuk menghapus
    canvas.blendMode(REPLACE); 
    canvas.fill(255); // Warna tidak penting, alpha-nya yang penting
    canvas.noStroke();
    canvas.ellipse(x, y, radius, radius);
    // Kembalikan ke blendMode normal
    canvas.blendMode(BLEND); 
    canvas.endDraw();
  }
  
  // --- PERBAIKAN: Method build() ---
  // Membangun terrain (untuk Builder)
  void build(float x, float y, float radius) {
    canvas.beginDraw();
    // Pastikan blendMode adalah BLEND (normal) saat membangun
    canvas.blendMode(BLEND); 
    canvas.fill(terrainColor);
    canvas.noStroke();
    canvas.ellipse(x, y, radius, radius);
    canvas.endDraw();
  }
}
