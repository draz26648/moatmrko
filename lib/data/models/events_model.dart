// To parse this JSON data, do
//
//     final eventsModel = eventsModelFromJson(jsonString);

import 'dart:convert';

List<EventsModel> eventsModelFromJson(String str) => List<EventsModel>.from(
    json.decode(str).map((x) => EventsModel.fromJson(x)));

class EventsModel {
  EventsModel({
    this.id,
    this.instructorId,
    this.title,
    this.subject,
    this.desc,
    this.startDate,
    this.endDate,
    this.hall,
    this.video,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? instructorId;
  String? title;
  String? subject;
  String? desc;
  DateTime? startDate;
  DateTime? endDate;
  String? hall;
  String? video;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory EventsModel.fromJson(Map<String, dynamic> json) => EventsModel(
        id: json["id"],
        instructorId: json["instructor_id"],
        title: json["title"],
        subject: json["subject"],
        desc: json["desc"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        hall: json["hall"],
        video: json["video"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}
