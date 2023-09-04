import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../Modles/cartItem.dart';
import '../../Widgets/CartViewSelector.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  AppLocalizations get appLocale => AppLocalizations.of(context)!;
  int viewIndex = 0;
  List<cartItemModel> cartItems = List.generate(
      5,
      (index) => cartItemModel(
          item: 'Examination stethoscope',
          price: 110,
          category: 'Medicine',
          payWhenReceive: false,
          dateOfDelivery: DateTime.now()));
  //Change the list depending on the viewIndex that is provided and leave everything as it is
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 60.h),
            Text(
              appLocale.basket,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.black),
            ),
            SizedBox(height: 24.h),
            Row(
              children: <Widget>[
                CartViewSelector(
                  viewIndex: 0,
                  selectedIndex: viewIndex,
                  text: appLocale.current,
                  onTap: () => setState(() => viewIndex = 0),
                ),
                CartViewSelector(
                  viewIndex: 1,
                  selectedIndex: viewIndex,
                  text: appLocale.previous,
                  onTap: () => setState(() => viewIndex = 1),
                ),
              ],
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  DateFormat format = DateFormat("MMMM \ndd.yyyy");
                  var formattedDate =
                      format.format(cartItems[index].dateOfDelivery);
                  return Container(
                    clipBehavior: Clip.antiAlias,
                    height: 152.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.w,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 26.w,
                          height: double.infinity,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        SizedBox(width: 8.w),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 290.w,
                                child: Row(
                                  children: <Widget>[
                                    Text(cartItems[index].item,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.w500)),
                                    const Spacer(),
                                    Text('${cartItems[index].price}\$'),
                                  ],
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                'Barezadld',
                                style: TextStyle(fontSize: 16.sp),
                              ),
                              SizedBox(height: 20.h),
                              SizedBox(
                                width: 290.w,
                                child: Row(
                                  children: <Widget>[
                                    SizedBox(width: 38.w),
                                    CircleAvatar(
                                      backgroundColor:
                                          Theme.of(context).colorScheme.primary,
                                      radius: 5.h,
                                    ),
                                    SizedBox(width: 4.w),
                                    Text(cartItems[index].category,
                                        style: TextStyle(fontSize: 14.sp)),
                                    const Spacer(),
                                    SvgPicture.asset(
                                        cartItems[index].payWhenReceive
                                            ? 'assets/images/cash.svg'
                                            : 'assets/images/creditcard.svg'),
                                    Text(
                                        cartItems[index].payWhenReceive
                                            ? 'Cash'
                                            : 'Credit  / Debit Card',
                                        style: TextStyle(fontSize: 14.sp)),
                                  ],
                                ),
                              ),
                              SizedBox(height: 4.h),
                              SizedBox(
                                width: 290.w,
                                child: Row(
                                  children: <Widget>[
                                    const Spacer(),
                                    SvgPicture.asset('assets/images/dod.svg'),
                                    SizedBox(width: 4.w),
                                    Text(
                                      '$formattedDate',
                                      style: TextStyle(fontSize: 12.sp),
                                    ),
                                    SizedBox(width: 70.w),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 16.h);
                },
                itemCount: cartItems.length),
            SizedBox(height: 128.h),
          ],
        ),
      ),
    );
  }
}
