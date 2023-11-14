import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceClass {
  static String userLoggedInKey = "LOGGEDINKEY";
  static String usernamekey = "USERNAMEKEY";
  static String emailkey = "EMAILKEY";
  static String passwordkey = "PASSWORDKEY";

  static Future<bool> saveUserLoggedInStatus(bool isUserLoggedIn) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setBool(userLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveusername(String username) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return await shared.setString(usernamekey, username);
  }

  static Future<bool> savephonenumber(String phonenumber) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return await shared.setString(emailkey, emailkey);
  }

  static Future<bool> savepassword(String password) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return await shared.setString(passwordkey, password);
  }

  static Future<String?> getusername() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.getString(usernamekey);
  }

  static Future<String?> getphonenumber() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.getString(emailkey);
  }

  static Future<String?> getpassword() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.getString(passwordkey);
  }
}
