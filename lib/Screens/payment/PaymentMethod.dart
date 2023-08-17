import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lamp/Helpers/NavigatorHelper.dart';
import 'package:lamp/Widgets/My_Button.dart';

import '../../Modles/PaymentMethodModel.dart';
import 'AddCreditcard.dart';
import 'PaymentConfirmation.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> with NavigatorHelper {
  AppLocalizations get appLocale => AppLocalizations.of(context)!;
  int selectedPaymentMethod = -1;

  @override
  Widget build(BuildContext context) {
    List<paymentMethodModel> paymentMethods = [
      paymentMethodModel(
        image: 'credit',
        title: '**** **** **** 5967',
        subTitle: 'Expires 09/25',
      ),
      paymentMethodModel(
        image: 'visa',
        title: '**** **** **** 7539',
        subTitle: 'Expires 10/27',
      ),
      paymentMethodModel(
        image: 'paypal',
        title: 'freeslab88@gmail.com',
      ),
      paymentMethodModel(
        image: 'paycash',
        title: 'Cash',
      ),
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.only(top: 50.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 32.h,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                GestureDetector(
                  onTap: () {
                    jump(context, const AddCreditCard());
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.add,
                        color: Theme.of(context).colorScheme.primary,
                        size: 32.h,
                      ),
                      Text(
                        'Add',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Text(
              appLocale.payment,
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10.h),
            Text(appLocale.paymentDescription,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: const Color(0xff8F9BB3),
                )),
            SizedBox(height: 34.h),
            Text(appLocale.paymentMethods,
                style: TextStyle(
                  fontSize: 16.sp,
                )),
            SizedBox(height: 10.h),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                bool isSelected = index == selectedPaymentMethod;
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedPaymentMethod = index;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22.r),
                      boxShadow: isSelected
                          ? []
                          : [
                              BoxShadow(
                                color: Colors.black.withOpacity(.4),
                                blurRadius: 2.h,
                                spreadRadius: 4.h,
                                blurStyle: BlurStyle.outer,
                              )
                            ],
                      border: isSelected
                          ? Border.all(
                              color: Theme.of(context).colorScheme.primary,
                              width: 1.w)
                          : null,
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                            'assets/images/${paymentMethods[index].image}.svg'),
                        SizedBox(width: 16.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              paymentMethods[index].title,
                              style: TextStyle(fontSize: 18.sp),
                            ),
                            paymentMethods[index].subTitle != null
                                ? Text(
                                    paymentMethods[index].subTitle!,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 15.sp),
                                  )
                                : const SizedBox.shrink(),
                          ],
                        ),
                        const Spacer(),
                        isSelected
                            ? Checkbox(
                                value: true,
                                onChanged: (value) {},
                                activeColor:
                                    Theme.of(context).colorScheme.primary,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.r)),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 16.h);
              },
              itemCount: paymentMethods.length,
            ),
            SizedBox(height: 100.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 90.w),
              child: My_Button(
                buttonText: appLocale.done.toUpperCase(),
                onTap: () {
                  jump(context, const PaymentConfirmation());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
