import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_practice/homework/github_client/common/shared_pref_manager.dart';

import '../api/github_api_manager.dart';
import '../models/user.dart';

const _themes = <MaterialColor>[Colors.blue, Colors.cyan, Colors.teal, Colors.green, Colors.red];

class Global {
  static const SP_EXTRA_KEY = "user";
  static const SP_EXTRA_KEY_USER_NAME = "user_name";
  static const _ENV_FLAVOR_KEY = "FLAVOR";
  static const _ENV_DEV = "dev";
  static const _ENV_BETA = "beta";
  static const _ENV_PROD = "prod";

  // GitHub API Token
  static const String GITHUB_TOKEN = "<Personal_Token>";

  static Global? _sInstance;

  static Global get instance {
    _sInstance ??= Global._();
    return _sInstance!;
  }

  User? user;

  Global._();

  Future<void> init() async {
    Timeline.startSync('Global.init()');

    await SharedPrefManager.instance.init();

    String? userJson = SharedPrefManager.instance.getString(SP_EXTRA_KEY);
    if (userJson != null && userJson.isNotEmpty) {
      user = User.fromJson(jsonDecode(userJson));
    }

    GithubApiManager.instance.init();
    Timeline.finishSync();
  }
}

extension GlobalX on Global {
  bool get isProd =>
      const String.fromEnvironment(Global._ENV_FLAVOR_KEY, defaultValue: Global._ENV_DEV) ==
      Global._ENV_PROD;

  void saveProfile() => SharedPrefManager.instance
      .setString(Global.SP_EXTRA_KEY, user != null ? jsonEncode(user?.toJson()) : "");

  String get userName => SharedPrefManager.instance.getString(Global.SP_EXTRA_KEY_USER_NAME) ?? '';

  set userName(String userName) =>
      SharedPrefManager.instance.setString(Global.SP_EXTRA_KEY_USER_NAME, userName);
}
