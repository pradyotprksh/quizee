import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

/// An empty ui widget to show when no result is available.
class EmptyUiWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Padding(
        padding: Dimens.padding15,
        child: Center(
          child: TypewriterAnimatedTextKit(
            speed: const Duration(milliseconds: 100),
            text: [
              StringConstants.emptyText,
            ],
            textStyle: Styles.boldAppColor30,
            textAlign: TextAlign.center,
          ),
        ),
      );
}
