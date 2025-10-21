import processing.sound.*;

class SoundManager {
  SoundFile walkSound;
  SoundFile fallSound;
  SoundFile dieSound;
  SoundFile saveSound;
  
  SoundManager() {
    // Load sound files dari folder "data/"
    // Pastikan file disimpan di folder "data" di project Processing kamu
    walkSound = new SoundFile(this, "walk.wav");
    fallSound = new SoundFile(this, "fall.wav");
    dieSound  = new SoundFile(this, "die.wav");
    saveSound = new SoundFile(this, "save.wav");
    bombSound =new SoundFile(this, "bomb.wav");
    mineSound = new SoundFile(this, "mining.wav");
    
  }
  
  void play(String soundName) {
    switch(soundName) {
      case "walk":
        if (!walkSound.isPlaying()) walkSound.play();
        break;
      case "fall":
        fallSound.play();
        break;
      case "die":
        dieSound.play();
        break;
      case "save":
        saveSound.play();
        break;
      default:
        println("Sound not found: " + soundName);
        break;
    }
  }
}
