import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

/// A progress bar indicator in the center of the screen
class CenterProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            ColorsValue.primaryColor,
          ),
        ),
      );
}
