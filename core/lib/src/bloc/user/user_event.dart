import 'package:core/core.dart' as core;
import 'package:equatable/equatable.dart';

/// A chunk of all the events which will be listened
/// by the common bloc and change the [core.UserState] based on events.
class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends UserEvent {}