import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lamp/Helpers/NavigatorHelper.dart';
import 'package:lamp/Screens/EditField.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> with NavigatorHelper {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 260.h,
              child: Stack(
                children: [
                  Container(
                    height: 201.h,
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.symmetric(vertical: 40.h),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(50.r)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                                size: 32.h,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                          Text('Edit Profile',
                              style: Theme.of(context).textTheme.bodyLarge),
                          const IconButton(
                              onPressed: null,
                              icon: Icon(Icons.ac_unit,
                                  color: Colors.transparent))
                        ],
                      ),
                    ),
                  ),
                  PositionedDirectional(
                    bottom: 0,
                    start: 117.w,
                    child: Container(
                      width: 135.h,
                      height: 135.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                            width: 1.w),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/profile.png'),
                        ),
                      ),
                    ),
                  ),
                  PositionedDirectional(
                    top: 215.h,
                    start: 215.w,
                    child: GestureDetector(
                      onTap: () {
                        ///TODO : Add image picker here
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'First name',
                    style: textStyle(),
                  ),
                  SizedBox(height: 8.h),
                  MyProfileField(
                    hint: 'John',
                    onTap: () {
                      jump(context, const EditFiled(index: 0));
                    },
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Last name',
                    style: textStyle(),
                  ),
                  SizedBox(height: 8.h),
                  MyProfileField(
                    hint: 'Pham',
                    onTap: () {
                      jump(context, const EditFiled(index: 1));
                    },
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Phone number',
                    style: textStyle(),
                  ),
                  SizedBox(height: 8.h),
                  MyProfileField(
                    hint: '0591321564894',
                    onTap: () {
                      jump(context, const EditFiled(index: 2));
                    },
                    leading: Text('Verified',
                        style: TextStyle(
                          color: const Color(0xffFECC2A),
                          fontSize: 12.sp,
                        )),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Email',
                    style: textStyle(),
                  ),
                  SizedBox(height: 8.h),
                  MyProfileField(
                    hint: 'joam789@gmail.com',
                    onTap: () {
                      jump(context, const EditFiled(index: 3));
                    },
                    leading: Text('Unverified',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12.sp,
                        )),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Password',
                    style: textStyle(),
                  ),
                  SizedBox(height: 8.h),
                  MyProfileField(
                    hint: '..........',
                    onTap: () {
                      jump(context, const EditFiled(index: 4));
                    },
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  TextStyle textStyle() => TextStyle(fontSize: 14.sp, color: Colors.grey);
}

class MyProfileField extends StatelessWidget {
  const MyProfileField({
    super.key,
    this.onTap,
    this.hint,
    this.leading,
  });
  final Function()? onTap;
  final String? hint;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: const Color(0xffF3F3F3),
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Row(
          children: <Widget>[
            Text(
              hint ?? '',
              style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade800),
            ),
            const Spacer(),
            leading ?? const SizedBox.shrink(),
            SizedBox(width: 14.w),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
