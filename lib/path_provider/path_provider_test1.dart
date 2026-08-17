import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class PathProviderTest1 extends StatefulWidget {
  const PathProviderTest1({super.key});

  @override
  State<PathProviderTest1> createState() => _PathProviderTest1State();
}

class _PathProviderTest1State extends State<PathProviderTest1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PathProviderTest1')),
      body: FutureBuilder(
        future: _getImageFile(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const SizedBox.shrink();

          final file = snapshot.data!;
          if (!file.existsSync()) return const SizedBox.shrink();

          return Image.file(
            file,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }

  Future<File> _getImageFile() async {
    final directory = await getExternalStorageDirectory();
    return File('${directory?.path ?? ''}/three_pig_page10.jpg');
  }
}
