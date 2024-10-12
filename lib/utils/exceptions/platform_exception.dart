class RPlatformException implements Exception {
  final String code;
  late final String message;

  RPlatformException(this.code) {
    message = _mapPlatformErrorCodeToMessage(code);
  }

  // Map platform-specific error codes to user-friendly messages
  String _mapPlatformErrorCodeToMessage(String code) {
    switch (code) {
      case 'network_error':
        return 'Network error occurred. Please check your connection.';
      case 'permission_denied':
        return 'Permission denied. Please allow the necessary permissions.';
      case 'location_service_disabled':
        return 'Location services are disabled. Please enable them in settings.';
      default:
        return 'An unknown platform error occurred.';
    }
  }

  @override
  String toString() => 'TPlatformException: $message';
}
