import 'package:core/core.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:shared/shared.dart';

/// A log interceptor for handling the remote calls in the single
/// class. Will be used to throw error or handling request or response.
class LogInterceptors extends Interceptor {
  @override
  Future onRequest(RequestOptions options) async {
    Utility.printILog(
        'onRequest ${options.method} ${options.baseUrl}${options.path} ${options.queryParameters}');
    return options;
  }

  @override
  Future onError(DioError err) async {
    Utility.printELog(
        'onError ${err.request.method} ${err.request.path} ${err.error}');
    if (err.response != null &&
        err.response.data != null &&
        err.response.data.toString().isNotEmpty) {
      try {
        final value = err.response.data as Map<String, dynamic>;
        return DioErrors(value['message'] as String, err.response.statusCode);
      } catch (exception) {
        return DioErrors(
            StringConstants.somethingWentWrong, err.response.statusCode);
      }
    }
    return DioErrors(
        StringConstants.somethingWentWrong, err.response.statusCode);
  }

  @override
  Future onResponse(Response response) async {
    Utility.printDLog(
        'onResponse ${response.request.method} ${response.request.path} ${response.statusCode}');
    return response;
  }
}
