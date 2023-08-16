import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Modles/msgModel.dart';

class ContactView extends StatefulWidget {
  const ContactView({super.key});

  @override
  State<ContactView> createState() => _MessegesViewState();
}

class _MessegesViewState extends State<ContactView> {
  AppLocalizations get appLocale => AppLocalizations.of(context)!;
  String userEmail = 'a@gmail.com';
  String userName = 'someone';
  List<MsgModel> messages = [
    MsgModel(
        msg: 'hello',
        senderEmail: 'a@gmail.com',
        senderUsername: 'someone',
        time: DateTime.now()),
    MsgModel(
        msg: 'hey',
        senderEmail: 'ab@gmail.com',
        senderUsername: 's2',
        time: DateTime.now()),
    MsgModel(
        msg: 'how are you',
        senderEmail: 'a@gmail.com',
        senderUsername: 'someone',
        time: DateTime.now()),
    MsgModel(
        msg: 'how are you',
        senderEmail: 'a@gmail.com',
        senderUsername: 'someone',
        time: DateTime.now()),
    MsgModel(
        msg: 'how are you',
        senderEmail: 'a@gmail.com',
        senderUsername: 'someone',
        time: DateTime.now()),
    MsgModel(
        msg: 'how are you',
        senderEmail: 'a@gmail.com',
        senderUsername: 'someone',
        time: DateTime.now()),
    MsgModel(
        msg: 'how are you',
        senderEmail: 'a@gmail.com',
        senderUsername: 'someone',
        time: DateTime.now()),
    MsgModel(
        msg: 'how are you',
        senderEmail: 'a@gmail.com',
        senderUsername: 'someone',
        time: DateTime.now()),
    MsgModel(
        msg: 'Sorry , I\'m stuck in traffic. Please give me a moment.',
        senderEmail: 'ab@gmail.com',
        senderUsername: 's2',
        time: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff6179F7),
      body: Column(
        children: [
          Container(
            height: 126.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(22.r)),
            ),
            child: Row(
              children: <Widget>[
                SizedBox(width: 12.w),
                IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 30.h,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                SizedBox(width: 72.w),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 50.h),
                    Text(
                      appLocale.chat.toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.sp,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      'ST3751 - Toyota Vios',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: const Color(0xffACB1C0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                bool isMe = userEmail == messages[index].senderEmail;
                return chatBubble(
                    isMe: isMe,
                    sender: messages[index].senderUsername,
                    msg: messages[index].msg);
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 6.h);
              },
              itemCount: messages.length,
            ),
          ),
          Container(
            height: 110.h,
            width: double.infinity,
            padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 10.h),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xff707070), width: 1.w),
              borderRadius: BorderRadius.vertical(top: Radius.circular(22.r)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 4.h),
                  child: SizedBox(
                    height: 40.h,
                    width: 297.w,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.bottom,
                      onSubmitted: (value) {},
                      decoration: InputDecoration(
                        hintText: appLocale.typeAMsg,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(45.r)),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/images/send.svg',
                    height: 20.h,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class chatBubble extends StatelessWidget {
  const chatBubble({
    super.key,
    required this.isMe,
    required this.sender,
    required this.msg,
  });

  final bool isMe;
  final String sender;
  final String msg;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(color: Colors.black, fontSize: 12.sp),
          ),
          Material(
            elevation: 5,
            color: isMe ? Theme.of(context).colorScheme.primary : Colors.white,
            borderRadius: isMe
                ? BorderRadius.only(
                    topRight: Radius.circular(24.r),
                    bottomLeft: Radius.circular(24.r),
                    topLeft: Radius.circular(24.r),
                  )
                : BorderRadius.only(
                    topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r),
                    bottomRight: Radius.circular(24.r),
                  ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Text(
                msg,
                style: TextStyle(
                    fontSize: 18.sp,
                    color: isMe ? Colors.white : Colors.black54,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
