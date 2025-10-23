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
  }
  
  void play(String soundName) {
    switch(soundName) {
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
        if (!OpeningBGM.isPlaying()) {
          OpeningBGM.loop();
        }
        break;
      default:
        println("Sound not found: " + soundName);
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
  }

  void close() {
    stopAll();
    walkSound.close();
    fallSound.close();
    dieSound.close();
    bombSound.close();
    mineSound.close();
    OpeningBGM.close();
    minim.stop();
  }
}
