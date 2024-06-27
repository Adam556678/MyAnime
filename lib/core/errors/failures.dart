abstract class Failure {
  final String? message;

  Failure({this.message});
}

class ServerFailure extends Failure {
  ServerFailure(String? message) : super(message: message);
}

class ElementNotFoundFailure extends Failure {}

class OfflineFailure extends Failure {}
