import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screen_state/screen_state.dart';
import '../../../providers/app_lock_notifier.dart';

class AppLifecycleObserver extends ConsumerStatefulWidget {
  final Widget child;

  const AppLifecycleObserver({
    super.key,
    required this.child,
  });

  @override
  ConsumerState<AppLifecycleObserver> createState() => _AppLifecycleObserverState();
}

class _AppLifecycleObserverState extends ConsumerState<AppLifecycleObserver>
    with WidgetsBindingObserver {
  Screen? _screen;
  StreamSubscription<ScreenStateEvent>? _screenSubscription;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initScreenStateListener();
  }

  Future<void> _initScreenStateListener() async {
    try {
      _screen = Screen();
      _screenSubscription = _screen!.screenStateStream?.listen((event) {
        if (event == ScreenStateEvent.SCREEN_OFF) {
          // Lock the app when screen turns off
          final appLockNotifier = ref.read(appLockProvider.notifier);
          if (appLockNotifier.shouldLockOnResume()) {
            appLockNotifier.lockApp();
          }
        }
      });
    } catch (e) {
      // Screen state detection not available on this device
      debugPrint('Screen state detection not available: $e');
    }
  }

  @override
  void dispose() {
    _screenSubscription?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // No longer locking based on app lifecycle state changes
    // Lock only happens on screen off events or app restart
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
