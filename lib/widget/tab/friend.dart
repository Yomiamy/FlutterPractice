/*
 * 檔案路徑: lib/tab/friend.dart
 * 檔案描述: 好友相關類別與資料
 * 包含:
 *   - Friend 類別: 代表一位好友，包含姓名、電話號碼和頭像 URL。
 *   - dummyFriendList: 一個用於展示的假好友列表。
 */

class Friend {
  final String name;
  final String number;
  final String photoURL;

  Friend({
    required this.name,
    required this.number,
    required this.photoURL,
  });
}