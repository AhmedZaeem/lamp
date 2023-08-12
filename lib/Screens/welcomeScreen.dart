import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lamp/Helpers/NavigatorHelper.dart';
import 'package:lamp/Screens/Home.dart';
import 'package:lamp/Screens/auth/Login.dart';
import 'package:lamp/Widgets/My_Button.dart';

import 'auth/Signup.dart';

class welcomeScreen extends StatefulWidget {
  final bool isWelcomeScreen;
  const welcomeScreen({super.key, this.isWelcomeScreen = true});

  @override
  State<welcomeScreen> createState() => _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen> with NavigatorHelper {
  AppLocalizations get appLocale => AppLocalizations.of(context)!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 43.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60.h),
              Text(appLocale.welcome,
                  style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: 26.h),
              SvgPicture.asset('assets/images/coloredLogo.svg'),
              SizedBox(height: 92.h),
              My_Button(
                buttonText: widget.isWelcomeScreen
                    ? appLocale.login.toUpperCase()
                    : appLocale.buyer.toUpperCase(),
                onTap: widget.isWelcomeScreen
                    ? () => jump(context, const Login())
                    : () => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                        (route) => false),
                textStyle: Theme.of(context).textTheme.displaySmall,
              ),
              SizedBox(height: 10.h),
              My_Button(
                buttonText: widget.isWelcomeScreen
                    ? appLocale.signup.toUpperCase()
                    : appLocale.seller.toUpperCase(),
                onTap: widget.isWelcomeScreen
                    ? () => jump(context, const Signup())
                    : () => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Home(isBuyer: false)),
                        (route) => false),
                buttonColor: Colors.white,
                textStyle: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(color: Colors.black),
                btnBoarder: Border.all(
                    color: Theme.of(context).colorScheme.primary, width: 1.w),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
