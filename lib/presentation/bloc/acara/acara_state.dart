part of 'acara_bloc.dart';

@freezed
class AcaraState with _$AcaraState {
  const factory AcaraState.initial() = _Initial;
  const factory AcaraState.loading() = _Loading;
  const factory AcaraState.success(List<Event> guru) = _Success;
  const factory AcaraState.error(String message) = _Error;
}
