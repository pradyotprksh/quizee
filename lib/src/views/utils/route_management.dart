import 'package:WikiSearch/src/views/views.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as flutter_bloc;
import 'package:get/get.dart';

/// A chunk of routes taken in the application.
abstract class RouteManagement {
  static void goToSearchScreen() {
    Get.off<void>(
      flutter_bloc.BlocProvider(
        create: (_) => SearchBloc(),
        child: SearchScreen(),
      ),
      preventDuplicates: false,
      transition: Transition.fadeIn,
    );
  }
}
