/*
 * 專案：favor_app
 * 程式碼檔案：lib/tab/favor.dart
 * 主要用途：定義 Favor 類別，代表一個「人情債」。
 *
 * 類別 Favor:
 *   - uuid (String): 人情債的唯一識別碼。
 *   - description (String): 人情債的描述。
 *   - dueDate (DateTime): 人情債的截止日期。
 *   - accepted (bool?): 人情債是否已被接受 (可為 null)。
 *   - completed (DateTime?): 人情債的完成日期 (可為 null)。
 *   - friend (Friend): 與此人情債相關的朋友。
 *
 * 方法:
 *   - Favor (建構子): 初始化 Favor 物件。
 *   - isDoing (getter): 判斷人情債是否正在進行中 (已接受但未完成)。
 *   - isRequested (getter): 判斷人情債是否為請求狀態 (尚未被接受)。
 *   - isCompleted (getter): 判斷人情債是否已完成。
 *   - isRefused (getter): 判斷人情債是否已被拒絕。
 *   - copyWith (方法): 創建一個新的 Favor 物件，並可選擇性地覆蓋現有屬性。
 */
import 'friend.dart';

class Favor {
  final String uuid;
  final String description;
  final DateTime dueDate;
  final bool? accepted;
  final DateTime? completed;
  final Friend friend;

  Favor({
    required this.uuid,
    required this.description,
    required this.dueDate,
    this.accepted,
    this.completed,
    required this.friend,
  });

  bool get isDoing => accepted == true && completed == null;

  bool get isRequested => accepted == null;

  bool get isCompleted => completed != null;

  bool get isRefused => !(accepted ?? true);

  Favor copyWith({
    String? uuid,
    String? description,
    DateTime? dueDate,
    bool? accepted,
    DateTime? completed,
    Friend? friend,
  }) {
    return Favor(
      uuid: uuid ?? this.uuid,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      accepted: accepted ?? this.accepted,
      completed: completed ?? this.completed,
      friend: friend ?? this.friend,
    );
  }

}