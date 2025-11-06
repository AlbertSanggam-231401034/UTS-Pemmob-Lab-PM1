import 'package:vibration/vibration.dart';

class HapticFeedback {
  static Future<void> light() async {
    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(duration: 10);
    }
  }

  static Future<void> medium() async {
    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(duration: 20);
    }
  }

  static Future<void> heavy() async {
    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(duration: 30);
    }
  }

  static Future<void> success() async {
    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(pattern: [0, 50, 100, 50]);
    }
  }

  static Future<void> error() async {
    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(pattern: [0, 100, 50, 100]);
    }
  }

  static Future<void> selection() async {
    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(duration: 5);
    }
  }
}