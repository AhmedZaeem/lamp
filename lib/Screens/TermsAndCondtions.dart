import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        children: [
          SizedBox(height: 32.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              Text('Terms and Conditions',
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
              const IconButton(
                  onPressed: null,
                  icon: Icon(Icons.ac_unit, color: Colors.transparent)),
            ],
          ),
          SizedBox(height: 24.h),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30.r),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 24.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        color: const Color(0xff6179F7),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: const Text(
                        'Last Uptade : 27 / 03 / 2019',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 54.h),
                    const Text(
                        'Vivamus ex felis, ullamcorper ac metus ac, finibus egestas nibh. Donec at mattis lacus. Duis cursus orci a convallis condimentum. Phasellus gravida felis leo.'),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 4.h,
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: Text(
                                'Donec molestie ultricies dolor, nec feugiat tellus laoreet ac praesent eu quam.',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 16.h);
                      },
                      itemCount: 3,
                    ),
                    SizedBox(height: 16.h),
                    const Text(
                        'Vestibulum consequat massa aliquet, porttitor sapien ut, gravida tortor. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'),
                    SizedBox(height: 16.h),
                    const Text(
                        'Vestibulum consequat massa aliquet, porttitor sapien ut, gravida tortor. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'),
                    SizedBox(height: 16.h),
                    const Text(
                        'Vestibulum consequat massa aliquet, porttitor sapien ut, gravida tortor. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'),
                    SizedBox(height: 16.h),
                    const Text(
                        'Vestibulum consequat massa aliquet, porttitor sapien ut, gravida tortor. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
