import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_practice/homework/github_client/cache/net_cache.dart';
import 'package:flutter_practice/homework/github_client/models/repo.dart';

import '../common/Global.dart';
import '../models/user.dart';

class GithubApiManager {
  static const String baseUrl = "https://api.github.com";

  static GithubApiManager? _sInstance;

  static GithubApiManager get instance {
    _sInstance ??= GithubApiManager._();
    return _sInstance!;
  }

  final Options _options = Options();
  final Dio _dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    headers: {
      HttpHeaders.acceptHeader: "application/vnd.github.squirrel-girl-preview, application/vnd.github.symmetra-preview"
    },
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 30),
  ));

  GithubApiManager._();

  void init() {
    //_dio.interceptors.add(NetCache());
    _dio.interceptors.add(LogInterceptor(
      request: true,
      // 輸出 request 資訊
      requestHeader: true,
      // 輸出 request header
      requestBody: true,
      // 輸出 request body
      responseHeader: true,
      // 輸出 response header
      responseBody: true,
      // 輸出 response body
      error: true,
      // 輸出錯誤資訊
      logPrint: print, // 使用 print 輸出
    ));
  }

  Future<User?> login({required String account, required String passwd}) async {
    // String basic = "Basic ${base64.encode(utf8.encode('$account:$passwd'))}";

    var r = await _dio.get("/users/$account",
        options: _options.copyWith(headers: {
          // HttpHeaders.authorizationHeader: basic,
        }, extra: {
          "noCache": true, //登入介面不快取
        }));

    // 登入成功後更新公用的Header欄位authorization，此後的所有請求都會帶上使用者身份資訊
    // _dio.options.headers[HttpHeaders.authorizationHeader] = basic;

    if(r.statusCode != HttpStatus.ok) {
      return Future.error("Login failed: ${r.statusMessage}");
    } else if(r.data == null) {
      return Future.error("Login failed: User '$account' does not exist or an error occurred.");
    }

    Global.instance.user = User.fromJson(r.data!);

    return Global.instance.user!;
  }

  Future<List<Repo>?> getRepos({
    Map<String, dynamic> queryParams = const {},
    bool refresh = false
  }) async {
    var token = "Bearer <your_personal_access_token>"; // 替換為你的個人訪問令牌
    var r = await _dio.get<List>(
      "/user/repos",
      queryParameters: queryParams,
      options: _options.copyWith(headers: {
        HttpHeaders.authorizationHeader: token,
      }, extra: {
        "noCache": false, // 快取
        "refresh": true, // 是否刷新快取
      })
    );

    if(r.data == null) {
      return null;
    }

    return r.data!.map((e) => Repo.fromJson(e)).toList();
  }
}
