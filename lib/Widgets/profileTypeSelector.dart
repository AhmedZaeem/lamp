import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lamp/Helpers/NavigatorHelper.dart';
import 'package:lamp/Screens/Home.dart';

import 'My_Button.dart';

class ProfileTypeSelector extends StatelessWidget with NavigatorHelper {
  final Function()? cancelButtonOnTap;
  final bool isSeller;
  const ProfileTypeSelector(
      {super.key, this.cancelButtonOnTap, this.isSeller = false});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocale = AppLocalizations.of(context)!;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
        ),
        child: Center(
          child: Container(
            width: 246.w,
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 24.h),
            decoration: BoxDecoration(
              color: const Color(0xffD3D3D3),
              borderRadius: BorderRadius.circular(27.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                My_Button(
                  buttonText: appLocale.buyer.toUpperCase(),
                  buttonColor:
                      isSeller ? const Color(0xff40443E) : Colors.white,
                  textColor: isSeller ? Colors.white : Colors.black,
                  onTap: isSeller
                      ? () {
                          jump(context, const Home(), replace: true);
                        }
                      : cancelButtonOnTap,
                ),
                SizedBox(height: 12.h),
                My_Button(
                  buttonText: appLocale.seller.toUpperCase(),
                  buttonColor:
                      isSeller ? Colors.white : const Color(0xff40443E),
                  textColor: isSeller ? Colors.black : Colors.white,
                  onTap: isSeller
                      ? cancelButtonOnTap
                      : () {
                          jump(context, const Home(isBuyer: false),
                              replace: true);
                        },
                ),
                SizedBox(height: 36.h),
                My_Button(
                  buttonText: appLocale.cancel.toUpperCase(),
                  buttonColor: Colors.red,
                  onTap: cancelButtonOnTap,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
