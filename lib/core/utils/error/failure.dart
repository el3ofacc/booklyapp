import 'package:dartz/dartz.dart';

abstract class Failure {
  String error;
  Failure(this.error);
}

class Networkfailure extends Failure {
  Networkfailure(super.error);
}

class Serverfailure extends Failure {
  Serverfailure(super.error);
}
