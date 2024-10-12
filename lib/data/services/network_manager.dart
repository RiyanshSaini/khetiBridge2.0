import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../common/widgets/loaders/loaders.dart';  // For GetX and Loaders

class NetworkManager extends GetxController {
  // Singleton instance of NetworkManager
  static NetworkManager get instance => Get.find();

  final Connectivity connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;  // Use ConnectivityResult, not List
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  /// Initialize the network manager and set up a stream to continually check the connection status.
  @override
  void onInit() {
    super.onInit();
    // Listen to connectivity changes and update connection status
    _connectivitySubscription = connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      _updateConnectionStatus(result);  // Update status using the existing method
    });
  }

  /// Update the connection status based on changes in connectivity.
  /// Show a relevant popup for no internet connection.
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus.value = result;

    if (result == ConnectivityResult.none) {
      RLoaders.warningSnackBar(
        title: 'No Internet Connection',
        message: 'Please check your network settings.',
      );
    }
  }

  /// Check the internet connection status.
  /// Returns true if connected, false otherwise.
  Future<bool> isConnected() async {
    try {
      final result = await connectivity.checkConnectivity();
      return result != ConnectivityResult.none;
    } on PlatformException catch (_) {
      return false;
    }
  }

  /// Dispose or close the active connectivity stream.
  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }
}
