import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Screens/Splash.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final SystemUiOverlayStyle _style =
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(_style);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: const [Locale('en')],
          locale: const Locale('en'),
          theme: ThemeData(
            brightness: Brightness.light,
            fontFamily: 'Roboto',
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: const Color(0xff3A58F5),
                ),
            textTheme: TextTheme(
              headlineLarge: TextStyle(
                fontSize: 47.sp,
                color: Colors.white,
              ),
            ),
          ),
          title: 'Lamp',
          home: const Splash(),
        );
      },
    );
  }
}
