import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lamp/Helpers/NavigatorHelper.dart';
import 'package:lamp/Widgets/MyTextFormFiled.dart';
import 'package:lamp/Widgets/My_Button.dart';
import 'package:lamp/Widgets/socialMediaIcons.dart';

import '../welcomeScreen.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> with NavigatorHelper {
  AppLocalizations get appLocale => AppLocalizations.of(context)!;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _idController;
  late TextEditingController _fullNameController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _idController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  bool? isMale;
  final _key = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    _idController.dispose();
  }

  String _genderError = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 43.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 92.h),
              Text(
                appLocale.createAccount,
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
                      controller: _fullNameController,
                      hint: appLocale.fullName,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a valid name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10.h),
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
                      controller: _phoneController,
                      hint: appLocale.phone,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty || value.length < 10) {
                          return 'Please enter a valid phone number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10.h),
                    MyTextFormField(
                      controller: _idController,
                      hint: appLocale.idNumber,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty || value.length < 9) {
                          return 'Please enter a valid ID card number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10.h),
                    MyTextFormField(
                      controller: _passwordController,
                      hint: appLocale.password,
                      isObscure: true,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (_passwordController.text.isEmpty ||
                            value!.length < 6 ||
                            _passwordController.text !=
                                _confirmPasswordController.text) {
                          return 'Please enter a valid password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10.h),
                    MyTextFormField(
                      controller: _confirmPasswordController,
                      isObscure: true,
                      hint: appLocale.confirmPassword,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (_confirmPasswordController.text.isEmpty ||
                            value!.length < 6 ||
                            _passwordController.text !=
                                _confirmPasswordController.text) {
                          return 'Please enter a valid password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: true,
                    groupValue: isMale,
                    onChanged: (value) => setState(() => isMale = value!),
                  ),
                  SvgPicture.asset('assets/images/male.svg'),
                  SizedBox(width: 4.w),
                  Text(
                    appLocale.male,
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  Radio(
                    value: false,
                    groupValue: isMale,
                    onChanged: (value) => setState(() => isMale = value!),
                  ),
                  SvgPicture.asset('assets/images/female.svg'),
                  SizedBox(width: 4.w),
                  Text(
                    appLocale.female,
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  _genderError,
                  style: TextStyle(color: Colors.red),
                ),
              ),
              SizedBox(height: 25.h),
              My_Button(
                onTap: () {
                  if (_key.currentState!.validate() && isMale != null) {
                    setState(() {
                      _genderError = '';
                    });
                    jump(context, const welcomeScreen(isWelcomeScreen: false));
                  }
                  if (isMale == null) {
                    setState(() {
                      _genderError = 'Please choose a gender';
                    });
                  }
                },
                buttonText: appLocale.signup.toUpperCase(),
                textStyle: Theme.of(context).textTheme.displaySmall,
              ),
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.center,
                child: Text(appLocale.or.toUpperCase()),
              ),
              SizedBox(height: 20.h),
              const socialMediaIcons(),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
