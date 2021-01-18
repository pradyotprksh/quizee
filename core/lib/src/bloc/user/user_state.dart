import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

/// A state of the application after [UserBloc]
/// executes the events for the [UserBloc].
class UserState extends Equatable {
  const UserState({
    this.status,
    this.errorMessage,
  });

  final PageStatus status;
  final String errorMessage;

  UserState copyWith({
    PageStatus status,
    String errorMessage,
  }) =>
      UserState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object> get props => [status, errorMessage];
}
