import 'package:shared_preferences/shared_preferences.dart';

class Constants{
  static late SharedPreferences _preferences;

  static const String darkModeKey = 'dark_mode_enabled';

  static const adminUId = 'ExmCMJQCsxclU9B7CC3WmbFMbNr2';

  static const _keyAccessToken= 'accesstoken';
  static const _keyFacebookName= 'facebookName';
  static const _keyEmail= 'facebookEmail';
  static const _keyPicture= 'facebookPicture';
  static const _keyUId= 'UId';
  static const _keyUserToken= 'UserToken';
  static const _keyProPic= 'proPic';

  static const _selectedIndex = 4;

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setAccessToken(String accesstoken) async {
    await _preferences.setString(_keyAccessToken, accesstoken);
  }
  static Future setFacebookName(String facebookName) async {
    await _preferences.setString(_keyFacebookName, facebookName);
  }
  static Future setEmail(String email) async {
    await _preferences.setString(_keyEmail, email);
  }

  static Future setPicture(String pictureUrl) async {
    await _preferences.setString(_keyPicture, pictureUrl);
  }

  static Future setProPic(String proPicUrl) async {
    await _preferences.setString(_keyProPic, proPicUrl);
  }

  static Future setSelectedIndex(int selectedIndex) async {
    await _preferences.setInt(_selectedIndex as String, selectedIndex);
  }

  static Future setUId(String Uid) async {
    await _preferences.setString(_keyUId , Uid);
  }
  static Future setUserToken(String UserToken) async {
    await _preferences.setString(_keyUserToken , UserToken);
  }

  static Future<void> setDarkModeEnabled(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(darkModeKey, value);
  }

  static String? getAccessToken() => _preferences.getString(_keyAccessToken);
  static String? getFacebookName() => _preferences.getString(_keyFacebookName);
  static String? getEmail() => _preferences.getString(_keyEmail);
  static String? getPicture() => _preferences.getString(_keyPicture);
  static String? getProPic() => _preferences.getString(_keyProPic);
  static String? getUId() => _preferences.getString(_keyUId);
  static String? getUserToken() => _preferences.getString(_keyUserToken);
  static int? getSelectedIndex() => _preferences.getInt(_selectedIndex as String);

  static const String Settings = "Settings";

  static const List<String> choices = <String>[
  Settings,
  ];

  static Future<bool> isDarkModeEnabled() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(darkModeKey) ?? false;
  }

}
