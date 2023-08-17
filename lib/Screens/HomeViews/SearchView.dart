import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lamp/Helpers/NavigatorHelper.dart';
import 'package:lamp/Modles/shopItemModel.dart';
import 'package:lamp/Screens/ShowItem.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> with NavigatorHelper {
  AppLocalizations get appLocale => AppLocalizations.of(context)!;
  late TextEditingController _controller;
  late DropdownController _dropdownController;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _dropdownController = DropdownController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _dropdownController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<shopItemModel?> items = [
      shopItemModel(
        itemImage:
            'https://cdn.sparkfun.com/assets/9/1/e/4/8/515b4656ce395f8a38000000.png',
        itemName: 'Arduino Uno Rev3 ',
        itemPrice: 100,
        title1: 'Aluminum',
        title2: 'THB 1166.5',
      )
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Column(
        children: [
          SizedBox(height: 40.h),
          items.isEmpty
              ? Center(
                  child: Text(
                    appLocale.search,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.black,
                        ),
                  ),
                )
              : CoolDropdown(
                  resultOptions: ResultOptions(
                    boxDecoration: const BoxDecoration(),
                    openBoxDecoration: const BoxDecoration(),
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                  dropdownOptions: const DropdownOptions(),
                  dropdownItemOptions: DropdownItemOptions(
                      selectedBoxDecoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      selectedTextStyle: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                  defaultItem: CoolDropdownItem(
                      label: 'Engineering', value: 'Engineering'),
                  dropdownList: [
                    CoolDropdownItem(
                        label: 'Engineering', value: 'Engineering'),
                    CoolDropdownItem(label: 'Arts', value: 'Arts'),
                    CoolDropdownItem(label: 'Multimedia', value: 'Multimedia'),
                  ],
                  controller: _dropdownController,
                  onChange: (p0) {},
                ),
          SizedBox(height: 28.h),
          SearchBar(
            textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 14.sp)),
            controller: _controller,
            padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 16.w)),
            elevation: const MaterialStatePropertyAll(0),
            backgroundColor: MaterialStatePropertyAll(
                const Color(0xff92A3F9).withOpacity(.27)),
            onChanged: (value) {},
            trailing: [
              SvgPicture.asset('assets/images/options.svg'),
            ],
            leading: SvgPicture.asset('assets/images/search.svg'),
            hintText: appLocale.search,
            hintStyle: MaterialStatePropertyAll(
              TextStyle(
                fontSize: 14.sp,
                color: Colors.black.withOpacity(.4),
              ),
            ),
            overlayColor: const MaterialStatePropertyAll(Colors.transparent),
          ),
          items.isNotEmpty
              ? ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        jump(context, ShowItem(items[index]!));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22.r),
                          border: Border.all(
                              color: Theme.of(context).colorScheme.primary,
                              width: 2.w),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 10.h),
                              child: Row(
                                children: <Widget>[
                                  Image.network(items[index]!.itemImage,
                                      width: 125.w),
                                  SizedBox(width: 12.w),
                                  Column(
                                    children: [
                                      Text(items[index]!.itemName,
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              fontSize: 16.sp)),
                                      Row(
                                        children: <Widget>[
                                          CircleAvatar(
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            radius: 3.h,
                                          ),
                                          SizedBox(width: 2.w),
                                          Text(
                                            items[index]!.title1,
                                            style: TextStyle(fontSize: 10.sp),
                                          ),
                                          SizedBox(width: 10.w),
                                          CircleAvatar(
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            radius: 3.h,
                                          ),
                                          SizedBox(width: 2.w),
                                          Text(
                                            items[index]!.title2,
                                            style: TextStyle(fontSize: 10.sp),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Container(
                              color: const Color(0xff92A3F9).withOpacity(.51),
                              padding: EdgeInsetsDirectional.only(start: 12.w),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'AHMED ahmed',
                                    style: TextStyle(fontSize: 10.sp),
                                  ),
                                  const Spacer(),
                                  Container(
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.r),
                                          bottomRight: Radius.circular(20.r)),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12.w, vertical: 8.h),
                                    child: Text(
                                      '${items[index]!.itemPrice}\$',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 20.h);
                  },
                  itemCount: items.length)
              : Container(
                  margin: EdgeInsets.symmetric(vertical: 150.h),
                  child: SvgPicture.asset('assets/images/coloredLogo.svg',
                      height: 250.h,
                      colorFilter: ColorFilter.mode(
                          Colors.white.withOpacity(.5), BlendMode.lighten)),
                ),
        ],
      ),
    );
  }
}
