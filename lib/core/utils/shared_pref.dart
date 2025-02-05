import 'package:shared_preferences/shared_preferences.dart';

class Caching {
  static late SharedPreferences preferences;

  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static void keepLoggedIn() async {
    await preferences.setBool('isLogged', true);
  }

  static void saveTraineeName(String name) async {
    await preferences.setString('traineeName', name);
  }

  static void saveTraineeId(String number) async {
    await preferences.setString('traineeId', number);
  }

  static Future<void> logOut() async {
    await preferences.clear();
  }
}
