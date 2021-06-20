part of 'cheese_bloc.dart';

@immutable
abstract class CheeseEvent {}

class GetCheese extends CheeseEvent {
  final String cheeseName;
  GetCheese(this.cheeseName);
}

class ClearCheese extends CheeseEvent {
  // final String cheeseName;
  ClearCheese();
}
