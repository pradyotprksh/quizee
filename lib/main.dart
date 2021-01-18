import 'package:core/core.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:quizee/src/views/views.dart';
import 'package:shared/shared.dart';

/// Main entry of the application
void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    Bloc.observer = BlocObservers();
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    Utility.createInitialDi();
    Get.put(LocalRepository());
    await Get.find<LocalRepository>().init();
    runApp(MyApp());
  } catch (error) {
    Utility.printELog(error.toString());
  }
}

/// A class to create the initial structure of the
/// application and adds routes in the application
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    var localLang =
        Get.find<LocalRepository>().getStringValue(LocalKeys.localLang);

    var analytics = FirebaseAnalytics();

    return DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) {
        if (brightness == Brightness.light) return Styles.lightTheme;
        return Styles.darkTheme;
      },
      themedWidgetBuilder: (_, currentTheme) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => Get.find<UserBloc>()),
        ],
        child: GetMaterialApp(
          title: StringConstants.appName,
          navigatorObservers: [
            FirebaseAnalyticsObserver(analytics: analytics),
          ],
          debugShowCheckedModeBanner: false,
          theme: currentTheme,
          translations: TranslationsFile(),
          locale: Locale(
            localLang,
          ),
          textDirection: Utility.isDirectionRTL(localLang),
          fallbackLocale: const Locale(
            NetworkConstants.defaultLang,
          ),
          unknownRoute: Pages.unknownRoute,
          initialBinding: InitialBindings(),
          initialRoute: Pages.initialRoute,
          getPages: Pages.listOfPages,
        ),
      ),
    );
  }
}
