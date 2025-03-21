import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meet_sync/main.dart';
import 'package:meet_sync/view/calendar_screen/view/widgets/events_widget/meeting_header_widget.dart';
import 'package:meet_sync/view/calendar_screen/view/widgets/events_widget/meeting_tile.dart';
import 'package:meet_sync/view/calendar_screen/view/widgets/events_widget/no_meetings_widget.dart';

import '../../../service/model/meeting_model.dart';

class ScheduledEventsWidget extends StatelessWidget {
  const ScheduledEventsWidget(
      {super.key, required this.scheduledMeetings, required this.selectedDate});

  final List<MeetingModel>? scheduledMeetings;
  final DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return scheduledMeetings != null
        ? Column(
            children: [
              MeetingHeaderWidget(),
              SizedBox(height: appSize.size12.h),
              ListView.builder(
                itemCount: scheduledMeetings!.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  MeetingModel meeting = scheduledMeetings![index];
                  return MeetingTile(
                      meeting: meeting,
                      currentDate: selectedDate ?? DateTime.now());
                },
              ),
            ],
          )
        : NoMeetingsWidget();
  }
}
