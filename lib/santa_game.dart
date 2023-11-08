import 'dart:async';

import 'package:flame/game.dart';
import 'package:flame/timer.dart';
import 'package:santa_game/components/background.dart';
import 'package:santa_game/components/tree.dart';

class SantaGame extends FlameGame {
  late Timer timer;

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
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    timer.update(dt);
  }
}
