part of 'pengumuman_bloc.dart';

@freezed
class PengumumanState with _$PengumumanState {
  const factory PengumumanState.initial() = _Initial;
  const factory PengumumanState.loading() = _Loading;
  const factory PengumumanState.success(List<Pengumuman> pengumuman) = _Success;
  const factory PengumumanState.error(String message) = _Error;
}
