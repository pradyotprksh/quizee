import 'package:core/core.dart' as core;
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// A chunk of all the events which will be listened
/// by the common bloc and change the [core.UserState] based on events.
class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends UserEvent {}

class UserDetailsEvent extends UserEvent {}

class NewQuizEvent extends UserEvent {}

class UpdateQuiz extends UserEvent {
  UpdateQuiz({@required this.value, @required this.quizId});

  final String value;
  final String quizId;

  @override
  List<Object> get props => [value, quizId];
}