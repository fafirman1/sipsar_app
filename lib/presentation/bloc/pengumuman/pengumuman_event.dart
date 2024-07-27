part of 'pengumuman_bloc.dart';

@freezed
class PengumumanEvent with _$PengumumanEvent {
  const factory PengumumanEvent.started() = _Started;
  const factory PengumumanEvent.fetch() = _Fetch;
}