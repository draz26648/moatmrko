part of 'events_cubit.dart';

@immutable
abstract class EventsState {}

class EventsInitial extends EventsState {}

class EventsLoading extends EventsState {}

class EventsLoaded extends EventsState {
  final List<EventsModel> eventsModel;
  EventsLoaded({required this.eventsModel});
}

class EventsError extends EventsState {
  final String error;
  EventsError({required this.error});
}
