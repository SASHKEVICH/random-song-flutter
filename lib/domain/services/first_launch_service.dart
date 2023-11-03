import 'package:shared_preferences/shared_preferences.dart';

class FirstLaunchService {
  final _firstLaunchKey = "isFirstLaunch";

  Future<bool> get isFirstLaunch async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final isFirstLaunch = prefs.getBool(_firstLaunchKey);
    if (isFirstLaunch == null) {
      prefs.setBool(_firstLaunchKey, false);
      return true;
    }

    return isFirstLaunch;
  }
}
