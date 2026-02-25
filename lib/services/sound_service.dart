import 'package:audioplayers/audioplayers.dart';

class SoundService {
  static late AudioPool _correctPool;
  static late AudioPool _wrongPool;
  static late AudioPool _achievementPool;

  static bool _enabled = true; // 🔥 sound state

  static bool get enabled => _enabled;

  static Future init() async {
    _correctPool = await AudioPool.create(
      source: AssetSource('sounds/correct.mp3'),
      maxPlayers: 3,
    );

    _wrongPool = await AudioPool.create(
      source: AssetSource('sounds/incorrect.mp3'),
      maxPlayers: 3,
    );

    _achievementPool = await AudioPool.create(
      source: AssetSource('sounds/archievement.mp3'),
      maxPlayers: 3,
    );
  }

  // 🔥 toggle
  static void toggle() {
    _enabled = !_enabled;
  }

  static void playCorrect() {
    if (!_enabled) return;
    _correctPool.start();
  }

  static void playAchievement() {
    if (!_enabled) return;
    _achievementPool.start();
  }

  static void playWrong() {
    if (!_enabled) return;
    _wrongPool.start();
  }
}
