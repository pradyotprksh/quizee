import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

/// A rest client which will help us to connect to the [NetworkConstants.baseUrl]
/// with the different options for connection. Will also contains
/// all the end points of the [core.NetworkConstants.baseUrl].
@RestApi(baseUrl: NetworkConstants.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) {
    dio.options = BaseOptions(
      sendTimeout: 3500,
      connectTimeout: 5000,
      receiveTimeout: 3500,
    );
    dio.interceptors.add(LogInterceptors());
    return _RestClient(dio, baseUrl: baseUrl);
  }

  @GET('api.php?amount=10&difficulty=medium&type=multiple')
  Future<QuizResponse> search();
}
