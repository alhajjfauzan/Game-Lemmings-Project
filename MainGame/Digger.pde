// File: Digger.pde

class Digger extends Skill {
  int digCooldown = 0;
  final int MAX_DIG_COOLDOWN = 10;

  Digger() {
    super("Digger"); // Nama diperbaiki
  }
  
  @Override
  void use(Lemming lemming) {
    super.use(lemming);
    
    lemming.speed = 0; // Berhenti bergerak horizontal
    digCooldown--;
    
    if (digCooldown <= 0) {
      // Hancurkan tanah tepat di bawah lemming
      mainGame.terrain.destroy(lemming.x, lemming.y + 10, 15);
      lemming.y += 1; // Lemming ikut turun
      digCooldown = MAX_DIG_COOLDOWN;
      
      // Berhenti menggali jika sudah tidak ada tanah di bawah
      if (!mainGame.terrain.isGround(lemming.x, lemming.y + 12)) {
        lemming.currentSkill = null;
        lemming.speed = 1.5; // Kembalikan kecepatan normal
      }
    }
  }
}
