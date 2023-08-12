import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lamp/Screens/Home.dart';
import 'package:lamp/Widgets/MyTextFormFiled.dart';
import 'package:lamp/Widgets/My_Button.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  AppLocalizations get appLocale => AppLocalizations.of(context)!;
  final _key = GlobalKey<FormState>();
  late TextEditingController _passwordCont;
  late TextEditingController _confirmPasswordCont;
  @override
  void initState() {
    super.initState();
    _passwordCont = TextEditingController();
    _confirmPasswordCont = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _passwordCont.dispose();
    _confirmPasswordCont.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60.h),
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 32.h,
                    ),
                    onPressed: () => Navigator.pop(context)),
                SizedBox(width: 60.w),
                Text(
                  appLocale.newPassword,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Form(
              key: _key,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(appLocale.enterNewPassword,
                          style: Theme.of(context).textTheme.labelMedium),
                    ),
                    PasswordTextFormField(
                        passwordCont: _passwordCont,
                        appLocale: appLocale,
                        confirmPasswordCont: _confirmPasswordCont),
                    SizedBox(height: 10.h),
                    FormText(appLocale: appLocale),
                    PasswordTextFormField(
                        passwordCont: _confirmPasswordCont,
                        appLocale: appLocale,
                        confirmPasswordCont: _passwordCont),
                    SizedBox(height: 28.h),
                    My_Button(
                        onTap: () {
                          if (_key.currentState!.validate()) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Home()),
                                (route) => false);
                          }
                        },
                        buttonText: appLocale.complete,
                        textStyle: const TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PasswordTextFormField extends StatelessWidget {
  const PasswordTextFormField({
    super.key,
    required TextEditingController passwordCont,
    required this.appLocale,
    required TextEditingController confirmPasswordCont,
  })  : _passwordCont = passwordCont,
        _confirmPasswordCont = confirmPasswordCont;

  final TextEditingController _passwordCont;
  final AppLocalizations appLocale;
  final TextEditingController _confirmPasswordCont;

  @override
  Widget build(BuildContext context) {
    return MyTextFormField(
      controller: _passwordCont,
      hint: appLocale.symbolsAtLeast,
      keyboardType: TextInputType.visiblePassword,
      isObscure: true,
      validator: (value) {
        if (value!.isEmpty ||
            _confirmPasswordCont.text != _passwordCont.text ||
            value.length < 8) {
          return 'Please Enter a valid Password';
        }
        return null;
      },
    );
  }
}

class FormText extends StatelessWidget {
  const FormText({
    super.key,
    required this.appLocale,
  });

  final AppLocalizations appLocale;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Text(appLocale.confirmPassword,
          style: Theme.of(context).textTheme.labelMedium),
    );
  }
}
