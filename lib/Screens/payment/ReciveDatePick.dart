import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lamp/Widgets/My_Button.dart';
import 'package:table_calendar/table_calendar.dart';

class ReceiveDatePick extends StatefulWidget {
  const ReceiveDatePick({super.key});

  @override
  State<ReceiveDatePick> createState() => _ReceiveDatePickState();
}

class _ReceiveDatePickState extends State<ReceiveDatePick> {
  AppLocalizations get appLocale => AppLocalizations.of(context)!;
  DateTime selectedDate = DateTime.now().add(const Duration(days: 1));
  DateTime _focusedDay = DateTime.now().add(const Duration(days: 1));
  int selectedTimeIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.only(top: 44.h),
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.black.withOpacity(.7),
                      size: 50.h,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                Text(
                  appLocale.calendar,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    onPressed: null),
              ],
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: TableCalendar(
                daysOfWeekHeight: 50.h,
                pageAnimationEnabled: true,
                headerStyle: HeaderStyle(
                  leftChevronIcon:
                      const Icon(Icons.arrow_back_ios, color: Colors.white),
                  rightChevronIcon:
                      const Icon(Icons.arrow_forward_ios, color: Colors.white),
                  formatButtonVisible: false,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.circular(30.r),
                      topStart: Radius.circular(30.r),
                    ),
                  ),
                  titleTextStyle: TextStyle(color: Colors.white),
                  titleCentered: true,
                ),
                focusedDay: selectedDate,
                firstDay: DateTime.now(),
                lastDay: DateTime(DateTime.now().year + 1, DateTime.now().month,
                    DateTime.now().day),
                currentDay: DateTime.now(),
                selectedDayPredicate: (day) {
                  return isSameDay(selectedDate, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    selectedDate = selectedDay;
                    _focusedDay =
                        focusedDay; // update `_focusedDay` here as well
                  });
                },
              ),
            ),
            SizedBox(height: 90.h),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsetsDirectional.only(
                      start: 20.w, end: 11.w, top: 3.h, bottom: 5.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.horizontal(
                        end: Radius.circular(19.r)),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Text(
                    'Time of receipt',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                const Spacer(),
                Column(
                  children: [
                    TimeSelect(
                      selectedIndex: selectedTimeIndex,
                      index: 0,
                      time: '9:00',
                      onTap: () => setState(() => selectedTimeIndex = 0),
                    ),
                    TimeSelect(
                      selectedIndex: selectedTimeIndex,
                      index: 1,
                      time: '10:00',
                      onTap: () => setState(() => selectedTimeIndex = 1),
                    ),
                    TimeSelect(
                      selectedIndex: selectedTimeIndex,
                      index: 2,
                      time: '11:00',
                      onTap: () => setState(() => selectedTimeIndex = 2),
                    ),
                  ],
                ),
                SizedBox(width: 16.w),
              ],
            ),
            SizedBox(height: 60.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.w),
              child: My_Button(
                buttonText: appLocale.next,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TimeSelect extends StatelessWidget {
  const TimeSelect({
    super.key,
    required this.selectedIndex,
    required this.index,
    required this.time,
    this.onTap,
  });
  final int index;
  final int selectedIndex;
  final String time;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text('$time AM',
          style: TextStyle(
            color: selectedIndex == index
                ? Theme.of(context).colorScheme.primary
                : Colors.grey,
            fontSize: selectedIndex == index ? 18.sp : 16.sp,
          )),
    );
  }
}
