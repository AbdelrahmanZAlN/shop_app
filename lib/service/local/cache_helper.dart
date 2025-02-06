import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
  //
  // static Future<bool> putBoolean({
  //   required String key,
  //   required bool value,
  // }) async {
  //   return await sharedPreferences.setBool(key, value);
  // }
  //
  // static bool getBoolean({
  //   required String key,
  // }) {
  //   return sharedPreferences.getBool(key) ?? false; // Default to false if the key doesn't exist
  // }
  //

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {  // bool string int double
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }
    else if (value is String) {
      return await sharedPreferences.setString(key, value);
    }else if (value is int) {
      return await sharedPreferences.setInt(key, value);
    }else if (value is double) {
      return await sharedPreferences.setDouble(key, value);
    }
    else {
      return false;
    }
  }


  static dynamic getData({
    required String key,
  }) {
    return sharedPreferences.get(key); // Default to null if the key doesn't exist
  }

}
