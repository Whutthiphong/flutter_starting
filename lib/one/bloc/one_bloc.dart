import 'dart:async';

import 'package:app_starting/core/network/api.dart';
import 'package:app_starting/one/models/get-model-v1.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:injectable/injectable.dart';

import '../../../core/respository/base_repository.dart';
part 'one_event.dart';
part 'one_state.dart';

@injectable
class OneBloc extends Bloc<OneEvent, OneState> with BaseRepository {
  final ApiProvider _apiProvider;
  OneBloc(this._apiProvider) : super(OneState(count: 4)) {
    on<OneEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<AddEvent>(onAddEvent);
    on<MinusEvent>(onMinusEvent);
    on<ResetEvent>(onResetEvent);
    on<GetDataEvent>(onGetData);
  }

  FutureOr<void> onAddEvent(AddEvent event, Emitter<OneState> emit) {
    emit(state.copyWith(newCountaa: state.count + 1));
  }

  FutureOr<void> onMinusEvent(MinusEvent event, Emitter<OneState> emit) {
    emit(state.copyWith(newCountaa: state.count - 1));
  }

  Future<FutureOr<void>> onResetEvent(
      ResetEvent event, Emitter<OneState> emit) async {
    emit(state.copyWith(newEn: OneEnum.init));
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(newEn: OneEnum.saveSuccess));
    emit(state.copyWith(newEn: OneEnum.init));
  }

  Future<FutureOr<void>> onGetData(
      GetDataEvent event, Emitter<OneState> emit) async {
    emit(state.copyWith(newEn: OneEnum.isLoading));
    await Future.delayed(Duration(seconds: 2));
    var resp = responseHandler(await _apiProvider.get('products/2'));
    GetModelV1 data1 = GetModelV1.fromJson(resp.data);
    emit(state.copyWith(newData1: data1, newEn: OneEnum.init));
  }
}
