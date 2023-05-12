part of 'reading_bloc.dart';

@freezed
class ReadingEvent with _$ReadingEvent {
  const factory ReadingEvent.started(String name) = _Started;
}
