import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sipsar/data/datasource/guru_remote_datasource.dart';
import 'package:sipsar/data/models/response/guru_response_model.dart';

part 'guru_event.dart';
part 'guru_state.dart';
part 'guru_bloc.freezed.dart';

class GuruBloc extends Bloc<GuruEvent, GuruState> {
  final GuruRemoteDatasource _guruRemoteDatasource;
  GuruBloc(
    this._guruRemoteDatasource,
  ) : super(const _Initial()) {
    on<_Fetch>((event, emit) async{
      emit(const GuruState.loading());
      final response = await _guruRemoteDatasource.getGuru();
      response.fold(
        (l) => emit(GuruState.error(l)), 
        (r) => emit(GuruState.success(r.data as Guru))
      );
    });
  }
}
