import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizee/src/views/ui/history/widget/widget.dart';
import 'package:shared/shared.dart';

/// A history screen to show all the past games played by the user.
class HistoryScreen extends StatelessWidget {
  static const String routeName = 'history';

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Get.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          leading: const CloseButton(
            color: Colors.black,
          ),
          title: Text(
            StringConstants.history,
            style: Styles.black18,
          ),
          centerTitle: true,
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection(NetworkConstants.user)
              .doc(FirebaseAuth.instance.currentUser.uid)
              .collection(NetworkConstants.quiz)
              .where(NetworkConstants.isFinish, isEqualTo: true)
              .orderBy(NetworkConstants.completedOn, descending: true)
              .snapshots(),
          builder: (_, AsyncSnapshot<QuerySnapshot> quizSnapshot) {
            if (quizSnapshot.connectionState == ConnectionState.waiting) {
              return CenterProgressIndicator();
            } else if (!quizSnapshot.hasData) {
              return Center(
                child: Icon(
                  Icons.hourglass_empty,
                  size: Dimens.eighty,
                  color: Get.theme.primaryColor,
                ),
              );
            } else {
              var snapshot = quizSnapshot.data.docs;
              return HistoryList(snapshot);
            }
          },
        ),
      );
}
