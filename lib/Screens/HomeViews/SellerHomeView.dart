import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lamp/Helpers/NavigatorHelper.dart';
import 'package:lamp/Modles/shopItemModel.dart';
import 'package:lamp/Screens/addProduct.dart';

import '../../Widgets/profileTypeSelector.dart';

class SellerHomeView extends StatefulWidget {
  const SellerHomeView({super.key});

  @override
  State<SellerHomeView> createState() => _SellerHomeViewState();
}

class _SellerHomeViewState extends State<SellerHomeView> with NavigatorHelper {
  AppLocalizations get appLocale => AppLocalizations.of(context)!;
  bool show = false;
  bool addProduct = false;
  @override
  Widget build(BuildContext context) {
    List<shopItemModel> myItems = List.generate(
        5,
        (index) => shopItemModel(
            itemImage:
                'https://cdn.sparkfun.com/assets/9/1/e/4/8/515b4656ce395f8a38000000.png',
            itemName: 'Arduino',
            itemPrice: 100,
            title1: 'ArduinoArduinoArduino',
            title2: 'ArduinoArduinoArduinoArduinoArduino'));
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(height: 44.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      addProduct ? Icons.arrow_back_ios : Icons.menu,
                      color: Colors.white,
                      size: 32.h,
                    ),
                    onPressed: addProduct
                        ? () {
                            setState(() {
                              addProduct = false;
                            });
                          }
                        : () {
                            setState(() {
                              show = true;
                            });
                          },
                  ),
                  Text(appLocale.home,
                      style: Theme.of(context).textTheme.bodyLarge),
                  IconButton(
                    icon: SvgPicture.asset('assets/images/notifications.svg'),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            addProduct
                ? const AddProduct()
                : Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30.r)),
                        color: Colors.white,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 70.h),
                            InkWell(
                              radius: 90.r,
                              onTap: () {
                                setState(() {
                                  addProduct = true;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        const Color(0xff6179F7).withOpacity(.2),
                                    width: 20.w,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        const Color(0xff6179F7).withOpacity(.6),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    size: 120.h,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 35.h),
                            GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: .65,
                              ),
                              itemBuilder: (context, index) {
                                return Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.w),
                                  clipBehavior: Clip.antiAlias,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 8.w, vertical: 5.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.r),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(.2),
                                        blurRadius: 20.h,
                                        blurStyle: BlurStyle.outer,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Image.network(myItems[index].itemImage,
                                          width: 150.w, height: 150.w),
                                      SizedBox(height: 4.h),
                                      Text(myItems[index].itemName),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Chip(
                                            backgroundColor:
                                                myItems[index].isSold
                                                    ? Colors.lightGreen
                                                    : Colors.red,
                                            label: Text(
                                              myItems[index].isSold
                                                  ? 'Sold'
                                                  : 'Waiting',
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          Chip(
                                            backgroundColor: Colors.blue,
                                            label: Text(
                                              '${myItems[index].itemPrice}\$',
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 4.h),
                                      ItemTitle(title: myItems[index].title1),
                                      ItemTitle(title: myItems[index].title2),
                                      SizedBox(height: 10.h),
                                    ],
                                  ),
                                );
                              },
                              itemCount: myItems.length,
                            ),
                            SizedBox(height: 120.h),
                          ],
                        ),
                      ),
                    ),
                  ),
          ],
        ),
        show
            ? ProfileTypeSelector(
                isSeller: true,
                cancelButtonOnTap: () => setState(() => show = false),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}

class ItemTitle extends StatelessWidget {
  const ItemTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Text(
      title,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.start,
      style: TextStyle(
        fontSize: 12.sp,
      ),
    ));
  }
}
