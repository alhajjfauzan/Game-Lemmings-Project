// File: Blocker.pde

class Blocker extends Skill {
  Blocker() {
    super("Blocker"); // Nama diperbaiki
  }
  
  @Override
  void use(Lemming lemming) {
    super.use(lemming);
    
    // Skill ini pasif: hanya mengubah status lemming sekali
    lemming.speed = 0; // Berhenti total
    lemming.isBlocking = true; // Set status blocking
    
    // Catatan: Logika agar lemming lain berbalik arah harus ditambahkan
    // di dalam class Lemming (di fungsi update-nya) oleh teman Anda.
  }
}
