// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:sipsar/data/datasource/profile_remote_datasource.dart';

import '../../../data/models/response/profile_responseModel.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRemoteDatasource _profileRemoteDatasource;
  ProfileBloc(
    this._profileRemoteDatasource,
  ) : super(const _Initial()) {
    on<_Fetch>((event, emit) async{
      emit(const ProfileState.loading());
      final response = await _profileRemoteDatasource.getProducts();
      response.fold(
        (l) => emit(ProfileState.error(l)), 
        (r) => emit(ProfileState.success(r.data))
      );
    });
  }
}
