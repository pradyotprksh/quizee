import 'package:core/core.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:quizee/src/views/ui/quiz/widget/widget.dart';
import 'package:shared/shared.dart';

/// A quiz screen where the user will select the answers for the question.
class QuizScreen extends StatelessWidget {
  static const String routeName = 'quiz';

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Get.theme.primaryColor,
        body: DoubleBackToCloseApp(
          snackBar: SnackBar(
            backgroundColor: Colors.deepOrange,
            margin: Dimens.padding5,
            behavior: SnackBarBehavior.floating,
            content: Text(
              StringConstants.pressBackAgain,
              style: Styles.white16,
            ),
          ),
          child: GetBuilder<CommonInterface>(
            dispose: (state) {
              Get.find<CommonInterface>().updateAnswer('');
            },
            builder: (_interface) => BlocConsumer<UserBloc, UserState>(
              listenWhen: (previousState, state) =>
                  state.submitType == SubmitType.quiz,
              buildWhen: (previousState, state) =>
                  state.submitType == SubmitType.quiz,
              listener: (_, state) {
                if (state.status == PageStatus.error) {
                  Utility.closeDialog();
                  Utility.showError(state.errorMessage);
                } else if (state.status == PageStatus.success) {
                  Utility.closeDialog();
                } else if (state.status == PageStatus.loading) {
                  Utility.showLoadingDialog();
                }
              },
              builder: (_, state) => QuizBody(),
            ),
          ),
        ),
      );
}
