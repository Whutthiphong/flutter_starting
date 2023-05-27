import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:injectable/injectable.dart';

part 'one_event.dart';
part 'one_state.dart';

@injectable
class OneBloc extends Bloc<OneEvent, OneState> {
  OneBloc() : super(OneState(count: 4)) {
    on<OneEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<AddEvent>(onAddEvent);
    on<MinusEvent>(onMinusEvent);
    on<ResetEvent>(onResetEvent);
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
}
