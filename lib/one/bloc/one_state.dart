part of 'one_bloc.dart';

enum OneEnum { init, saveSuccess }

class OneState extends Equatable {
  final int count;
  final OneEnum en;
  OneState({
    required this.count,
    this.en = OneEnum.init,
  });

  OneState copyWith({int? newCountaa, OneEnum? newEn}) {
    return OneState(count: newCountaa ?? count, en: newEn ?? en);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [count, en];
}
