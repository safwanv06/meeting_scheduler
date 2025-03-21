import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../main.dart';
import '../calender_widget/calender_widget.dart';
import '../events_widget/scheduled_events_widget.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget(
      {super.key,
      required this.selectedDate,
      required this.onDateSelected,
      required this.onPageChanged,
      required this.onMonthSelectionTap,
      required this.onYearSelectionTap});

  final DateTime selectedDate;
  final Function(DateTime, DateTime) onDateSelected;
  final Function(DateTime) onPageChanged;
  final Function() onMonthSelectionTap;
  final Function() onYearSelectionTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalenderWidget(
          selectedDate: selectedDate,
          monthlyScheduledMeetingList: [],
          onPageChanged: onPageChanged,
          onDateSelected: onDateSelected,
          onMonthSelectionTap: onMonthSelectionTap,
          onYearSelectionTap: onYearSelectionTap,
        ),
        SizedBox(height: appSize.size16.h),
        ScheduledEventsWidget(
            selectedDate: selectedDate, scheduledMeetings: null)
      ],
    );
  }
}
