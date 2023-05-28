part of 'one_bloc.dart';

enum OneEnum { init, saveSuccess, isLoading }

class OneState extends Equatable {
  final int count;
  final OneEnum en;
  final GetModelV1? data1;
  OneState({
    required this.count,
    this.en = OneEnum.init,
    this.data1,
  });

  OneState copyWith({int? newCountaa, OneEnum? newEn, GetModelV1? newData1}) {
    return OneState(
      count: newCountaa ?? count,
      en: newEn ?? en,
      data1: newData1 ?? data1,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [count, en, data1];
}
