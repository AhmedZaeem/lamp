import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lamp/Helpers/NavigatorHelper.dart';
import 'package:lamp/Screens/EditProfile.dart';
import 'package:lamp/Screens/TermsAndCondtions.dart';
import 'package:lamp/Widgets/My_Button.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> with NavigatorHelper {
  AppLocalizations get appLocale => AppLocalizations.of(context)!;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                child: Text(appLocale.myAccount,
                    style: Theme.of(context).textTheme.bodyLarge),
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
              )
            ],
          ),
        ),
        SizedBox(height: 8.h),
        Text('Mohamed khader',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.black)),
        SizedBox(height: 28.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 95.w),
          child: Material(
            elevation: 5.h,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(95.r),
                borderSide: BorderSide.none),
            color: Colors.black,
            child: My_Button(
              buttonText: appLocale.editProfile,
              buttonRadius: 26,
              onTap: () {
                jump(context, const EditProfile());
              },
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
              ),
            ),
          ),
        ),
        SizedBox(height: 50.h),
        ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 46.w),
          shrinkWrap: true,
          children: [
            MyListTile(
              title: appLocale.basket,
              icon: 'cart',
              onTap: () {},
            ),
            SizedBox(height: 20.h),
            MyListTile(
              title: appLocale.information,
              icon: 'info',
              onTap: () {
                jump(context, const TermsAndConditions());
              },
            ),
            SizedBox(height: 20.h),
            MyListTile(
              title: appLocale.logOut,
              icon: 'logout',
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}

class MyListTile extends StatelessWidget {
  const MyListTile({
    super.key,
    this.onTap,
    required this.title,
    required this.icon,
  });

  final String title;
  final Function()? onTap;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.16),
              spreadRadius: 4,
              blurRadius: 8,
              offset: const Offset(0, 3),
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            SvgPicture.asset('assets/images/$icon.svg'),
            SizedBox(width: 16.w),
            Text(title),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
            ),
          ],
        ),
      ),
    );
  }
}
