

class NetworkException implements Exception {
  final Map<String, dynamic> message;

  NetworkException({required this.message});
}