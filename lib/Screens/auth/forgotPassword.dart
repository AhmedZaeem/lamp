import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lamp/Helpers/NavigatorHelper.dart';
import 'package:lamp/Screens/auth/NewPassword.dart';

import '../../Widgets/My_Button.dart';

class forgotPassword extends StatefulWidget {
  const forgotPassword({super.key});

  @override
  State<forgotPassword> createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> with NavigatorHelper {
  AppLocalizations get appLocale => AppLocalizations.of(context)!;
  bool enabled = false;
  late TextEditingController o1;
  late TextEditingController o2;
  late TextEditingController o3;
  late TextEditingController o4;
  late TextEditingController o5;
  @override
  void dispose() {
    super.dispose();
    o1.dispose();
    o2.dispose();
    o3.dispose();
    o4.dispose();
    o5.dispose();
  }

  int counter = 60;
  late Timer _timer;
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (counter == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            counter--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    o1 = TextEditingController();
    o2 = TextEditingController();
    o3 = TextEditingController();
    o4 = TextEditingController();
    o5 = TextEditingController();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 28.h),
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 32.h,
                    ),
                    onPressed: () => Navigator.pop(context)),
                SizedBox(width: 90.w),
                Text(
                  appLocale.verification,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 25.h),
            Text(
              appLocale.enterVerificationCode,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 18.h),
            SizedBox(
              height: 40.h,
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return _buildOTPField([o1, o2, o3, o4, o5][index]);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 12.w);
                  },
                  itemCount: 5),
            ),
            Center(
              child: Text(
                appLocale.didNotReceiveEmail,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
              ),
            ),
            SizedBox(height: 8.h),
            counter != 0
                ? Center(
                    child: Text.rich(
                      TextSpan(
                        children: <InlineSpan>[
                          TextSpan(
                            text: appLocale.youCanResendCodeIn,
                          ),
                          TextSpan(
                            text: '$counter ',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                          ),
                          TextSpan(
                            text: appLocale.s,
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            counter == 0
                ? Center(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          counter = 60;
                          startTimer();
                        });
                      },
                      child: Text(
                        appLocale.resendOTP,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            SizedBox(height: 12.h),
            My_Button(
              buttonText: appLocale.verify,
              enabled: enabled,
              onTap: () => jump(context, const NewPassword(), replace: true),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOTPField(TextEditingController controller) {
    return Container(
      height: 40.h,
      alignment: Alignment.center,
      width: 40.h,
      decoration: BoxDecoration(
        border: Border.all(
            width: 1.w, color: Theme.of(context).colorScheme.primary),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        onChanged: (value) {
          setState(() {
            if (o1.text.isEmpty ||
                o1.text == '' ||
                o2.text.isEmpty ||
                o2.text == '' ||
                o3.text.isEmpty ||
                o3.text == '' ||
                o4.text.isEmpty ||
                o4.text == '' ||
                o5.text == '' ||
                o5.text.isEmpty) {
              enabled = false;
            } else {
              enabled = true;
            }
          });
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          } else {
            FocusScope.of(context).previousFocus();
            setState(() {
              enabled = false;
            });
          }
        },
        keyboardType: TextInputType.number,
        style: Theme.of(context).textTheme.headlineMedium,
        decoration: const InputDecoration(
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
