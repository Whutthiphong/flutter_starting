import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:injectable/injectable.dart';

part 'seconde_event.dart';
part 'seconde_state.dart';

@injectable
class SecondeBloc extends Bloc<SecondeEvent, SecondeState> {
  SecondeBloc() : super(SecondeInitial()) {
    on<SecondeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
