import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

/// A history button on the search screen to show the last searched items.
class HistoryButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FloatingActionButton(
        onPressed: () {
          Utility.openHistoryPage();
        },
        backgroundColor: ColorsValue.primaryColor,
        child: const Icon(
          Icons.history,
        ),
      );
}
