import 'dart:async';

import 'package:flame/game.dart';
import 'package:santa_game/components/background.dart';

class SantaGame extends FlameGame {
  @override
  FutureOr<void> onLoad() async {
    add(Background());
    return super.onLoad();
  }
}
