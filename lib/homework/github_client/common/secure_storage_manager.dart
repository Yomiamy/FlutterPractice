import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

/// SecureStorageManager - Singleton manager for FlutterSecureStorage
///
/// Provides basic operations for secure storage, used for sensitive data like tokens, passwords, etc.
class SecureStorageManager {
  static SecureStorageManager? _instance;

  /// Get singleton instance
  static SecureStorageManager get instance {
    _instance ??= SecureStorageManager._();
    return _instance!;
  }

  late final FlutterSecureStorage _storage;
  final Logger _logger = Logger();

  SecureStorageManager._() {
    // Initialize FlutterSecureStorage with Android encryption options
    const androidOptions = AndroidOptions(
      encryptedSharedPreferences: true,
    );

    _storage = const FlutterSecureStorage(
      aOptions: androidOptions,
    );
  }

  // === Basic Operations ===

  /// Store data
  ///
  /// [key] Storage key
  /// [value] Storage value
  ///
  /// Returns [Future<void>], completes on success, throws exception on failure
  Future<void> write(String key, String value) async {
    try {
      await _storage.write(key: key, value: value);
      _logger.d('SecureStorage write success: $key');
    } catch (e) {
      _logger.e('SecureStorage write failed: $key', error: e);
      rethrow;
    }
  }

  /// Read data
  ///
  /// [key] Key to read
  ///
  /// Returns [Future<String?>], returns value if found, null otherwise
  Future<String?> read(String key) async {
    try {
      final value = await _storage.read(key: key);
      _logger.d('SecureStorage read: $key, found: ${value != null}');
      return value;
    } catch (e) {
      _logger.e('SecureStorage read failed: $key', error: e);
      rethrow;
    }
  }

  /// Delete data
  ///
  /// [key] Key to delete
  ///
  /// Returns [Future<void>], completes on success, throws exception on failure
  Future<void> delete(String key) async {
    try {
      await _storage.delete(key: key);
      _logger.d('SecureStorage delete success: $key');
    } catch (e) {
      _logger.e('SecureStorage delete failed: $key', error: e);
      rethrow;
    }
  }

  /// Check if key exists
  ///
  /// [key] Key to check
  ///
  /// Returns [Future<bool>], true if exists, false otherwise
  Future<bool> containsKey(String key) async {
    try {
      final value = await _storage.containsKey(key: key);
      _logger.d('SecureStorage containsKey: $key, result: $value');
      return value;
    } catch (e) {
      _logger.e('SecureStorage containsKey failed: $key', error: e);
      rethrow;
    }
  }

  /// Read all data
  ///
  /// Returns [Future<Map<String, String>>], containing all key-value pairs
  Future<Map<String, String>> readAll() async {
    try {
      final allData = await _storage.readAll();
      _logger.d('SecureStorage readAll success, count: ${allData.length}');
      return allData;
    } catch (e) {
      _logger.e('SecureStorage readAll failed', error: e);
      rethrow;
    }
  }

  /// Delete all data
  ///
  /// Returns [Future<void>], completes on success, throws exception on failure
  ///
  /// Warning: This operation deletes all stored data and cannot be recovered
  Future<void> deleteAll() async {
    try {
      await _storage.deleteAll();
      _logger.d('SecureStorage deleteAll success');
    } catch (e) {
      _logger.e('SecureStorage deleteAll failed', error: e);
      rethrow;
    }
  }
}
