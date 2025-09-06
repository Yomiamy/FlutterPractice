import 'package:flutter/material.dart';

import '../l10n/generated/l10n.dart';

class LocaleStringTest1 extends StatelessWidget {
  const LocaleStringTest1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('appbarTitle'),
      ),
      body: Text(S.current.locale_string_test2),
    );
  }
}
