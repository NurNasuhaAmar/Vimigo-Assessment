
import 'package:flame/flame.dart';

class SpriteSheet2 {
  Future<void> get initialize async {
    await Flame.images.loadAll(['animation.png', 'spritesheet.png', 'robot.png']);
  }
}