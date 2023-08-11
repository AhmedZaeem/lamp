import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class socialMediaIcons extends StatelessWidget {
  const socialMediaIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset('assets/images/twitter.png', height: 30.h, width: 30.h),
        SizedBox(width: 15.w),
        Image.asset('assets/images/facebook.png', height: 30.h, width: 30.h),
        SizedBox(width: 15.w),
        Image.asset('assets/images/google.png', height: 30.h, width: 30.h),
      ],
    );
  }
}
