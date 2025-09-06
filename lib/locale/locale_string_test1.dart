import 'package:flutter/material.dart';
import 'package:flutter_practice/l10n/generated/app_localizations.dart';

class LocaleStringTest1 extends StatelessWidget {
  const LocaleStringTest1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('appbarTitle'),
      ),
      body: Text(AppLocalizations.of(context)?.locale_string_test2 ?? ''),
    );
  }
}
