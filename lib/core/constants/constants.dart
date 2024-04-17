import 'package:shared_preferences/shared_preferences.dart';

class Constants{
  static late SharedPreferences _preferences;

  static const _keyAccessToken= 'accesstoken';
  static const _keyFacebookName= 'facebookName';
  static const _keyEmail= 'facebookEmail';
  static const _keyPicture= 'facebookPicture';

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

  static Future setSelectedIndex(int selectedIndex) async {
    await _preferences.setInt(_selectedIndex as String, selectedIndex);
  }

  static String? getAccessToken() => _preferences.getString(_keyAccessToken);
  static String? getFacebookName() => _preferences.getString(_keyFacebookName);
  static String? getEmail() => _preferences.getString(_keyEmail);
  static String? getPicture() => _preferences.getString(_keyPicture);
  static int? getSelectedIndex() => _preferences.getInt(_selectedIndex as String);

  static const String Settings = "Settings";

  static const List<String> choices = <String>[
  Settings,
  ];

}
