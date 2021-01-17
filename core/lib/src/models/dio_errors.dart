import 'package:dio/dio.dart';

/// A dio error extended class to throw a custom
/// dio error with custom message with the error code.
///
/// [errorMessage] : The custom error message which will be shown.
/// [errorCode] : The error code got from dio.
class DioErrors extends DioError {
  DioErrors(this.errorMessage, this.errorCode);

  final String errorMessage;
  final int errorCode;

  @override
  String get message => errorMessage;

  int get code => errorCode;

  @override
  String toString() => '$message $errorCode';
}
