import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';

/// An observer class which observes all the event and state
/// changed in the entire application. Will print the log
/// for each event/change/transition and error occurred.
class BlocObservers extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    Utility.printILog('bloc onEvent: ${bloc.runtimeType}, event: $event');
    super.onEvent(bloc, event);
  }

  @override
  void onChange(Cubit cubit, Change change) {
    Utility.printILog('bloc onChange: ${cubit.runtimeType}, change: $change');
    super.onChange(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    Utility.printILog(
        'bloc onTransition: ${bloc.runtimeType}, transition: $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    Utility.printELog('bloc onError: ${cubit.runtimeType}, error: $error');
    super.onError(cubit, error, stackTrace);
  }
}
