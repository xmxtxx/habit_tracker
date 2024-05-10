import 'package:shared_preferences/shared_preferences.dart';

class HabitStorage {
  static const _keyHabits = 'habits';

  static Future<List<String>> loadHabits() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_keyHabits) ?? [];
  }

  static Future<void> saveHabits(List<String> habits) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_keyHabits, habits);
  }
}
