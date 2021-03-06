import 'package:get/get.dart';
import 'package:quizee/src/views/views.dart';

/// A chunk of routes taken in the application.
abstract class RouteManagement {
  /// Go to the splash screen.
  static void goToSplash() {
    Get.offNamed<void>(
      SplashScreen.routeName,
    );
  }

  /// Go to login screen.
  static void goToLogin() {
    Get.offNamed<void>(
      LoginScreen.routeName,
    );
  }

  /// Go to the home screen.
  static void goToHome() {
    Get.offNamed<void>(
      HomeScreen.routeName,
    );
  }

  /// Go to the home screen.
  static void goToQuiz(String quizId) {
    Get.toNamed<void>(
      QuizScreen.routeName,
      arguments: <String, dynamic>{
        'quizId': quizId,
      },
    );
  }

  /// Go to the home screen.
  static void goToHistory() {
    Get.toNamed<void>(
      HistoryScreen.routeName,
    );
  }
}
