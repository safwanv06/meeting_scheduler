import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:meet_sync/main.dart';

class CalenderHeaderWidget extends StatelessWidget {
  const CalenderHeaderWidget(
      {super.key,
      required this.selectedDate,
      required this.onMonthTap,
      required this.onYearTap});

  final DateTime selectedDate;
  final Function() onMonthTap;
  final Function() onYearTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: appSize.size12.w, vertical: appSize.size8.h),
      decoration: BoxDecoration(
          color: appColors.grey36454F,
          borderRadius: BorderRadius.circular(appSize.radius16)),
      child: Row(
        children: [
          InkWell(
            onTap: onMonthTap,
            child: Row(
              children: [
                Text(DateFormat("MMMM").format(selectedDate),
                    style: fontStyles.font16GreyA9A9_600),
                SizedBox(width: appSize.size4.w),
                Icon(Icons.arrow_drop_down_outlined,
                    color: appColors.greyA9A9A9, size: appSize.icon24),
              ],
            ),
          ),
          Spacer(),
          InkWell(
            onTap: onYearTap,
            child: Row(
              children: [
                Text(DateFormat("yyyy").format(selectedDate),
                    style: fontStyles.font16GreyA9A9_600),
                SizedBox(width: appSize.size4.w),
                Icon(Icons.arrow_drop_down_outlined,
                    color: appColors.greyA9A9A9, size: appSize.icon24),
              ],
            ),
          )
        ],
      ),
    );
  }
}
