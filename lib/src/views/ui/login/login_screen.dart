import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared/shared.dart';

/// A screen which will help the user to login into the application. And use
/// it as an authenticated user.
class LoginScreen extends StatelessWidget {
  static const String routeName = 'login';

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Get.theme.backgroundColor,
        body: Stack(
          children: <Widget>[
            SizedBox.expand(
              child: Image.asset(
                AssetsConstants.backgroundImage,
                fit: BoxFit.cover,
              ),
            ),
            Column(
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
            ),
            Align(
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
                  onPressed: () {},
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
            ),
          ],
        ),
      );
}
