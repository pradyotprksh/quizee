import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

/// A state of the application after [UserBloc]
/// executes the events for the [UserBloc].
class UserState extends Equatable {
  const UserState({
    this.status,
    this.errorMessage,
    this.userName = '',
    this.userProfilePic = '',
    this.quizId = '',
  });

  final PageStatus status;
  final String errorMessage;
  final String userName;
  final String userProfilePic;
  final String quizId;

  UserState copyWith({
    PageStatus status,
    String errorMessage,
    String userName,
    String userProfilePic,
    String quizId,
  }) =>
      UserState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        userName: userName ?? this.userName,
        userProfilePic: userProfilePic ?? this.userProfilePic,
        quizId: quizId ?? this.quizId,
      );

  @override
  List<Object> get props => [
        status,
        errorMessage,
        userName,
        userProfilePic,
        quizId,
      ];
}
