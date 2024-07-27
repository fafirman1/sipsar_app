import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sipsar/data/models/response/event_response_model.dart';

import '../../../data/datasource/event_remote_datasource.dart';

part 'acara_event.dart';
part 'acara_state.dart';
part 'acara_bloc.freezed.dart';

class AcaraBloc extends Bloc<AcaraEvent, AcaraState> {
  final EventRemoteDatasource _eventRemoteDatasource;
  AcaraBloc(
    this._eventRemoteDatasource,
  ) : super(const _Initial()) {
    on<_Fetch>((event, emit) async{
      emit(const AcaraState.loading());
      final response = await _eventRemoteDatasource.getGuru();
      response.fold(
        (l) => emit(AcaraState.error(l)), 
        (r) => emit(AcaraState.success(r.data))
      );
    });
  }
}
