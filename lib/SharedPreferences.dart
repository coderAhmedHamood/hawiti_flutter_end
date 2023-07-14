import 'package:shared_preferences/shared_preferences.dart';


class SharedPreferencesHelper {
  static const String KEY_PERSON_ID = "person_id";
  static const String KEY_STATE = "state";

  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static Future<bool> getPersonId() async {
    final SharedPreferences prefs = await _prefs;
    bool reslut = true;

    if (prefs.getString(KEY_PERSON_ID) != null) {
      reslut = false;
    }
    return reslut;
  }

  static Future<void> setPersonId(String value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(KEY_PERSON_ID, value);
  }

  static Future<void> clearPersonId() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.remove(KEY_PERSON_ID);
  }
}


// SharedPreferencesHelper helper = SharedPreferencesHelper();
// await helper.clearPersonId();