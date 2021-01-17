import 'package:WikiSearch/src/views/views.dart';
import 'package:core/core.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared/shared.dart';

/// Main entry of the application
void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = BlocObservers();
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
    var localLang =
    Get.find<LocalRepository>().getStringValue(LocalKeys.localLang);

    return DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) {
        if (brightness == Brightness.light) return Styles.lightTheme;
        return Styles.darkTheme;
      },
      themedWidgetBuilder: (_, currentTheme) => GetMaterialApp(
        title: StringConstants.appName,
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
        onUnknownRoute: (_) =>
            MaterialPageRoute<dynamic>(builder: (_) => PageNotFoundScreen()),
        initialBinding: InitialBindings(),
        home: SplashScreen(),
      ),
    );
  }
}
