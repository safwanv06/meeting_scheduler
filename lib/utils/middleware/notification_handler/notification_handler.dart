
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_sync/main.dart';



flushBarNotification(
    {required BuildContext context,
      required String message,
      required FlushBarType type}) {
  late Color backGroundColor;

  Color messageColor = appColors.whiteFFFFFF;

  switch (type) {
    case FlushBarType.success:
      backGroundColor = appColors.successGreen;
    case FlushBarType.warning:
      backGroundColor = appColors.warningOrange;
    case FlushBarType.error:
      backGroundColor = appColors.failedRed;
  }
  Flushbar(
    backgroundColor: backGroundColor,
    borderRadius: BorderRadius.circular(appSize.radius8),
    padding: EdgeInsets.symmetric(
        horizontal: appSize.size16.w,
        vertical: appSize.size12.h),
    margin: EdgeInsets.symmetric(horizontal: appSize.size24.sp),
    messageText: Row(
      children: [
        Icon(
          Icons.info_outline,
          size: appSize.icon20.sp,
          color: messageColor,
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Text(
            message,
            softWrap: true,
            style: TextStyle(
              color: messageColor,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    ),
    duration: const Duration(seconds: 3),
    flushbarPosition: FlushbarPosition.TOP,
  ).show(context);
}

///Notification Types
enum FlushBarType{
  success,warning,error
}