class Failure {
  final String message;
  Failure(this.message);

  @override
  String toString() {
    // TODO: implement toString
    return "Failure: $message \n(From Failure class)";
  }

  @override
  bool operator ==(Object other) {
    // TODO: implement ==
    if (identical(this, other)) return true;

    return other is Failure && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
