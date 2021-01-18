import 'package:quizee/src/views/views.dart';
import 'package:get/get.dart';

/// Contains the list of pages or routes taken across the whole application.
/// This will prevent us in using context for navigation. And also providing
/// the blocs required in the next named routes.
///
/// [listOfPages] : will contain all the pages in the application as a route
///                 and will be used in the material app.
abstract class Pages {
  static var transitionDuration = const Duration(
    milliseconds: 550,
  );

  static var initialRoute = SplashScreen.routeName;

  static var listOfPages = [
    splashScreen,
    unknownRoute,
    homeRoute,
    loginRoute,
  ];

  static var splashScreen = GetPage(
    name: SplashScreen.routeName,
    page: () => SplashScreen(),
    transitionDuration: transitionDuration,
    transition: Transition.downToUp,
  );

  static var unknownRoute = GetPage(
    name: PageNotFoundScreen.routeName,
    transitionDuration: transitionDuration,
    transition: Transition.downToUp,
    page: () => PageNotFoundScreen(),
  );

  static var homeRoute = GetPage(
    name: HomeScreen.routeName,
    transitionDuration: transitionDuration,
    transition: Transition.downToUp,
    page: () => HomeScreen(),
  );

  static var loginRoute = GetPage(
    name: LoginScreen.routeName,
    transitionDuration: transitionDuration,
    transition: Transition.downToUp,
    page: () => LoginScreen(),
  );
}
