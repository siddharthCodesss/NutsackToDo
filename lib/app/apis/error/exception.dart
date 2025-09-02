class ServerException implements Exception {
  final int? code;
  final String? message;

  ServerException(this.code, this.message);

  @override
  String toString() {
    return 'Error occurred. Code: $code';
  }
}

class PlayerServiceNotRunningException implements Exception{}
