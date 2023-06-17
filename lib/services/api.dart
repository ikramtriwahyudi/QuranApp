import 'package:dio/dio.dart';

class API {
  String? _authType;
  String? _authAccessToken;
  int? _authTokenExpire;

  Dio? _client;

  static final API _instance = API._internal();

  API._internal();

  factory API() {
    return _instance;
  }

  String? get authAccessToken => _authAccessToken;
  int? get authTokenExpire => _authTokenExpire;

  BaseOptions options = BaseOptions(
    baseUrl: 'https://quranapi.idn.sch.id',
  );

  setAuth({String? authType, String? accessToken, int? expire}) {
    _authType = authType;
    _authAccessToken = accessToken;
    _authTokenExpire = expire;
  }

  unsetAuth() {
    _authType = null;
    _authAccessToken = null;
    _authTokenExpire = null;
  }

  useAuth() {
    options.headers['authorization'] = '$_authType $_authAccessToken';
    return this;
  }

  Dio client() {
    _client = Dio(options);
    return _client!;
  }
}
