import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/timer.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:santa_game/components/background.dart';
import 'package:santa_game/components/player.dart';
import 'package:santa_game/components/tree.dart';

class SantaGame extends FlameGame with TapDetector, HasCollisionDetection {
  late Timer timer;
  late Player player;
  late AudioPlayer audioPlayer;

  @override
  FutureOr<void> onLoad() async {
    FlameAudio.audioCache.loadAll(<String>[
      'music.mp3',
      'jump.mp3',
      'collision.mp3',
    ]);
    add(Background());
    audioPlayer = await FlameAudio.loop('music.mp3', volume: 0.4);
    timer = Timer(
      1.5,
      repeat: true,
      onTick: () {
        add(TreeComponent());
      },
    );
    player = Player();
    add(player);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    timer.update(dt);
  }

  @override
  void onTap() {
    super.onTap();
    player.jump();
  }

  void gameOver() {
    audioPlayer.stop();
    pauseEngine();
  }
}
