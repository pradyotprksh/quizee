import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared/shared.dart';

/// The main quiz body which will show the details of the quiz.
///
/// [quizId] : takes the quiz id
class QuizBody extends StatelessWidget {
  QuizBody(this.quizId);

  final String quizId;

  @override
  Widget build(BuildContext context) => StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection(NetworkConstants.user)
            .doc(FirebaseAuth.instance.currentUser.uid)
            .collection(NetworkConstants.quiz)
            .doc(quizId)
            .snapshots(),
        builder: (_, quizSnapshot) {
          if (quizSnapshot.connectionState == ConnectionState.waiting) {
            return CenterProgressIndicator();
          } else {
            var quizDetails = quizSnapshot.data.data() as Map<String, dynamic>;
            var questions =
            quizDetails[NetworkConstants.questions] as List<dynamic>;
            var currentQuestion =
            quizDetails[NetworkConstants.currentQuestion] as int;
            var details = questions[currentQuestion] as Map<String, dynamic>;
            var questionValue = details[NetworkConstants.question] as String;
            var options = details[NetworkConstants.options] as List<dynamic>
              ..shuffle();
            return Padding(
              padding: Dimens.padding15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Dimens.boxHeight50,
                  _getProgressbar(currentQuestion),
                  const Spacer(),
                  _getQuestion(questionValue),
                  const Spacer(),
                  _getOptionsRow(options, true),
                  Dimens.boxHeight15,
                  _getOptionsRow(options, false),
                ],
              ),
            );
          }
        },
      );

  Widget _getOption(String value) => Expanded(
    child: SizedBox(
      height: double.infinity,
      child: Card(
        color: Colors.white,
        child: InkWell(
          onTap: () {
            Get.find<CommonInterface>().updateAnswer(value, quizId);
              },
          child: Center(
                child: Padding(
                  padding: Dimens.padding5,
                  child: Text(
                    Utility.getUnicodeRemoveString(value),
                    textAlign: TextAlign.center,
                    style: Styles.black18,
                  ),
                ),
              ),
        ),
      ),
    ),
  );

  Widget _getOptionsRow(List<dynamic> options, bool isFirst) => Expanded(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _getOption(options[isFirst ? 0 : 2] as String),
        Dimens.boxWidth15,
        _getOption(options[isFirst ? 1 : 3] as String),
      ],
    ),
  );

  Widget _getProgressbar(int currentQuestion) => LinearPercentIndicator(
    width: Get.width / 1.2,
    lineHeight: Dimens.fifteen,
    percent: currentQuestion / 10,
    backgroundColor: Colors.white,
    progressColor: Colors.purpleAccent,
    alignment: MainAxisAlignment.center,
    center: Text('${currentQuestion + 1} / 10'),
  );

  Widget _getQuestion(String questionValue) => Text(
    Utility.getUnicodeRemoveString(questionValue),
    style: Styles.boldWhite30,
    textAlign: TextAlign.center,
  );
}
