import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:meet_sync/main.dart';
import 'package:meet_sync/view/calendar_screen/service/model/meeting_model.dart';

class MeetingTile extends StatelessWidget {
  const MeetingTile(
      {super.key, required this.meeting, required this.currentDate});

  final MeetingModel meeting;
  final DateTime currentDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: appSize.size8.h),
      padding: EdgeInsets.symmetric(
          horizontal: appSize.size16.w, vertical: appSize.size10.h),
      decoration: BoxDecoration(
          color: appColors.grey36454F,
          borderRadius: BorderRadius.circular(appSize.radius16)),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                      meeting.scheduleTitle.replaceAll(meeting.scheduleTitle[0],
                          meeting.scheduleTitle[0].toUpperCase()),
                      overflow: TextOverflow.ellipsis,
                      style: fontStyles.font14GreyA9A9_600)),
              Text(meeting.scheduledTime, style: fontStyles.font14GreyA9A9_600)
            ],
          ),
          Divider(color: appColors.greyA9A9A9, thickness: 0.5.h),
          Row(
            children: [
              Expanded(
                  child: Text(DateFormat("EEEE - MMMM dd").format(currentDate),
                      style: fontStyles.font14GreyA9A9_400)),
              meeting.hasConflict
                  ? Icon(Icons.groups_2_outlined,
                      size: appSize.icon24, color: appColors.redCE3000)
                  : SizedBox.shrink()
            ],
          ),
        ],
      ),
    );
  }
}
