import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizee/src/views/views.dart';
import 'package:shared/shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A screen which will help the user to login into the application. And use
/// it as an authenticated user.
class LoginScreen extends StatelessWidget {
  static const String routeName = 'login';

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Get.theme.backgroundColor,
        body: BlocConsumer<UserBloc, UserState>(
          listener: (_, state) {
            if (state.status == PageStatus.error) {
              Utility.showError(state.errorMessage);
            } else if (state.status == PageStatus.success) {
              RouteManagement.goToHome();
            }
          },
          builder: (_, state) => Stack(
            children: <Widget>[
              _getBackgroundImage(),
              _getAppName(),
              _getSignInOption(state),
              if (state.status == PageStatus.loading)
                CenterProgressIndicator(),
            ],
          ),
        ),
      );

  Widget _getBackgroundImage() => SizedBox.expand(
    child: Image.asset(
      AssetsConstants.backgroundImage,
      fit: BoxFit.cover,
    ),
  );

  Widget _getAppName() => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      const Spacer(),
      Text(
        StringConstants.appName,
        textAlign: TextAlign.center,
        style: Styles.boldWhite30,
      ),
      const Spacer(),
    ],
  );

  Widget _getSignInOption(UserState state) => Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding: Dimens.padding50_15_50_30,
      child: RaisedButton(
        color: Colors.blue[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Dimens.twenty,
          ),
        ),
        onPressed: () {
          Get.find<UserBloc>().add(LoginEvent());
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              AssetsConstants.googleIcon,
              height: Dimens.twenty,
              width: Dimens.twenty,
            ),
            Dimens.boxWidth10,
            Text(
              StringConstants.signInWithGoogle,
              style: Styles.black18,
            ),
          ],
        ),
      ),
    ),
  );
}
