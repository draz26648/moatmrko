import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:moatamrk/constant/end_points.dart';
import 'package:moatamrk/data/api/network.dart';
import 'package:moatamrk/data/models/events_model.dart';
import 'package:moatamrk/data/repository/data_repo.dart';

part 'events_state.dart';

class EventsCubit extends Cubit<EventsState> {
  EventsCubit() : super(EventsInitial());
  List<EventsModel> events = [];

  void getAllEvents() async {
    emit(EventsLoading());
    try {
      await DataRepo.getAllEvents().then((value) {
        events = value;
        emit(EventsLoaded(eventsModel: value));
      });
    } catch (e) {
      emit(EventsError(error: e.toString()));
    }
  }
}
