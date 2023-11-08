import 'dart:async';

import 'package:flame/game.dart';
import 'package:santa_game/components/background.dart';
import 'package:santa_game/components/tree.dart';

class SantaGame extends FlameGame {
  @override
  FutureOr<void> onLoad() async {
    add(Background());
    add(TreeComponent());
    return super.onLoad();
  }
}
