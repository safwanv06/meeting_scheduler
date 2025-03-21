import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:meet_sync/main.dart';
import 'package:meet_sync/view/calendar_screen/view/widgets/calender_widget/calender_header_widget.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../service/model/scheduled_meeting_model.dart';

class CalenderWidget extends StatelessWidget {
  const CalenderWidget(
      {super.key,
      required this.selectedDate,
      required this.onDateSelected,
      required this.onPageChanged,
      required this.monthlyScheduledMeetingList, required this.onMonthSelectionTap, required this.onYearSelectionTap});

  final DateTime selectedDate;
  final Function(DateTime, DateTime) onDateSelected;
  final Function(DateTime) onPageChanged;
  final Function() onMonthSelectionTap;
  final Function() onYearSelectionTap;
  final List<ScheduledMeetingModel> monthlyScheduledMeetingList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: appSize.size32.h),
        CalenderHeaderWidget(
          onMonthTap: onMonthSelectionTap,
          onYearTap: onYearSelectionTap,
          selectedDate: selectedDate,
        ),
        SizedBox(height: appSize.size16.h),
        Container(
          padding: EdgeInsets.all(appSize.size8.sp),
          decoration: BoxDecoration(
              color: appColors.grey36454F,
              borderRadius: BorderRadius.circular(appSize.radius16)),
          child: TableCalendar(
              focusedDay: selectedDate,
              firstDay: DateTime(DateTime.now().year - 10),
              onDaySelected: onDateSelected,
              onPageChanged: onPageChanged,
              selectedDayPredicate: (day) {
                return selectedDate == day;
              },
              availableGestures: AvailableGestures.horizontalSwipe,
              calendarStyle: CalendarStyle(
                  defaultTextStyle: fontStyles.font14WhiteFFFF_400,
                  weekendTextStyle: fontStyles.font14GreyA9A9_400),
              headerVisible: false,
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, day, focusedDay) {
                  DateTime? conflictDay;
                  for (ScheduledMeetingModel element
                      in monthlyScheduledMeetingList) {
                    if (element.meetings
                        .any((element) => element.hasConflict)) {
                      conflictDay = element.date;
                    }
                  }
                  if (conflictDay != null &&
                      DateFormat("yyyy-MM-dd").format(conflictDay) ==
                          DateFormat("yyyy-MM-dd").format(day)) {
                    return Center(
                      child: Text(
                        conflictDay.day.toString(),
                        style: fontStyles.font14OrangeC28_400,
                      ),
                    );
                  } else {
                    return null;
                  }
                },
                outsideBuilder: (context, day, focusedDay) {
                  return Center(
                      child: Text(
                    day.day.toString(),
                    style: fontStyles.font14GreyA9A9_400,
                  ));
                },
                selectedBuilder: (context, day, focusedDay) {
                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.orange,
                    ),
                    child: Center(
                        child: Text(
                      focusedDay.day.toString(),
                      style: fontStyles.font14WhiteFFFF_800,
                    )),
                  );
                },
                todayBuilder: (context, day, focusedDay) {
                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: appColors.yellowFFE11D)),
                    child: Center(
                        child: Text(day.day.toString(),
                            style: fontStyles.font14WhiteFFFF_800)),
                  );
                },
                markerBuilder: (context, day, events) {
                  String calenderDay = DateFormat("yyyy-MM-dd").format(day);
                  ScheduledMeetingModel? event;
                  for (ScheduledMeetingModel element
                      in monthlyScheduledMeetingList) {
                    String eventDay =
                        DateFormat("yyyy-MM-dd").format(element.date);
                    if (calenderDay == eventDay) {
                      event = element;
                      break;
                    }
                  }
                  if (event != null) {
                    late Color dotColor;
                    switch (event.meetingType) {
                      case MeetingType.previous:
                        dotColor = appColors.greyA9A9A9;
                      case MeetingType.current:
                        dotColor = appColors.yellowFFE11D;
                      case MeetingType.upcoming:
                        dotColor = appColors.green00C421;
                    }
                    return Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: 10,
                          decoration: BoxDecoration(
                              color: dotColor, shape: BoxShape.circle),
                          width: 10,
                        ));
                  } else {
                    return null;
                  }
                },
              ),
              currentDay: DateTime(2025, 02, 19),
              lastDay: DateTime(DateTime.now().year + 10)),
        ),
      ],
    );
  }
}
