import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

/// List for history list
///
/// [snapshot] : takes the document for firestore
class HistoryList extends StatelessWidget {
  HistoryList(this.snapshot);

  final List<QueryDocumentSnapshot> snapshot;

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: snapshot.length,
        itemBuilder: (_, position) {
          var singleQuizDetails = snapshot[position];
          var quizDetails = singleQuizDetails.data();
          var completedOn = quizDetails[NetworkConstants.completedOn] as int;
          var score = quizDetails[NetworkConstants.score] as int;
          return _getSingleList(completedOn, score);
        },
      );

  Widget _getSingleList(int completedOn, int score) => Card(
        child: Padding(
          padding: Dimens.padding15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '${StringConstants.completedOn} ${Utility.formatDate(DateTime.fromMillisecondsSinceEpoch(completedOn))}',
                style: Styles.black12,
              ),
              Dimens.boxHeight15,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    StringConstants.yourScore,
                    textAlign: TextAlign.center,
                    style: Styles.black18,
                  ),
                  Text(
                    '$score / 10',
                    style: Styles.boldAppColor80,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
