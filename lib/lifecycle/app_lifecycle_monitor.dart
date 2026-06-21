import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class LifecycleMonitor extends StatefulWidget {
  const LifecycleMonitor({super.key});

  @override
  State<LifecycleMonitor> createState() => _LifecycleMonitorState();
}

class _LifecycleMonitorState extends State<LifecycleMonitor>
    with WidgetsBindingObserver {
  late AppLifecycleListener _lifecycleListener;

  @override
  void initState() {
    super.initState();

    debugPrint(
        "[LifecycleMonitor] current State(initState) : ${SchedulerBinding.instance.lifecycleState}");

    WidgetsBinding.instance.addObserver(this);

    _lifecycleListener = AppLifecycleListener(
        onShow: () => _handleTransition('show'),
        onResume: () => _handleTransition('resume'),
        onHide: () => _handleTransition('hide'),
        onInactive: () => _handleTransition('inactive'),
        onPause: () => _handleTransition('pause'),
        onDetach: () => _handleTransition('detach'),
        onRestart: () => _handleTransition('restart'),
        onStateChange: _handleStateChange,
        onExitRequested: _handleExitRequest);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(
        "[LifecycleMonitor] current State(build) : ${SchedulerBinding.instance.lifecycleState}");

    return Scaffold(
      appBar: AppBar(
        title: const Text('LifecycleMonitor'),
      ),
      body: const Text("LifecycleMonitor"),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _lifecycleListener.dispose();

    super.dispose();
  }

  // ==== AppLifecycleListener ====
  void _handleStateChange(AppLifecycleState state) {
    // do something
  }

  void _handleTransition(String name) {
    debugPrint("[LifecycleMonitor] $name");
  }

  final bool _shouldExit = true;

  Future<AppExitResponse> _handleExitRequest() async {
    final AppExitResponse response =
        _shouldExit ? AppExitResponse.exit : AppExitResponse.cancel;

    debugPrint("[LifecycleMonitor] ${response.name}");

    return response;
  }

  Future<void> _quit() async {
    final AppExitType exitType =
        _shouldExit ? AppExitType.required : AppExitType.cancelable;

    //exit(0);
    // 建議使用 exitApplication 關閉App 它讓 FlutterEngine 有機會清理資源,
    // 在退出時不會崩潰，建議使用此方式退出 APP
    await ServicesBinding.instance.exitApplication(exitType);
  }

  // ==== WidgetsBindingObserver ====

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    debugPrint("[LifecycleMonitor] didChangeAppLifecycleState : ${state.name}");
  }
}
