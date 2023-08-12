import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lamp/Helpers/NavigatorHelper.dart';
import 'package:lamp/Screens/auth/forgotPassword.dart';
import 'package:lamp/Screens/welcomeScreen.dart';
import 'package:lamp/Widgets/My_Button.dart';

import '../../Widgets/MyTextFormFiled.dart';
import '../../Widgets/socialMediaIcons.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with NavigatorHelper {
  AppLocalizations get appLocale => AppLocalizations.of(context)!;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  final _key = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 43.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 121.h),
            Center(child: SvgPicture.asset('assets/images/coloredLogo.svg')),
            SizedBox(height: 32.h),
            Text(
              appLocale.loginToYourAccount,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(color: Colors.black),
            ),
            SizedBox(height: 38.h),
            Form(
              key: _key,
              child: Column(
                children: [
                  MyTextFormField(
                    controller: _emailController,
                    hint: appLocale.email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return 'Please Enter a valid Email address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.h),
                  MyTextFormField(
                    controller: _passwordController,
                    hint: appLocale.password,
                    isObscure: true,
                    validator: (value) {
                      if (value!.length < 6 || value.isEmpty) {
                        return appLocale.thePasswordIsWrong;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.h),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: GestureDetector(
                      onTap: () {
                        jump(context, const forgotPassword());
                      },
                      child: Text(
                        appLocale.forgotPassword,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  My_Button(
                    onTap: () {
                      if (_key.currentState!.validate()) {
                        jump(context,
                            const welcomeScreen(isWelcomeScreen: false));
                      }
                    },
                    buttonText: appLocale.login.toUpperCase(),
                    textStyle: Theme.of(context).textTheme.displaySmall,
                  ),
                  SizedBox(height: 30.h),
                  Text(appLocale.or.toUpperCase()),
                  SizedBox(height: 20.h),
                  const socialMediaIcons(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
