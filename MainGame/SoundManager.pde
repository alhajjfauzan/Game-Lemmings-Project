import ddf.minim.*;

class SoundManager {
  Minim minim;
  AudioPlayer hoverSound;
  AudioPlayer walkSound, fallSound, dieSound, bombSound, mineSound;
  AudioPlayer OpeningBGM, GameplayBGM;
  PApplet parent;

  SoundManager(PApplet p) {
    parent = p;
    minim = new Minim(parent);
    hoverSound = minim.loadFile("SE/hover.mp3");
    walkSound = minim.loadFile("SE/walk.mp3");
    fallSound = minim.loadFile("SE/fall.mp3");
    dieSound = minim.loadFile("SE/die.mp3");
    bombSound = minim.loadFile("SE/explode.mp3");
    mineSound = minim.loadFile("SE/mining.mp3");
    OpeningBGM = minim.loadFile("SE/bgm.mp3");
    GameplayBGM = minim.loadFile("SE/bgm2.mp3");
  }

  void play(String soundName) {
    switch(soundName) {
      case "hover":
        playHover(); 
        break;
      case "walk": playOnce(walkSound); break;
      case "fall": playOnce(fallSound); break;
      case "die": playOnce(dieSound); break;
      case "bomb": playOnce(bombSound); break;
      case "mine": playOnce(mineSound); break;
      case "bgm": 
        if (!OpeningBGM.isPlaying()) OpeningBGM.loop();
        break;
      case "gameplay": 
        if (!GameplayBGM.isPlaying()) GameplayBGM.loop();
        break;
      default:
        println("Sound not found: " + soundName);
    }
  }

  // khusus hover agar bisa diputar cepat tanpa delay
  void playHover() {
    if (hoverSound == null) return;
    hoverSound.pause();
    hoverSound.rewind();
    hoverSound.play();
  }

  void playOnce(AudioPlayer player) {
    if (player == null) return;
    player.pause();
    player.rewind();
    player.play();
  }

  void stopAll() {
    hoverSound.pause();
    walkSound.pause();
    fallSound.pause();
    dieSound.pause();
    bombSound.pause();
    mineSound.pause();
    OpeningBGM.pause();
    GameplayBGM.pause();
  }

  void close() {
    stopAll();
    hoverSound.close();
    walkSound.close();
    fallSound.close();
    dieSound.close();
    bombSound.close();
    mineSound.close();
    OpeningBGM.close();
    GameplayBGM.close();
    minim.stop();
  }
}
