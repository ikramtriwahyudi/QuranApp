import 'package:shared_preferences/shared_preferences.dart';
import 'package:zulhijaya_task_project/apis/auth.dart';
import 'package:zulhijaya_task_project/services/api.dart';

class Auth {
  static login({String? email, String? password}) async {
    var res = await AuthAPI().login(
      email: email,
      password: password,
    );

    await Auth.saveToken(
      authType: 'Bearer',
      accessToken: res.data['data']['access_token'],
      expire: res.data['data']['expires'],
    );
  }

  static loggedIn() async {
    return API().authAccessToken == null ? false : true;
    // return prefs.getString('auth_access_token') == null ? false : true;
  }

  static logout() async {
    await clearToken();
  }

  static saveToken({
    required String authType,
    required String accessToken,
    int? expire,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_type', authType);
    await prefs.setString('auth_access_token', accessToken);
    await prefs.setInt('auth_token_expire', expire ?? 0);

    API().setAuth(
      authType: authType,
      accessToken: accessToken,
      expire: expire,
    );
  }

  static loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    API().setAuth(
      authType: prefs.getString('auth_type'),
      accessToken: prefs.getString('auth_access_token'),
      expire: prefs.getInt('auth_token_expire'),
    );
  }

  static clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_type');
    await prefs.remove('auth_access_token');
    await prefs.remove('auth_token_expire');

    API().unsetAuth();
  }
}
