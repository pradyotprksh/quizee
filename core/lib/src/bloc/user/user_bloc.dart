import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// A user bloc which contains the form logic for validating
/// email, password, and other form inputs. And other user related events.
class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState());

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is LoginEvent) {
      yield* _mapLoginEventToState(event);
    }
  }

  /// Map login event to state
  Stream<UserState> _mapLoginEventToState(LoginEvent event) async* {
    yield state.copyWith(status: PageStatus.loading);
    try {
      var user = await _handleSignIn();
      await FirebaseFirestore.instance
          .collection(NetworkConstants.user)
          .doc(user.uid)
          .set(<String, dynamic>{
        NetworkConstants.userId: user.uid,
        NetworkConstants.userName: user.displayName,
        NetworkConstants.userProfilePic: user.photoURL,
      });
      yield state.copyWith(
        status: PageStatus.success,
      );
    } catch (exception) {
      yield state.copyWith(
        status: PageStatus.error,
        errorMessage: exception.toString(),
      );
    }
  }

  /// Handle google login
  Future<User> _handleSignIn() async {
    final googleUser = await _googleSignIn.signIn();
    final googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final user = (await _auth.signInWithCredential(credential)).user;
    return user;
  }
}
