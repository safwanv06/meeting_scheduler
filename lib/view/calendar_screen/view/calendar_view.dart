import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:meet_sync/main.dart';
import 'package:meet_sync/view/calendar_screen/service/model/meeting_model.dart';
import 'package:meet_sync/view/calendar_screen/service/service.dart';
import 'package:meet_sync/view/calendar_screen/view/widgets/calender_widget/calender_widget.dart';
import 'package:meet_sync/view/calendar_screen/view/widgets/header_widget/add_meeting_row.dart';
import 'package:meet_sync/view/calendar_screen/view/widgets/header_widget/option_header_row.dart';
import 'package:meet_sync/view/calendar_screen/view/widgets/loading_widget/loading_widget.dart';
import 'package:meet_sync/view/calendar_screen/view/widgets/events_widget/scheduled_events_widget.dart';
import 'package:meet_sync/view/calendar_screen/view/widgets/no_data_widget/no_data_widget.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../controller/controller.dart';
import '../service/model/scheduled_meeting_model.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Consumer<CalenderController>(
        builder: (context, value, child) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: appSize.size16.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: appSize.size20.h),
                  OptionHeaderRow(),
                  SizedBox(height: appSize.size16.h),
                  AddMeetingRow(),
                  FutureBuilder(
                      future: value.monthlyScheduledMeetingList == null
                          ? value.getCalenderData()
                          : null,
                      builder: (context, snapshot) {
                        if (value.monthlyScheduledMeetingList == null ||
                            snapshot.connectionState == ConnectionState.waiting) {
                          return LoadingWidget();
                        } else if (value.monthlyScheduledMeetingList != null &&
                            value.monthlyScheduledMeetingList!.isNotEmpty) {
                          return Column(
                            children: [
                              CalenderWidget(
                                selectedDate: value.selectedDate ?? DateTime(2025,02,19),
                                monthlyScheduledMeetingList:
                                    value.monthlyScheduledMeetingList!,
                                onPageChanged: value.onPageChanged,
                                onDateSelected: value.onDateSelected,
                                onYearSelectionTap: () => value.onYearSelectionTap(context),
                                onMonthSelectionTap: () => value.onMonthSelectionTap(context),
                              ),
                              SizedBox(height: appSize.size16.h),
                              ScheduledEventsWidget(
                                  selectedDate: value.selectedDate,
                                  scheduledMeetings: value.schedulesForSelectedDate)
                            ],
                          );
                        } else {
                          return NoDataWidget(
                            selectedDate: value.selectedDate ?? DateTime.now(),
                            onPageChanged: value.onPageChanged,
                            onDateSelected: value.onDateSelected,
                            onYearSelectionTap: () => value.onYearSelectionTap(context),
                            onMonthSelectionTap:() =>  value.onMonthSelectionTap(context),
                          );
                        }
                      }),
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}
