import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/timer.dart';
import 'package:santa_game/components/background.dart';
import 'package:santa_game/components/player.dart';
import 'package:santa_game/components/tree.dart';

class SantaGame extends FlameGame with TapDetector {
  late Timer timer;
  late Player player;

  @override
  FutureOr<void> onLoad() async {
    add(Background());
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
}
