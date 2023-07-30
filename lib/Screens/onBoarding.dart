import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lamp/Helpers/NavigatorHelper.dart';
import 'package:lamp/Screens/welcomeScreen.dart';
import 'package:lamp/Widgets/My_Button.dart';

class onBoarding extends StatefulWidget {
  const onBoarding({super.key});

  @override
  State<onBoarding> createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> with NavigatorHelper {
  AppLocalizations get appLocale => AppLocalizations.of(context)!;

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: TextButton(
              onPressed: () =>
                  jump(context, const welcomeScreen(), replace: true),
              child: Text(
                'Skip',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ),
        ],
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/boarding$index.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.symmetric(horizontal: 39.w, vertical: 59.h),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200.withOpacity(0.35),
            ),
            padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 55.h),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 10.0, sigmaY: 10.0, tileMode: TileMode.repeated),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(appLocale.manyOptions,
                      style: Theme.of(context).textTheme.displayMedium),
                  SizedBox(height: 28.h),
                  Text(
                    appLocale.weProvide,
                    style: Theme.of(context).textTheme.labelSmall,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 45.h),
                  SizedBox(
                    height: 10.h,
                    child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, _) {
                          return _ == index
                              ? Container(
                                  width: 42.w,
                                  height: 10.h,
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                )
                              : CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 10.h,
                                );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 15.w);
                        },
                        itemCount: 3),
                  ),
                  SizedBox(height: 20.h),
                  My_Button(
                    buttonText: appLocale.next.toUpperCase(),
                    buttonRadius: 24.r,
                    textStyle: Theme.of(context).textTheme.displaySmall,
                    onTap: () {
                      if (index != 2) {
                        setState(() {
                          index++;
                        });
                      }else{
                        jump(context, const welcomeScreen(),replace: true);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
