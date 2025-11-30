// lib/services/network_service.dart
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class NetworkService extends GetxService {
  static final RxBool isConnected = true.obs;
  static final Connectivity _connectivity = Connectivity();
  static StreamSubscription<List<ConnectivityResult>>? _subscription;

  static Future<void> init() async {
    final result = await _connectivity.checkConnectivity();
    isConnected.value = !_isDisconnected(result);

    _subscription = _connectivity.onConnectivityChanged.listen((results) {
      final hasConnection = results.any((r) => r != ConnectivityResult.none);
      isConnected.value = hasConnection;

      if (!hasConnection) {
        showNoInternetScreen();
      } else if (Get.currentRoute == '/no-internet-screen') {
        Get.back(); // remove no internet screen when reconnected
      }
    });
  }

  static bool _isDisconnected(List<ConnectivityResult> results) {
    return results.every((r) => r == ConnectivityResult.none);
  }

  static Future<bool> isConnectedNow() async {
    final results = await _connectivity.checkConnectivity();
    return results.any((r) => r != ConnectivityResult.none);
  }

  static Future<void> showNoInternetScreen() async {
    if (Get.currentRoute != '/no-internet-screen') {
      await Get.toNamed('/no-internet-screen');
    }
  }

  static Future<void> dispose() async {
    await _subscription?.cancel();
  }
}
