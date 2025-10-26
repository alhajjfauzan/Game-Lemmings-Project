// File: Builder.pde

class Builder extends Skill {
  int stepsBuilt = 0;
  final int MAX_STEPS = 12; // Batas jumlah tangga
  int buildCooldown = 0;
  final int MAX_BUILD_COOLDOWN = 20; // Jeda antar langkah (frame)

  Builder() {
    super("Builder"); // Nama sudah benar
  }
  
  @Override
  void use(Lemming lemming) {
    super.use(lemming);
    
    // Jika sudah selesai, nonaktifkan skill
    if (stepsBuilt >= MAX_STEPS) {
      lemming.currentSkill = null;
      return;
    }
    
    lemming.speed = 1.0; // Bergerak lebih lambat saat membangun
    buildCooldown--;
    
    if (buildCooldown <= 0) {
      // Tentukan posisi blok baru
      float buildX = lemming.x + (lemming.facingRight ? 5 : -5);
      float buildY = lemming.y + 5;
      
      // Panggil fungsi build di Terrain
      mainGame.terrain.build(buildX, buildY, 10);
      
      // Gerakkan lemming sedikit ke atas dan ke depan
      lemming.x += (lemming.facingRight ? 4 : -4);
      lemming.y -= 2;
      
      stepsBuilt++;
      buildCooldown = MAX_BUILD_COOLDOWN; // Reset cooldown
    }
  }
}
