import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../common/Global.dart';
import '../models/user.dart';

class UserChangeNotifier extends ChangeNotifier {

  bool get isLogin => user != null;

  User? get user => Global.instance.user;
  set user(User? newUser) {
    if (user?.id == newUser?.id) {
      // 登入未改變
      return;
    }

    Global.instance.user = newUser;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    Global.instance.saveProfile();
    super.notifyListeners();
  }
}