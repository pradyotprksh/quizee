import 'package:core/core.dart';
import 'package:get/get.dart';

/// The repository which will contact the [RemoteRepository] or the
/// [LocalRepository]. Depending on the data required. Sometimes might need to
/// get data just from local so only local call will be made or vice versa.
/// This will throw any error which occurred while getting the data.
class RepositoryCalls extends RepositoryMethods {

  final RemoteRepository _remoteRepository = Get.put(RemoteRepository());

  @override
  Future<QuizResponse> search() => _remoteRepository.search();
}
