import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared/shared.dart';

/// A quiz screen where the user will select the answers for the question.
class QuizScreen extends StatelessWidget {
  static const String routeName = 'quiz';

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Get.theme.backgroundColor,
        body: GetBuilder<CommonInterface>(
          initState: (state) {
            Get.find<CommonInterface>().getQuizDetails(
                (Get.arguments as Map<String, dynamic>)['quizId'] as String);
          },
          builder: (_interface) => BlocConsumer<UserBloc, UserState>(
            listenWhen: (previousState, state) =>
                state.submitType == SubmitType.quiz,
            buildWhen: (previousState, state) =>
                state.submitType == SubmitType.quiz,
            listener: (_, state) {
              if (state.status == PageStatus.error) {
                Utility.showError(state.errorMessage);
              } else if (state.status == PageStatus.success) {}
            },
            builder: (_, state) => Stack(
              children: [
                if (state.status == PageStatus.loading)
                  CenterProgressIndicator(),
              ],
            ),
          ),
        ),
      );
}
