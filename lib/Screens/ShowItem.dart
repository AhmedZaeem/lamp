import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lamp/Helpers/NavigatorHelper.dart';
import 'package:lamp/Modles/shopItemModel.dart';
import 'package:lamp/Screens/payment/Checkout.dart';
import 'package:lamp/Widgets/My_Button.dart';

class ShowItem extends StatefulWidget {
  const ShowItem(this.item, {super.key});
  final shopItemModel item;
  @override
  State<ShowItem> createState() => _ShowItemState();
}

class _ShowItemState extends State<ShowItem> with NavigatorHelper {
  late DraggableScrollableController _controller;
  @override
  void initState() {
    super.initState();
    _controller = DraggableScrollableController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  AppLocalizations get appLocale => AppLocalizations.of(context)!;
  int shownImage = 0;
  @override
  Widget build(BuildContext context) {
    List images = List.generate(
        3,
        (index) =>
            'https://m.media-amazon.com/images/I/71vyQX3NFmL.__AC_SY300_SX300_QL70_ML2_.jpg');
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(bottom: 350.h),
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  shownImage = value;
                });
              },
              itemBuilder: (context, index) {
                return Image.network(images[index]);
              },
              itemCount: images.length,
            ),
          ),
          PositionedDirectional(
            top: 350.h,
            start: 150.w,
            child: SizedBox(
              height: 10.h,
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: 10.h,
                    width: shownImage == index ? 42.w : 10.h,
                    decoration: BoxDecoration(
                      color: shownImage == index
                          ? Theme.of(context).colorScheme.primary
                          : Colors.transparent,
                      shape: shownImage == index
                          ? BoxShape.rectangle
                          : BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                        width: 1.w,
                      ),
                      borderRadius: shownImage == index
                          ? BorderRadius.circular(6.r)
                          : null,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 4.w);
                },
                itemCount: images.length,
              ),
            ),
          ),
          PositionedDirectional(
            top: 42.h,
            start: 16.w,
            child: IconButton(
                icon: Icon(Icons.arrow_back_ios, size: 32.h),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          DraggableScrollableSheet(
            minChildSize: .5,
            maxChildSize: .9,
            expand: true,
            controller: _controller,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey.withOpacity(.5),
                    width: 1.w,
                  ),
                  borderRadius: BorderRadius.circular(55.r),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(start: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8.h),
                        Center(
                          child: Container(
                            width: 40.w,
                            height: 5.h,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(45.r),
                            ),
                          ),
                        ),
                        SizedBox(height: 34.h),
                        Row(
                          children: <Widget>[
                            Text(widget.item.itemName,
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold)),
                            const Spacer(),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6.w, vertical: 6.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(.2),
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: SvgPicture.asset(
                                    'assets/images/message.svg'),
                              ),
                            ),
                            SizedBox(width: 16.w),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Stack(
                          children: [
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        radius: 5.h),
                                    SizedBox(width: 8.w),
                                    const Text('Microcontroller: ATmega328P'),
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 8.h);
                              },
                              itemCount: 4,
                            ),
                            PositionedDirectional(
                              top: 0,
                              end: 0,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24.w, vertical: 10.h),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.horizontal(
                                          start: Radius.circular(14.r)),
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                child: Text(
                                  '${widget.item.itemPrice}\$',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18.sp),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: My_Button(
                                textStyle: TextStyle(
                                    fontSize: 16.sp, color: Colors.white),
                                buttonText: appLocale.addToCart,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              flex: 1,
                              child: My_Button(
                                onTap: () {
                                  jump(context, Checkout(widget.item));
                                },
                                buttonText: appLocale.buyNow,
                                textStyle: TextStyle(
                                    fontSize: 16.sp, color: Colors.white),
                                buttonColor: const Color(0xff404357),
                              ),
                            ),
                            SizedBox(width: 16.w),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
