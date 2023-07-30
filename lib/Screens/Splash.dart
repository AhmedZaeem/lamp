import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lamp/Screens/onBoarding.dart';

import '../Helpers/NavigatorHelper.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with NavigatorHelper {
  AppLocalizations get appLocale => AppLocalizations.of(context)!;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3),
        () => jump(context, const onBoarding(), replace: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/mainIcon.svg'),
            SizedBox(height: 10.h),
            Text(
              appLocale.lamp,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
    );
  }
}
