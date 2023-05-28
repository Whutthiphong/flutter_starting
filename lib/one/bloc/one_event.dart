part of 'one_bloc.dart';

class OneEvent {}

class AddEvent extends OneEvent {}

class GetDataEvent extends OneEvent {}

class MinusEvent extends OneEvent {}

class ResetEvent extends OneEvent {
  final int numReset;

  ResetEvent(this.numReset);
}
