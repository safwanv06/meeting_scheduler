import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:meet_sync/main.dart';
import 'package:meet_sync/utils/custom_bottom_sheet/custom_bottom_sheet.dart';
import 'package:meet_sync/view/calendar_screen/service/model/meeting_model.dart';
import 'package:meet_sync/view/calendar_screen/service/model/scheduled_meeting_model.dart';
import 'package:meet_sync/view/calendar_screen/service/service.dart';

class CalenderController extends ChangeNotifier {
  List<ScheduledMeetingModel>? monthlyScheduledMeetingList;

  List<MeetingModel>? schedulesForSelectedDate;

  DateTime? selectedDate;

  Future getCalenderData() async {
    CalenderService.getScheduledMeetings(
            year: selectedDate?.year ?? DateTime.now().year,
            month: selectedDate?.month ?? DateTime.now().month)
        .then(
      (value) {
        monthlyScheduledMeetingList = value;
        selectedDate ??= DateTime.now();
        List<MeetingModel>? meetings;
        monthlyScheduledMeetingList!.any(
          (element) {
            String dateFromEvent =
                DateFormat("yyyy-MM-dd").format(element.date);
            String dateFromSelected =
                DateFormat("yyyy-MM-dd").format(selectedDate ?? DateTime.now());
            if (dateFromEvent == dateFromSelected) {
              meetings = element.meetings;
            }
            return false;
          },
        );
        schedulesForSelectedDate = meetings;
        notifyListeners();
      },
    ).onError(
      (error, stackTrace) {
        monthlyScheduledMeetingList = [];
        notifyListeners();
      },
    );
  }

  onDateSelected(DateTime selected, DateTime focusedDate) {
    List<MeetingModel>? meetings;
    monthlyScheduledMeetingList!.any(
      (element) {
        String dateFromEvent = DateFormat("yyyy-MM-dd").format(element.date);
        String dateFromSelected = DateFormat("yyyy-MM-dd").format(selected);
        if (dateFromEvent == dateFromSelected) {
          meetings = element.meetings;
        }
        return false;
      },
    );
    schedulesForSelectedDate = meetings;
    selectedDate = selected;
    notifyListeners();
  }

  onPageChanged(DateTime focusedDay) {
    selectedDate = DateTime(
        focusedDay.year, focusedDay.month, selectedDate?.day ?? focusedDay.day);
    monthlyScheduledMeetingList = null;
    notifyListeners();
  }

  onMonthSelectionTap(BuildContext context) {
    customBottomSheet(
        context: context,
        child: Column(
          children: List.generate(12, (index) {
            return InkWell(
              onTap: () {
                selectedDate=DateTime(selectedDate?.year??DateTime.now().year,index+1,selectedDate?.day??DateTime.now().day);
                notifyListeners();
                Navigator.pop(context);
              },
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat.MMMM().format(DateTime(0, index + 1)),
                        style: fontStyles.font14GreyA9A9_600,
                      )
                    ],
                  ),
                  index == 11
                      ? SizedBox.shrink()
                      : Divider(
                          color: appColors.greyA9A9A9,
                          thickness: 0.5.h
                        )
                ],
              ),
            );
          }),
        ),
        title: "Select Month");
  }

  onYearSelectionTap(BuildContext context) {
    customBottomSheet(
        context: context,
        child: Column(
          children: List.generate(10, (index) {
            int year = DateTime.now().year - 5 + index;
            return InkWell(
              onTap: () {
                selectedDate=DateTime(year,selectedDate?.month??DateTime.now().month,selectedDate?.day??DateTime.now().day);
                notifyListeners();
                Navigator.pop(context);
              },
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        year.toString(),
                        style: fontStyles.font14GreyA9A9_600,
                      )
                    ],
                  ),
                  index == 11
                      ? SizedBox.shrink()
                      : Divider(
                      color: appColors.greyA9A9A9,
                      thickness: 0.5.h
                  )
                ],
              ),
            );
          }),
        ),
        title: "Select Month");
  }
}
