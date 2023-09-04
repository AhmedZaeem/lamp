import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lamp/Helpers/NavigatorHelper.dart';
import 'package:lamp/Widgets/MyTextFormFiled.dart';
import 'package:lamp/Widgets/My_Button.dart';

import 'PaymentConfirmation.dart';

class AddCreditCard extends StatefulWidget {
  const AddCreditCard({super.key});

  @override
  State<AddCreditCard> createState() => _AddCreditCardState();
}

class _AddCreditCardState extends State<AddCreditCard> with NavigatorHelper {
  AppLocalizations get appLocale => AppLocalizations.of(context)!;
  late TextEditingController _nameController;
  late TextEditingController _cardNumberController;
  late TextEditingController _expireDateController;
  late TextEditingController _cvvController;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _cardNumberController = TextEditingController();
    _expireDateController = TextEditingController();
    _cvvController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _cardNumberController.dispose();
    _expireDateController.dispose();
    _cvvController.dispose();
  }

  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        margin: EdgeInsets.only(top: 70.h),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 32.h,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 20.h),
            Text(appLocale.addCreditCard, style: TextStyle(fontSize: 22.sp)),
            SizedBox(height: 44.h),
            Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Text('Name', style: buildTextStyle()),
                  ),
                  MyTextFormField(
                    controller: _nameController,
                    filled: false,
                    hint: 'Travis Reeves',
                    focusBorder: buildOutlineInputBorder(context),
                    border: buildOutlineTextInputBorder(),
                  ),
                  SizedBox(height: 16.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Text('Credit card number', style: buildTextStyle()),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: MyTextFormField(
                          controller: _cardNumberController,
                          filled: false,
                          hint: '**** - **** -  **** - **85',
                          focusBorder: buildOutlineInputBorder(context),
                          border: buildOutlineTextInputBorder(),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Container(
                        clipBehavior: Clip.antiAlias,
                        width: 48.h,
                        height: 48.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        decoration: BoxDecoration(
                          color: const Color(0xff192038),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: SvgPicture.asset('assets/images/scan.svg'),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 10.w),
                      Text('Expires', style: buildTextStyle()),
                      const Spacer(),
                      Text('CVV', style: buildTextStyle()),
                      const Spacer(),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: MyTextFormField(
                          controller: _expireDateController,
                          filled: false,
                          hint: '10/27/2030',
                          focusBorder: buildOutlineInputBorder(context),
                          border: buildOutlineTextInputBorder(),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: MyTextFormField(
                          controller: _cvvController,
                          filled: false,
                          hint: '* * * *',
                          focusBorder: buildOutlineInputBorder(context),
                          border: buildOutlineTextInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 140.h),
            Text(
              'Debit cards are accepted at some locations',
              style: buildTextStyle(),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                6,
                (index) => Image.asset('assets/images/pay${index + 1}.png'),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 70.w),
              child: My_Button(
                buttonText: appLocale.save.toUpperCase(),
                onTap: () {
                  jump(context, const PaymentConfirmation());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle buildTextStyle() => TextStyle(fontSize: 13.sp);

  OutlineInputBorder buildOutlineTextInputBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 1.w),
        borderRadius: BorderRadius.circular(22.r));
  }

  OutlineInputBorder buildOutlineInputBorder(BuildContext context) {
    return OutlineInputBorder(
        borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary, width: 1.w),
        borderRadius: BorderRadius.circular(22.r));
  }
}
