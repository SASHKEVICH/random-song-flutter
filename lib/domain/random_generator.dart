import 'dart:math';

class RandomGenerator {
  static int getRandomInt(min, max) => (Random().nextInt(max - min + 1) + min).floor();
}