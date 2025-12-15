import 'dart:async';

import 'package:flutter/cupertino.dart';

class RouterRefreshNotifier extends ChangeNotifier {
  late final StreamSubscription<String> _routeSubscription;

  RouterRefreshNotifier(Stream<String> routeStream) {
    notifyListeners();

    _routeSubscription = routeStream.listen((data) {
      debugPrint("Route: $data");
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _routeSubscription.cancel();
    super.dispose();
  }
}
