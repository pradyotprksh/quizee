import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:shared/shared.dart';

/// An api repository class which will connect to the restful client
/// and get the required data from there. [LocalRepository] can be used
/// here to use the locally saved data which needs to be passed to the
/// api calls. Error handling will not be used here since its just a
/// layer between the [RepositoryCalls] and the remote layer.
class RemoteRepository extends RepositoryMethods {
  RemoteRepository() {
    _dio = Dio();
    _restClient = RestClient(_dio);
  }

  Dio _dio;
  RestClient _restClient;

  @override
  Future<WikiSearchResponse> search(String searchedQuery) async {
    if (await Utility.isNetworkAvailable()) {
      return _restClient.search(searchedQuery);
    } else {
      throw DioErrors(
        StringConstants.noInternet,
        NetworkConstants.noInternetCode,
      );
    }
  }
}
