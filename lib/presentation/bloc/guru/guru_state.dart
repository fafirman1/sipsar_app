part of 'guru_bloc.dart';

@freezed
class GuruState with _$GuruState {
  const factory GuruState.initial() = _Initial;
  const factory GuruState.loading() = _Loading;
  const factory GuruState.success(List<Guru> guru) = _Success;
  const factory GuruState.error(String message) = _Error;
}
