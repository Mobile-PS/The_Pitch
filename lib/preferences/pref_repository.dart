import 'dart:convert';




import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_new_pitchapp/models/LoginResponse.dart';
import 'package:the_new_pitchapp/preferences/const.dart';


class PrefRepository {
  Future<SharedPreferences> _getPref() => SharedPreferences.getInstance();
  final _const = PrefConst();

  clearPreferences() async {
    (await _getPref()).clear();
  }


  saveLoginData(LoginResponse value) async {
    (await _getPref())
        .setString(_const.prefRegisterUser, json.encode(value));
  }

  Future<LoginResponse?> getLoginUserData() async {
    final data = (await _getPref()).getString(_const.prefRegisterUser);
    if (data != null && data.isNotEmpty) {
      return LoginResponse.fromJson(json.decode(data));
    } else {
      return null;
    }
  }



}
