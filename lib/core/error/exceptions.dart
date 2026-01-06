class ServerException implements Exception {
  final String message;
  ServerException([this.message = 'Server error occurred']);
  @override
  String toString() => message;
}

class NetworkException implements Exception {
  final String message;
  NetworkException([this.message = 'Network error occurred']);
  @override
  String toString() => message;
}
