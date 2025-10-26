// File: Miner.pde

class Miner extends Skill {
  int mineCooldown = 0;
  final int MAX_MINE_COOLDOWN = 25;

  Miner() {
    super("Miner");
  }
  
  @Override
  void use(Lemming lemming) {
    super.use(lemming);
    
    mineCooldown--;
    
    if (mineCooldown <= 0) {
      float targetX = lemming.x + (lemming.facingRight ? 8 : -8);
      float targetY = lemming.y + 8; // Ke arah diagonal bawah
      
      mainGame.terrain.destroy(targetX, targetY, 15); // Hancurkan diagonal
      mainGame.soundManager.play("mine"); // Mainkan suara mining
      
      // Gerakkan lemming secara diagonal
      lemming.x += (lemming.facingRight ? 1 : -1);
      lemming.y += 1;
      
      mineCooldown = MAX_MINE_COOLDOWN;
      
      // Berhenti jika tembus
      if (!mainGame.terrain.isGround(targetX, targetY)) {
        lemming.currentSkill = null;
      }
    }
  }
}
