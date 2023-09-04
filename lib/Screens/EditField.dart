import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lamp/Widgets/My_Button.dart';

class EditFiled extends StatefulWidget {
  final int index;
  const EditFiled({super.key, required this.index});

  @override
  State<EditFiled> createState() => _EditFiledState();
}

class _EditFiledState extends State<EditFiled> {
  late TextEditingController _textController;
  late TextEditingController _passwordConfirmController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(
        text: widget.index == 1
            ? 'John Pham'
            : widget.index == 2
                ? '0591321564894'
                : widget.index == 3
                    ? 'johnpham789@gmail.com'
                    : '');
    _passwordConfirmController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
    _passwordConfirmController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String field = widget.index == 1
        ? 'Full name'
        : widget.index == 2
            ? 'Phone Number'
            : widget.index == 3
                ? 'Email'
                : 'Password';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150.h,
            alignment: Alignment.topCenter,
            padding: EdgeInsets.symmetric(vertical: 40.h),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(50.r)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 32.h,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  Text('Edit Account',
                      style: Theme.of(context).textTheme.bodyLarge),
                  const IconButton(
                      onPressed: null,
                      icon: Icon(Icons.ac_unit, color: Colors.transparent))
                ],
              ),
            ),
          ),
          SizedBox(height: 150.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Text(
              field,
              style: TextStyle(fontSize: 18.sp, color: Colors.grey),
            ),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: TextField(
              controller: _textController,
              obscureText: widget.index == 4,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        _textController.clear();
                      });
                    }),
                filled: true,
                fillColor: const Color(0xff707070).withOpacity(.1),
                hintText: widget.index == 4 ? '8 symbols least' : '',
                border: buildOutlineInputBorder(),
                enabledBorder: buildOutlineInputBorder(),
                focusedBorder: buildOutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          widget.index == 4
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.w),
                      child: Text(
                        'Confirm Password',
                        style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: TextField(
                        controller: _passwordConfirmController,
                        obscureText: widget.index == 4,
                        decoration: InputDecoration(
                          hintText: '8 symbols least',
                          suffixIcon: IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                _textController.clear();
                              }),
                          filled: true,
                          fillColor: const Color(0xff707070).withOpacity(.1),
                          border: buildOutlineInputBorder(),
                          enabledBorder: buildOutlineInputBorder(),
                          focusedBorder: buildOutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                )
              : const SizedBox.shrink(),
          SizedBox(height: 50.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: My_Button(
              buttonText: 'Update $field',
              enabled: _textController.text.isNotEmpty,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.r),
        borderSide: const BorderSide(color: Colors.transparent));
  }
}
