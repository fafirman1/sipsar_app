part of 'acara_bloc.dart';

@freezed
class AcaraEvent with _$AcaraEvent {
  const factory AcaraEvent.started() = _Started;
  const factory AcaraEvent.fetch() = _Fetch;
}