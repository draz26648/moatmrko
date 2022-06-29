import 'package:moatamrk/constant/end_points.dart';
import 'package:moatamrk/data/api/network.dart';
import 'package:moatamrk/data/models/events_model.dart';

import '../models/all_insturctorsModel.dart';

abstract class DataRepo {
  static Future<List<EventsModel>> getAllEvents() async {
    final events =
        await NetworkHelper().getAllEvents(url: EndPoints.GET_EVENTS);
    return events.map((event) => EventsModel.fromJson(event)).toList();
  }

  static Future<List<AllInstructorsModel>> getAllInstructors() async {
    final events =
        await NetworkHelper().getAllEvents(url: EndPoints.GET_INSTRUCTORS);
    return events.map((event) => AllInstructorsModel.fromJson(event)).toList();
  }
}
