import 'package:core/core.dart';

/// An api repository class which will connect to the restful client
/// and get the required data from there. [LocalRepository] can be used
/// here to use the locally saved data which needs to be passed to the
/// api calls. Error handling will not be used here since its just a
/// layer between the [RepositoryCalls] and the remote layer.
class RemoteRepository extends RepositoryMethods {}
