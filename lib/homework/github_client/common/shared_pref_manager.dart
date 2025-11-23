import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// SharedPreferences 单例管理类
/// 提供类型安全的本地存储操作
class SharedPrefManager {
  static SharedPrefManager? _instance;

  /// 获取单例实例
  static SharedPrefManager get instance {
    _instance ??= SharedPrefManager._();
    return _instance!;
  }

  late SharedPreferencesWithCache _prefs;
  bool _initialized = false;

  SharedPrefManager._();

  /// 初始化 SharedPreferences
  /// 必须在使用前调用
  Future<void> init() async {
    if (!_initialized) {
      _prefs = await SharedPreferencesWithCache.create(
        cacheOptions: const SharedPreferencesWithCacheOptions(
          allowList: null,
        ),
      );
      _initialized = true;
    }
  }

  /// 检查是否已初始化
  void _checkInitialized() {
    if (!_initialized) {
      throw StateError('SharedPrefManager not initialized. Call init() first.');
    }
  }

  // ==================== String 操作 ====================

  /// 保存字符串
  Future<void> setString(String key, String value) {
    _checkInitialized();
    return _prefs.setString(key, value);
  }

  /// 获取字符串
  String? getString(String key, {String? defaultValue}) {
    _checkInitialized();
    return _prefs.getString(key) ?? defaultValue;
  }

  // ==================== Int 操作 ====================

  /// 保存整数
  Future<void> setInt(String key, int value) {
    _checkInitialized();
    return _prefs.setInt(key, value);
  }

  /// 获取整数
  int? getInt(String key, {int? defaultValue}) {
    _checkInitialized();
    return _prefs.getInt(key) ?? defaultValue;
  }

  // ==================== Bool 操作 ====================

  /// 保存布尔值
  Future<void> setBool(String key, bool value) {
    _checkInitialized();
    return _prefs.setBool(key, value);
  }

  /// 获取布尔值
  bool? getBool(String key, {bool? defaultValue}) {
    _checkInitialized();
    return _prefs.getBool(key) ?? defaultValue;
  }

  // ==================== Double 操作 ====================

  /// 保存浮点数
  Future<void> setDouble(String key, double value) {
    _checkInitialized();
    return _prefs.setDouble(key, value);
  }

  /// 获取浮点数
  double? getDouble(String key, {double? defaultValue}) {
    _checkInitialized();
    return _prefs.getDouble(key) ?? defaultValue;
  }

  // ==================== List<String> 操作 ====================

  /// 保存字符串列表
  Future<void> setStringList(String key, List<String> value) {
    _checkInitialized();
    return _prefs.setStringList(key, value);
  }

  /// 获取字符串列表
  List<String>? getStringList(String key, {List<String>? defaultValue}) {
    _checkInitialized();
    return _prefs.getStringList(key) ?? defaultValue;
  }

  // ==================== JSON 对象操作 ====================

  /// 保存 JSON 对象（Map）
  Future<void> setJson(String key, Map<String, dynamic> value) {
    _checkInitialized();
    try {
      final jsonString = jsonEncode(value);
      return _prefs.setString(key, jsonString);
    } catch (e) {
      throw FormatException('Failed to encode JSON: $e');
    }
  }

  /// 获取 JSON 对象（Map）
  Map<String, dynamic>? getJson(String key) {
    _checkInitialized();
    final jsonString = _prefs.getString(key);
    if (jsonString == null || jsonString.isEmpty) {
      return null;
    }
    try {
      return jsonDecode(jsonString) as Map<String, dynamic>;
    } catch (e) {
      throw FormatException('Failed to decode JSON from key "$key": $e');
    }
  }

  /// 保存 JSON 列表
  Future<void> setJsonList(String key, List<Map<String, dynamic>> value) {
    _checkInitialized();
    try {
      final jsonString = jsonEncode(value);
      return _prefs.setString(key, jsonString);
    } catch (e) {
      throw FormatException('Failed to encode JSON list: $e');
    }
  }

  /// 获取 JSON 列表
  List<Map<String, dynamic>>? getJsonList(String key) {
    _checkInitialized();
    final jsonString = _prefs.getString(key);
    if (jsonString == null || jsonString.isEmpty) {
      return null;
    }
    try {
      final decoded = jsonDecode(jsonString) as List;
      return decoded.cast<Map<String, dynamic>>();
    } catch (e) {
      throw FormatException('Failed to decode JSON list from key "$key": $e');
    }
  }

  // ==================== 通用操作 ====================

  /// 检查 key 是否存在
  bool containsKey(String key) {
    _checkInitialized();
    return _prefs.containsKey(key);
  }

  /// 删除指定 key
  Future<void> remove(String key) {
    _checkInitialized();
    return _prefs.remove(key);
  }

  /// 清除所有数据
  Future<void> clear() {
    _checkInitialized();
    return _prefs.clear();
  }
}
