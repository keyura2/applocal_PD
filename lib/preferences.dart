import 'package:shared_preferences/shared_preferences.dart';

class AppLockManager {
  static const String appLockKey = 'appLock';
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<bool> isAppLockEnabled() async {
    final SharedPreferences prefs = await _prefs;
    bool? data = prefs.getBool(appLockKey);
    return data ?? false;
  }

  Future<void> toggleAppLock(bool enabled) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setBool(appLockKey, enabled);
  }
}
