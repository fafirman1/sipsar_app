import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sipsar/data/datasource/pengumuman_remote_datasource.dart';

import '../../../data/models/response/pengumuman_response_model.dart';

part 'pengumuman_event.dart';
part 'pengumuman_state.dart';
part 'pengumuman_bloc.freezed.dart';

class PengumumanBloc extends Bloc<PengumumanEvent, PengumumanState> {
  final PengumumanRemoteDatasource _pengumumanRemoteDatasource;
  PengumumanBloc(
    this._pengumumanRemoteDatasource,
  ) : super(const _Initial()) {
    on<_Fetch>((event, emit) async{
      emit(const PengumumanState.loading());
      final response = await _pengumumanRemoteDatasource.getPengumuman();
      response.fold(
        (l) => emit(PengumumanState.error(l)), 
        (r) => emit(PengumumanState.success(r.data)));
    });
  }
}
