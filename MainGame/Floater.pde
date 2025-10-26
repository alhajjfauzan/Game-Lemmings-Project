// File: Floater.pde

class Floater extends Skill {
  Floater() {
    super("Floater");
  }
  
  @Override
  void use(Lemming lemming) {
    super.use(lemming);
    
    // Logika ini aktif setiap frame
    // Jika lemming sedang jatuh (tidak di tanah DAN kecepatan Y positif)
    if (!lemming.onGround && lemming.ySpeed > 0) {
      lemming.ySpeed = 1.0; // Jatuh sangat lambat (efek parasut)
    }
  }
}
