import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  AppLocalizations get appLocale => AppLocalizations.of(context)!;
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    SizedBox(height: 8.h),
                    Row(
                      children: <Widget>[
                        Container(
                          width: 39.w,
                          height: 39.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/images/profile.png'),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'Aseel Mohamed Khader',
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 7.h),
                          decoration: BoxDecoration(
                            color: const Color(0xff6179F7),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Text(
                            appLocale.post,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 28.h),
                    TextField(
                      controller: _controller,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Write your ads.....',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            PositionedDirectional(
              bottom: 0,
              child: Container(
                width: 380.w,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30.r)),
                  border: Border.all(
                      color: Colors.grey.withOpacity(.2), width: 1.w),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 40.h),
                    actionButtons(image: 'photo', text: appLocale.addPhoto),
                    SizedBox(height: 30.h),
                    actionButtons(image: 'video', text: appLocale.addVideo),
                    SizedBox(height: 30.h),
                    actionButtons(
                        image: 'location', text: appLocale.addLocation),
                    SizedBox(height: 172.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class actionButtons extends StatelessWidget {
  const actionButtons(
      {super.key, required this.text, required this.image, this.onTap});
  final String text;
  final String image;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: <Widget>[
          Image.asset(
            'assets/images/$image.png',
            height: 30.h,
            width: 30.h,
          ),
          SizedBox(width: 10.w),
          Text(text),
        ],
      ),
    );
  }
}
