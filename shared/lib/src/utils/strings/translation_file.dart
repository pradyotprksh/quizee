import 'package:get/get.dart';

/// The main translation file which will help
/// in localization of the application
///
/// [keys] : Contains all the language code which will be
/// used in the application
///
/// For more details on how to implement localization
/// can go to [GetX Internationalization](https://pub.dev/packages/get#internationalization)
/// and read there documentation.
class TranslationsFile extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'somethingWentWrong': 'Oops!! Something went wrong.',
          'search': 'Search',
          'pageNotFound': '404!!',
          'okay': 'Okay',
          'history': 'History',
          'emptyText':
              'Wikipedia is a multilingual open-collaborative online encyclopedia created and maintained by a community of volunteer editors using a wiki-based editing system.',
          'noInternet':
              'You are not connected to the internet. Please enable internet to start using the application',
          'signInWithGoogle': 'Sign In With Google',
          'welcome': 'Welcome',
          'startQuiz': 'Start Quiz',
          'quizNotCreated': 'Not able to create quiz',
          'quizDetails':
              'Starts the quiz. If a quiz is already in progress will continue that one instead of creating a new one. You will get 6 seconds for each question. If fail to answer or press back on the current question then that will be marked as unanswered. So play fast.',
        },
      };
}
