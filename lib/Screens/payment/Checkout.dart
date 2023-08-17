import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lamp/Helpers/NavigatorHelper.dart';
import 'package:lamp/Widgets/My_Button.dart';

import '../../Modles/shopItemModel.dart';
import 'PaymentMethod.dart';
import 'ReciveDatePick.dart';

class Checkout extends StatefulWidget {
  const Checkout(this.item, {super.key});
  final shopItemModel item;
  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> with NavigatorHelper {
  AppLocalizations get appLocale => AppLocalizations.of(context)!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 32.h),
              Padding(
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
                      },
                    ),
                    Text(
                      'Checkout',
                      style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Theme.of(context).colorScheme.primary,
                        size: 32.h,
                      ),
                      onPressed: null,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 128.h),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(55.r),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 44.h),
                        Text(
                          appLocale.placeOfDelivery,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        SizedBox(height: 8.h),
                        Details(
                          hint: appLocale.placeOfDelivery,
                          onTap: () {},
                          icon: 'addLocation',
                        ),
                        SizedBox(height: 32.h),
                        Text(
                          appLocale.receiveDate,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        SizedBox(height: 8.h),
                        Details(
                          hint: appLocale.receiveDate,
                          onTap: () {
                            jump(context, const ReceiveDatePick());
                          },
                          icon: 'recivedate',
                        ),
                        SizedBox(height: 32.h),
                        Row(
                          children: <Widget>[
                            Text(
                              'ID',
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 180.w,
                              child: Details(
                                hint: appLocale.takeAPicture,
                                icon: 'takimage',
                                showArrow: false,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 64.w),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 10.h),
                          decoration: BoxDecoration(
                            color: const Color(0xff6179F7).withOpacity(.5),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset('assets/images/warning.svg'),
                              SizedBox(width: 4.w),
                              Expanded(
                                child: Text(
                                  appLocale.warningBuy,
                                  style: TextStyle(
                                    fontSize: 8.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 88.w),
                            child: My_Button(
                              buttonText: appLocale.next,
                              onTap: () {
                                jump(context, const PaymentMethod());
                              },
                            )),
                        SizedBox(height: 40.h),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          PositionedDirectional(
            top: 50.h,
            start: 70.w,
            child: Image.asset('assets/images/arduinouno.png'),
          ),
        ],
      ),
    );
  }
}

class Details extends StatelessWidget {
  const Details({
    super.key,
    this.onTap,
    required this.hint,
    required this.icon,
    this.showArrow = true,
  });

  final Function()? onTap;
  final String hint;
  final String icon;
  final bool showArrow;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
              width: 1.w, color: Theme.of(context).colorScheme.primary),
        ),
        child: Row(
          children: <Widget>[
            SvgPicture.asset('assets/images/$icon.svg'),
            SizedBox(width: 4.w),
            Text(hint, style: Theme.of(context).textTheme.bodySmall),
            const Spacer(),
            showArrow
                ? Icon(
                    Icons.arrow_forward_ios,
                    size: 24.h,
                    color: Colors.grey.withOpacity(.9),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
