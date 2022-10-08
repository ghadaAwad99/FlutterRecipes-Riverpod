import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_app/di/service_locator.dart';
import 'package:recipes_app/presentation/home/home_screen.dart';
import 'package:recipes_app/utils/app_localization.dart';
import 'package:recipes_app/utils/constants.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:recipes_app/utils/navigation/navigation_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  ServiceLocator.init();
  runApp(
    ProviderScope(
      child: EasyLocalization(
          path: 'assets/translations',
          supportedLocales: localeList,
          fallbackLocale: englishLocale,
          child: const MyApp()
      ),
    )

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Recipes App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomeScreen.tag,
      onGenerateRoute: getApplicationRoute,
      navigatorKey: navigationKey,
    );
  }
}
