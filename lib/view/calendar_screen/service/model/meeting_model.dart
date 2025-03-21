class MeetingModel {
  MeetingModel({required this.id,
    required this.scheduleTitle,
    required this.scheduledTime,
    required this.hasConflict});

  String id;
  String scheduleTitle;
  String scheduledTime;
  bool hasConflict;

  factory MeetingModel.fromJson(Map json)=>
      MeetingModel(
          id: json["id"],
          scheduleTitle: json["title"],
          scheduledTime: json["time"],
          hasConflict: json["conflicted"]);
}
