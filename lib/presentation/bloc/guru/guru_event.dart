part of 'guru_bloc.dart';

@freezed
class GuruEvent with _$GuruEvent {
  const factory GuruEvent.started() = _Started;
  const factory GuruEvent.fetch() = _Fetch;

}