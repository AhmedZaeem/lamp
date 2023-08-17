import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lamp/Screens/Home.dart';
import 'package:lamp/Widgets/My_Button.dart';

class PaymentConfirmation extends StatefulWidget {
  const PaymentConfirmation({super.key});

  @override
  State<PaymentConfirmation> createState() => _PaymentConfirmationState();
}

class _PaymentConfirmationState extends State<PaymentConfirmation> {
  AppLocalizations get appLocale => AppLocalizations.of(context)!;
  bool isDone = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            margin: EdgeInsets.only(top: 60.h),
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
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
                    Text(
                      appLocale.payment,
                      style: TextStyle(
                          fontSize: 22.sp, fontWeight: FontWeight.bold),
                    ),
                    const IconButton(
                      icon: Icon(Icons.contact_support,
                          color: Colors.transparent),
                      onPressed: null,
                    ),
                  ],
                ),
                SizedBox(height: 80.h),
                Center(
                  child: Text(
                    '100\$',
                    style: TextStyle(
                        fontSize: 44.sp,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
                const Center(child: Text('January \n20.2022')),
                SizedBox(height: 16.h),
                Text(
                  appLocale.placeOfDelivery,
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 14.h),
                Container(
                  height: 128.h,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: SvgPicture.asset(
                    'assets/images/placeOfDelivery.svg',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 15.h),
                Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      'assets/images/markedLocation.svg',
                      width: 30.w,
                      height: 32.h,
                    ),
                    SizedBox(width: 10.w),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('232 REMAL - GAZA - PALESTINE'),
                        Text('CAE62541'),
                      ],
                    ),
                  ],
                ),
                Divider(
                  height: 30.h,
                  color: Theme.of(context).colorScheme.primary,
                  thickness: 2.h,
                ),
                SizedBox(height: 15.h),
                const Invoice(item: 'Unit Price', price: 100),
                SizedBox(height: 14.h),
                const Invoice(item: 'Delivery Commission', price: 10),
                SizedBox(height: 14.h),
                const Invoice(item: 'Total Summation', price: 110),
                SizedBox(height: 50.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 70.w),
                  child: My_Button(
                    buttonText: appLocale.complete,
                    onTap: () {
                      setState(() {
                        isDone = true;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          isDone
              ? PositionedDirectional(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                          (route) => false);
                    },
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      height: double.infinity,
                      width: double.infinity,
                      color:
                          Theme.of(context).colorScheme.primary.withOpacity(.8),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black.withOpacity(.1),
                            width: 40.w,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.w, vertical: 30.h),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.24),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 120.h,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class Invoice extends StatelessWidget {
  const Invoice({
    super.key,
    required this.item,
    required this.price,
  });
  final String item;
  final num price;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(item),
        Text('$price\$'),
      ],
    );
  }
}
