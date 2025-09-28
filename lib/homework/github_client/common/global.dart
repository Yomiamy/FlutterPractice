import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/github_api_manager.dart';
import '../models/user.dart';

const _themes = <MaterialColor>[Colors.blue, Colors.cyan, Colors.teal, Colors.green, Colors.red];

class Global {
  static const _SP_EXTRA_KEY = "user";
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
  late SharedPreferences _prefs;

  bool get isProd =>
      const String.fromEnvironment(_ENV_FLAVOR_KEY, defaultValue: _ENV_DEV) == _ENV_PROD;

  Global._();

  Future<void> init() async {
    Timeline.startSync('Global.init()');
    _prefs = await SharedPreferences.getInstance();

    String? userJson = _prefs.getString(_SP_EXTRA_KEY);
    if (userJson != null && userJson.isNotEmpty) {
      user = User.fromJson(jsonDecode(userJson));
    }

    GithubApiManager.instance.init();
    Timeline.finishSync();
  }

  void saveProfile() =>
      _prefs.setString(_SP_EXTRA_KEY, user != null ? jsonEncode(user?.toJson()) : "");
}
