import 'meeting_model.dart';

List<ScheduledMeetingModel> getScheduledMeetingsFromJson(List json) =>
    List.from(json.map(
      (e) => ScheduledMeetingModel.fromJson(e),
    ));

class ScheduledMeetingModel {
  ScheduledMeetingModel(
      {required this.date, required this.meetings, required this.meetingType});

  DateTime date;
  List<MeetingModel> meetings;
  MeetingType meetingType;

  factory ScheduledMeetingModel.fromJson(Map json) {
    DateTime eventDate = DateTime.parse(json["date"]);
    late MeetingType meetingType;
    if (eventDate.isAfter(DateTime(2025,02,19))) {
      meetingType = MeetingType.upcoming;
    } else if (eventDate == DateTime(2025,02,19)) {
      meetingType = MeetingType.current;
    } else {
      meetingType = MeetingType.previous;
    }
    return ScheduledMeetingModel(
        date: eventDate,
        meetingType: meetingType,
        meetings:
            List.from(json["items"].map((e) => MeetingModel.fromJson(e))));
  }
}

enum MeetingType { previous, current, upcoming }
