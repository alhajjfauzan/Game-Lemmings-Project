// File: Basher.pde

class Basher extends Skill {
  int bashCooldown = 0;
  final int MAX_BASH_COOLDOWN = 15;

  Basher() {
    super("Basher");
  }
  
  @Override
  void use(Lemming lemming) {
    super.use(lemming);
    
    lemming.speed = 1.0; // Sedikit lebih lambat
    bashCooldown--;
    
    if (bashCooldown <= 0) {
      float targetX = lemming.x + (lemming.facingRight ? 10 : -10);
      
      mainGame.terrain.destroy(targetX, lemming.y, 15); // Hancurkan ke samping
      bashCooldown = MAX_BASH_COOLDOWN;
      
      // Berhenti jika sudah tidak ada dinding
      if (!mainGame.terrain.isGround(targetX, lemming.y)) {
        lemming.currentSkill = null;
        lemming.speed = 1.5; // Kecepatan normal
      }
    }
  }
}
