import 'package:core/core.dart';
import 'package:get/get.dart';

/// A list of bindings which will be used from the initial route.
class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get..put(SearchInterface())..put(RepositoryCalls())..put(CommonInterface());
  }
}
