import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// SQLite 數據庫管理器
/// 提供數據庫的 CRUD 操作
class SQLiteManager {
  static SQLiteManager? _instance;

  /// 獲取單例實例
  static SQLiteManager get instance {
    _instance ??= SQLiteManager._();
    return _instance!;
  }

  Database? _database;
  bool _initialized = false;

  SQLiteManager._();

  /// 獲取數據庫實例
  /// 必須先調用 init() 初始化
  Database get database {
    if (!_initialized || _database == null) {
      throw StateError('SQLiteManager not initialized. Call init() first.');
    }
    return _database!;
  }

  /// 檢查是否已初始化
  bool get isInitialized => _initialized && _database != null;

  /// 初始化數據庫
  ///
  /// [dbName] 數據庫名稱，默認為 app_database.db
  /// [version] 數據庫版本號，默認為 1
  /// [onCreate] 數據庫創建時的回調函數
  /// [onUpgrade] 數據庫升級時的回調函數
  /// [onDowngrade] 數據庫降級時的回調函數
  Future<void> init({
    String dbName = 'app_database.db',
    int version = 1,
    required OnDatabaseCreateFn onCreate,
    OnDatabaseVersionChangeFn? onUpgrade,
    OnDatabaseVersionChangeFn? onDowngrade,
  }) async {
    if (_initialized) {
      return;
    }

    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);

    _database = await openDatabase(
      path,
      version: version,
      onCreate: onCreate,
      onUpgrade: onUpgrade,
      onDowngrade: onDowngrade,
    );

    _initialized = true;
  }

  // ==================== 查詢操作 ====================

  /// 查詢數據
  ///
  /// [table] 表名
  /// [columns] 要查詢的列，null 表示查詢所有列
  /// [where] WHERE 子句，不包含 WHERE 關鍵字
  /// [whereArgs] WHERE 子句的參數
  /// [orderBy] ORDER BY 子句
  /// [limit] 限制返回的行數
  /// [offset] 跳過的行數
  ///
  /// 返回查詢結果 List<Map<String, dynamic>>
  Future<List<Map<String, dynamic>>> query(
    String table, {
    List<String>? columns,
    String? where,
    List<Object?>? whereArgs,
    String? orderBy,
    int? limit,
    int? offset,
  }) async {
    return database.query(
      table,
      columns: columns,
      where: where,
      whereArgs: whereArgs,
      orderBy: orderBy,
      limit: limit,
      offset: offset,
    );
  }

  /// 查詢第一條數據
  ///
  /// 如果沒有查詢到結果，返回 null
  Future<Map<String, dynamic>?> queryFirst(
    String table, {
    List<String>? columns,
    String? where,
    List<Object?>? whereArgs,
    String? orderBy,
  }) async {
    final results = await query(
      table,
      columns: columns,
      where: where,
      whereArgs: whereArgs,
      orderBy: orderBy,
      limit: 1,
    );
    return results.isNotEmpty ? results.first : null;
  }

  /// 執行 SQL 查詢
  ///
  /// [sql] SQL 查詢語句
  /// [arguments] 查詢參數
  Future<List<Map<String, dynamic>>> rawQuery(
    String sql, [
    List<Object?>? arguments,
  ]) async {
    return database.rawQuery(sql, arguments);
  }

  // ==================== 插入操作 ====================

  /// 插入數據
  ///
  /// [table] 表名
  /// [values] 要插入的數據，鍵為列名，值為列值
  /// [conflictAlgorithm] 衝突處理策略，默認為拋出異常
  ///
  /// 返回插入的行 ID
  Future<int> insert(
    String table,
    Map<String, dynamic> values, {
    ConflictAlgorithm? conflictAlgorithm,
  }) async {
    return database.insert(
      table,
      values,
      conflictAlgorithm: conflictAlgorithm,
    );
  }

  /// 批量插入數據
  ///
  /// [table] 表名
  /// [valuesList] 要插入的數據列表
  /// [conflictAlgorithm] 衝突處理策略
  ///
  /// 返回插入的行 ID 列表
  Future<List<int>> insertBatch(
    String table,
    List<Map<String, dynamic>> valuesList, {
    ConflictAlgorithm? conflictAlgorithm,
  }) async {
    final batch = database.batch();
    for (final values in valuesList) {
      batch.insert(table, values, conflictAlgorithm: conflictAlgorithm);
    }
    final results = await batch.commit();
    return results.cast<int>();
  }

  /// 執行 SQL 插入
  ///
  /// [sql] SQL 插入語句
  /// [arguments] 插入參數
  Future<int> rawInsert(String sql, [List<Object?>? arguments]) async {
    return database.rawInsert(sql, arguments);
  }

  // ==================== 更新操作 ====================

  /// 更新數據
  ///
  /// [table] 表名
  /// [values] 要更新的數據，鍵為Column名，值為Column值
  /// [where] WHERE 子句，不包含 WHERE 關鍵字
  /// [whereArgs] WHERE 子句的參數
  /// [conflictAlgorithm] 衝突處理策略
  ///
  /// 返回受影響的行數
  Future<int> update(
    String table,
    Map<String, dynamic> values, {
    String? where,
    List<Object?>? whereArgs,
    ConflictAlgorithm? conflictAlgorithm,
  }) async {
    return database.update(
      table,
      values,
      where: where,
      whereArgs: whereArgs,
      conflictAlgorithm: conflictAlgorithm,
    );
  }

  /// 執行 SQL 更新
  ///
  /// [sql] SQL 更新語句
  /// [arguments] 更新參數
  ///
  /// 返回受影響的行數
  Future<int> rawUpdate(String sql, [List<Object?>? arguments]) async {
    return database.rawUpdate(sql, arguments);
  }

  // ==================== 刪除操作 ====================

  /// 刪除數據
  ///
  /// [table] 表名
  /// [where] WHERE 子句，不包含 WHERE 關鍵字
  /// [whereArgs] WHERE 子句的參數
  ///
  /// 返回受影響的行數
  Future<int> delete(
    String table, {
    String? where,
    List<Object?>? whereArgs,
  }) async {
    return database.delete(
      table,
      where: where,
      whereArgs: whereArgs,
    );
  }

  /// 執行 SQL 刪除
  ///
  /// [sql] SQL 刪除語句
  /// [arguments] 刪除參數
  ///
  /// 返回受影響的行數
  Future<int> rawDelete(String sql, [List<Object?>? arguments]) async {
    return database.rawDelete(sql, arguments);
  }

  // ==================== 事務操作 ====================

  /// 執行事務
  ///
  /// [action] 在事務中執行的操作
  /// [exclusive] 是否獨佔事務，默認為 true
  ///
  /// 返回操作的結果
  Future<T> transaction<T>(
    Future<T> Function(Transaction txn) action, {
    bool? exclusive,
  }) async {
    return database.transaction(action, exclusive: exclusive);
  }

  // ==================== 批處理操作 ====================

  /// 創建批處理對象
  ///
  /// 用於批量執行多個數據庫操作
  Batch batch() {
    return database.batch();
  }

  /// 提交批處理
  ///
  /// [batch] 批處理對象
  /// [noResult] 是否不返回結果，默認為 false
  /// [continueOnError] 出錯時是否繼續，默認為 false
  Future<List<Object?>> commitBatch(
    Batch batch, {
    bool? noResult,
    bool? continueOnError,
  }) async {
    return batch.commit(
      noResult: noResult,
      continueOnError: continueOnError,
    );
  }

  // ==================== 工具方法 ====================

  /// 執行原生 SQL（不返回結果）
  ///
  /// 用於 CREATE、DROP、ALTER 等語句
  /// [sql] SQL 語句
  /// [arguments] SQL 參數
  Future<void> execute(String sql, [List<Object?>? arguments]) async {
    return database.execute(sql, arguments);
  }

  /// 檢查表是否存在
  ///
  /// [tableName] 表名
  Future<bool> tableExists(String tableName) async {
    final result = await rawQuery(
      "SELECT name FROM sqlite_master WHERE type='table' AND name=?",
      [tableName],
    );
    return result.isNotEmpty;
  }

  /// 獲取表的列信息
  ///
  /// [tableName] 表名
  Future<List<Map<String, dynamic>>> getTableInfo(String tableName) async {
    return rawQuery('PRAGMA table_info($tableName)');
  }

  /// 清空表數據（保留表結構）
  ///
  /// [tableName] 表名
  Future<void> clearTable(String tableName) async {
    await delete(tableName);
  }

  /// 刪除表
  ///
  /// [tableName] 表名
  Future<void> dropTable(String tableName) async {
    await execute('DROP TABLE IF EXISTS $tableName');
  }

  // ==================== 數據庫生命週期 ====================

  /// 關閉數據庫
  Future<void> close() async {
    if (_database != null && _database!.isOpen) {
      await _database!.close();
      _database = null;
      _initialized = false;
    }
  }

  /// 刪除數據庫文件
  ///
  /// [dbName] 數據庫名稱
  static Future<void> deleteDatabase(String dbName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);
    await databaseFactory.deleteDatabase(path);
  }

  /// 獲取數據庫路徑
  ///
  /// [dbName] 數據庫名稱
  static Future<String> getDatabasePath(String dbName) async {
    final databasePath = await getDatabasesPath();
    return join(databasePath, dbName);
  }
}
