import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as get_controller;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared/shared.dart';

/// A user bloc which contains the form logic for validating
/// email, password, and other form inputs. And other user related events.
class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState());

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final RepositoryCalls _repositoryCalls = get_controller.Get.find();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is LoginEvent) {
      yield* _mapLoginEventToState(event);
    } else if (event is UserDetailsEvent) {
      yield* _mapUserDetailsEventToState(event);
    } else if (event is NewQuizEvent) {
      yield* _mapNewQuizEventToState(event);
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

  /// Map user details event to state
  Stream<UserState> _mapUserDetailsEventToState(UserDetailsEvent event) async* {
    yield state.copyWith(
      status: PageStatus.loading,
      submitType: SubmitType.home,
    );
    if (await Utility.isNetworkAvailable()) {
      try {
        var data = await FirebaseFirestore.instance
            .collection(NetworkConstants.user)
            .doc(FirebaseAuth.instance.currentUser.uid)
            .get();
        var userName = data.get(NetworkConstants.userName).toString();
        var userProfilePic =
            data.get(NetworkConstants.userProfilePic).toString();
        yield state.copyWith(
          status: PageStatus.results,
          userName: userName,
          userProfilePic: userProfilePic,
          submitType: SubmitType.home,
        );
      } catch (exception) {
        yield state.copyWith(
          status: PageStatus.error,
          errorMessage: exception.toString(),
          submitType: SubmitType.home,
        );
      }
    } else {
      yield state.copyWith(
        status: PageStatus.error,
        errorMessage: StringConstants.noInternet,
        submitType: SubmitType.home,
      );
    }
  }

  /// Map new quiz event to state
  Stream<UserState> _mapNewQuizEventToState(NewQuizEvent event) async* {
    yield state.copyWith(
      status: PageStatus.loading,
      submitType: SubmitType.home,
    );
    try {
      var documentId = '';
      var currentQuiz = await FirebaseFirestore.instance
          .collection(NetworkConstants.user)
          .doc(FirebaseAuth.instance.currentUser.uid)
          .collection(NetworkConstants.quiz)
          .where(NetworkConstants.isFinish, isEqualTo: false)
          .get();
      // Check if a quiz is still in progress or not.
      if (currentQuiz.docs.isNotEmpty) {
        var document = currentQuiz.docs.first;
        documentId = document.id;
      } else {
        var data = await _repositoryCalls.search();
        var query = <String, dynamic>{
          NetworkConstants.createdOn: DateTime.now().millisecondsSinceEpoch,
          NetworkConstants.questions: <dynamic>[],
          NetworkConstants.isFinish: false,
          NetworkConstants.completedOn: DateTime.now().millisecondsSinceEpoch,
          NetworkConstants.currentQuestion: 0,
          NetworkConstants.score: 0,
        };
        // Add each question into the map
        for (var question in data.results) {
          query[NetworkConstants.questions] as List<dynamic>
            ..add(<String, dynamic>{
              NetworkConstants.category: question.category,
              NetworkConstants.question: question.question,
              NetworkConstants.options: question.incorrectAnswers
                ..add(question.correctAnswer),
              NetworkConstants.correctAnswer: question.correctAnswer,
              NetworkConstants.isAnswered: false,
              NetworkConstants.userAnswer: '',
            });
        }
        var documentReference = FirebaseFirestore.instance
            .collection(NetworkConstants.user)
            .doc(FirebaseAuth.instance.currentUser.uid)
            .collection(NetworkConstants.quiz)
            .doc();
        await documentReference.set(query);
        documentId = documentReference.id;
      }
      if (documentId.isNotEmpty) {
        yield state.copyWith(
          status: PageStatus.success,
          quizId: documentId,
          submitType: SubmitType.home,
        );
      } else {
        yield state.copyWith(
          status: PageStatus.error,
          errorMessage: StringConstants.quizNotCreated,
          submitType: SubmitType.home,
        );
      }
    } catch (exception) {
      yield state.copyWith(
        status: PageStatus.error,
        errorMessage: exception.toString(),
        submitType: SubmitType.home,
      );
    }
  }
}
