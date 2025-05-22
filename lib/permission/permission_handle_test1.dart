import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandleTest1 extends StatefulWidget {
  const PermissionHandleTest1({super.key});

  @override
  State<PermissionHandleTest1> createState() => _PermissionHandleTest1State();
}

class _PermissionHandleTest1State extends State<PermissionHandleTest1> {
  String _permissionStatus = "None";
  XFile? _imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('PermissionHandleTest1', style: TextStyle(fontSize: 22)),
      ),
      body: Column(children: <Widget>[
        Text('權限要求狀態: $_permissionStatus'),
        ElevatedButton(
          onPressed: () {
            _requestCameraPermission();
          },
          child: const Text('要求相機權限'),
        ),
        Visibility(
            visible: _imageFile != null,
            child: Image(
                image: FileImage(File(_imageFile?.path ?? "")),
                fit: BoxFit.cover,
                width: 200,
                height: 200)),
        ElevatedButton(
          onPressed: () {
            _requestPhotoSelection();
          },
          child: const Text('照片選取'),
        )
      ]),
    );
  }

  Future<void> _requestCameraPermission() async {
    // 取得目前權限狀態
    var status = await Permission.camera.status;
    if (status.isGranted) {
      setState(() => _permissionStatus = "已授權");
    } else if (status.isDenied) {
      // 要求權限
      var result = await Permission.camera.request();
      setState(() {
        if (result.isGranted) {
          _permissionStatus = "已授權";
        } else if (result.isPermanentlyDenied) {
          _permissionStatus = "永久拒絕，請至設定開啟";
        } else {
          _permissionStatus = "被拒絕";
        }
      });
    } else if (status.isPermanentlyDenied) {
      setState(() => _permissionStatus = "永久拒絕，請至設定開啟");
      openAppSettings(); // 可選：自動跳設定頁
    }
  }

  void _requestPhotoSelection() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
    }
  }
}
