import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared/shared.dart';

/// The main home screen which will be shown for the authenticated users.
class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Get.theme.backgroundColor,
        body: GetBuilder<CommonInterface>(
          initState: (state) {
            Get.find<CommonInterface>().getUserDetails();
          },
          builder: (_interface) => BlocConsumer<UserBloc, UserState>(
            listener: (_, state) {
              if (state.status == PageStatus.error) {
                Utility.showError(state.errorMessage);
              } else if (state.status == PageStatus.success) {
                print('Quiz id: ${state.quizId}');
              }
            },
            builder: (_, state) => Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Dimens.boxHeight50,
                    _getUserProfileImage(state),
                    Dimens.boxHeight16,
                    _getUserName(state),
                    const Spacer(),
                    Center(
                      child: Lottie.asset(
                        AssetsConstants.walkingAnimation,
                        repeat: true,
                      ),
                    ),
                    const Spacer(),
                    _getPlayButton(_interface, state),
                    Dimens.boxHeight50,
                  ],
                ),
                if (state.status == PageStatus.loading)
                  CenterProgressIndicator(),
              ],
            ),
          ),
        ),
      );

  Widget _getUserProfileImage(UserState state) => SizedBox(
        height: Dimens.hundred,
        width: Dimens.hundred,
        child: ClipOval(
          child: FadeInImage(
            image: NetworkImage(
              state.userProfilePic,
            ),
            placeholder: const AssetImage(
              AssetsConstants.defaultProfileImage,
            ),
          ),
        ),
      );

  Widget _getUserName(UserState state) => Text(
        '${StringConstants.welcome}, ${state.userName}',
        style: Styles.boldBlack26,
        textAlign: TextAlign.center,
      );

  Widget _getPlayButton(CommonInterface interface, UserState state) =>
      IconButton(
        iconSize: Dimens.hundred,
        tooltip: StringConstants.startQuiz,
        splashColor: ColorsValue.primaryColor,
        icon: const Icon(
          Icons.play_circle_fill,
          color: ColorsValue.primaryColor,
        ),
        onPressed: (state.status == PageStatus.loading)
            ? null
            : () {
                interface.startQuiz();
              },
      );
}
