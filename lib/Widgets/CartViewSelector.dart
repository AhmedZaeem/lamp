import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartViewSelector extends StatelessWidget {
  const CartViewSelector({
    super.key,
    this.text,
    required this.viewIndex,
    required this.selectedIndex,
    this.onTap,
  });
  final String? text;
  final int viewIndex;
  final int selectedIndex;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 48.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selectedIndex == viewIndex
                ? Theme.of(context).colorScheme.primary
                : Colors.white,
            borderRadius: viewIndex == 0
                ? BorderRadius.horizontal(left: Radius.circular(24.r))
                : BorderRadius.horizontal(right: Radius.circular(24.r)),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 1.w,
            ),
          ),
          child: Text(
            text ?? '',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color:
                    selectedIndex == viewIndex ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
