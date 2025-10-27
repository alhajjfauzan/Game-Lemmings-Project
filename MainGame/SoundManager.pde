import ddf.minim.*;

class SoundManager {
  Minim minim;
  AudioPlayer walkSound;
  AudioPlayer fallSound;
  AudioPlayer dieSound;
  AudioPlayer saveSound;
  AudioPlayer bombSound;
  AudioPlayer mineSound;
  AudioPlayer OpeningBGM;
  AudioPlayer GameplayBGM;
  AudioPlayer hoverSound;
  PApplet parent;
  SoundManager(PApplet p) {
    parent = p;
    minim = new Minim(parent);
    walkSound = minim.loadFile("SE/walk.mp3");
    fallSound = minim.loadFile("SE/fall.mp3");
    dieSound  = minim.loadFile("SE/die.mp3");
    bombSound = minim.loadFile("SE/explode.mp3");
    mineSound = minim.loadFile("SE/mining.mp3");
    OpeningBGM= minim.loadFile("SE/bgm.mp3");
    GameplayBGM= minim.loadFile("SE/bgm2.mp3");
    hoverSound= minim.loadFile("SE/hover.mp3");
  }
  
  void play(String soundName) {
    switch(soundName) {
      case "hoverLoop":
        if (hoverSound != null && !hoverSound.isPlaying()) {
          hoverSound.loop();  // Loop suara hover
        }
        break;
      case "walk":
        playOnce(walkSound);
        break;
      case "fall":
        playOnce(fallSound);
        break;
      case "die":
        playOnce(dieSound);
        break;
      case "bomb":
        playOnce(bombSound);
        break;
      case "mine":
        playOnce(mineSound);
        break;
      case "bgm":
        // Hentikan BGM gameplay jika sedang dimainkan
        if (GameplayBGM.isPlaying()) {
          GameplayBGM.pause();
          GameplayBGM.rewind();  // Reset ke awal jika perlu
        }
        // Mainkan BGM opening jika belum dimainkan
        if (!OpeningBGM.isPlaying()) {
          OpeningBGM.loop();
        }
        break;
      case "gameplay":  // Tambahkan case baru untuk BGM gameplay
        // Hentikan BGM opening jika sedang dimainkan
        if (OpeningBGM.isPlaying()) {
          OpeningBGM.pause();
          OpeningBGM.rewind();  // Reset ke awal jika perlu
        }
        // Mainkan BGM gameplay jika belum dimainkan
        if (!GameplayBGM.isPlaying()) {
          GameplayBGM.loop();
        }
        break;
      default:
        println("Sound not found: " + soundName);
        break;
    }
  }

  // Tambahkan metode stop untuk menghentikan suara spesifik
  void stop(String soundName) {
    switch(soundName) {
      case "hover":
        if (hoverSound != null) {
          hoverSound.pause();  // Hentikan suara hover
          hoverSound.rewind();  // Reset ke awal jika perlu
        }
        break;
      // Tambahkan case lain jika diperlukan, misalnya untuk BGM
      default:
        println("Stop sound not found: " + soundName);
        break;
    }
  }

  void playOnce(AudioPlayer player) {
    if (player == null) return;
    if (player.isPlaying()) player.rewind();
    player.play();
  }

  void stopAll() {
    walkSound.pause();
    fallSound.pause();
    dieSound.pause();
    bombSound.pause();
    mineSound.pause();
    OpeningBGM.pause();
    GameplayBGM.pause();
    hoverSound.pause();
  }

  void close() {
    stopAll();
    walkSound.close();
    fallSound.close();
    dieSound.close();
    bombSound.close();
    mineSound.close();
    OpeningBGM.close();
    GameplayBGM.close();
    hoverSound.close();
    minim.stop();
  }
}
