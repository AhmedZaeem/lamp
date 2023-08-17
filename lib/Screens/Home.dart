import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lamp/Helpers/NavigatorHelper.dart';
import 'package:lamp/Screens/HomeViews/BuyerHomeView.dart';
import 'package:lamp/Screens/HomeViews/CartView.dart';
import 'package:lamp/Screens/HomeViews/ContactView.dart';
import 'package:lamp/Screens/HomeViews/ProfileView.dart';
import 'package:lamp/Screens/HomeViews/SearchView.dart';
import 'package:lamp/Screens/HomeViews/SellerHomeView.dart';

class Home extends StatefulWidget {
  final bool isBuyer;
  const Home({super.key, this.isBuyer = true});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with NavigatorHelper {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          (_index == 0 && widget.isBuyer) == false || _index != 2
              ? false
              : true,
      backgroundColor:
          _index == 0 ? Theme.of(context).colorScheme.primary : Colors.white,
      body: Stack(
        children: [
          [
            widget.isBuyer ? const BuyerHomeView() : const SellerHomeView(),
            const CartView(),
            const SearchView(),
            const ProfileView(),
          ][_index],
          PositionedDirectional(
            bottom: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 22.w, vertical: 30.h),
              width: 335.w,
              height: 70.h,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.2),
                    spreadRadius: 3,
                    blurRadius: 8,
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(14.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildBottomNavBarItem('Home', 0),
                  _buildBottomNavBarItem('cart', 1),
                  _buildBottomNavBarItem('search', 2),
                  IconButton(
                    icon: SvgPicture.asset('assets/images/contact.svg'),
                    onPressed: () => jump(context, const ContactView()),
                  ),
                  _buildBottomNavBarItem('profile', 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBarItem(String image, int i) {
    return InkWell(
      onTap: () => setState(() => _index = i),
      child: SvgPicture.asset(
        'assets/images/$image.svg',
        width: 24.h,
        height: 24.h,
        color: _index == i ? Colors.blue : Colors.grey,
      ),
    );
  }
}
