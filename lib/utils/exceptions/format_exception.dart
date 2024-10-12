class RFormatException implements Exception {
  final String message;

  // Constructor with a default message
  const RFormatException([this.message = 'Invalid format detected.']);

  @override
  String toString() => 'TFormatException: $message';
}
