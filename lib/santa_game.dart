import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/timer.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:santa_game/components/background.dart';
import 'package:santa_game/components/play.dart';
import 'package:santa_game/components/player.dart';
import 'package:santa_game/components/tree.dart';

class SantaGame extends FlameGame with TapDetector, HasCollisionDetection {
  late Timer timer;
  late Player player;
  late AudioPlayer audioPlayer;
  bool isPlaying = false;
  late Play playButton;

  @override
  FutureOr<void> onLoad() async {
    FlameAudio.audioCache.loadAll(<String>[
      'music.mp3',
      'jump.mp3',
      'collision.mp3',
    ]);
    add(Background());
    playButton = Play();
    add(playButton);
    audioPlayer = await FlameAudio.loop('music.mp3', volume: 0.4)
      ..stop();

    timer = Timer(
      1.5,
      repeat: true,
      onTick: () {
        add(TreeComponent());
      },
    );
    player = Player();
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (isPlaying) {
      timer.update(dt);
    }
  }

  @override
  void onTap() {
    super.onTap();
    if (isPlaying) {
      player.jump();
    }
  }

  void gameOver() {
    audioPlayer.stop();
    remove(player);
    removeWhere((component) => component is TreeComponent);
    timer.stop();
    add(playButton);
    isPlaying = false;
  }

  void startGame() {
    audioPlayer.resume();

    add(player);
    timer.start();
    remove(playButton);
    isPlaying = true;
  }
}
