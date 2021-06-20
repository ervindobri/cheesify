part of 'cheese_bloc.dart';

@immutable
abstract class CheeseState {
  const CheeseState();
}
//Creating states first, because they are the reason you writing logic

//initial - with search bar and stuff
class CheeseInitial extends CheeseState {
  const CheeseInitial();
}

//searching -- loading
class CheeseLoading extends CheeseState {
  const CheeseLoading();
}

//successful
class CheeseLoaded extends CheeseState {
  final String query;
  final List<Cheese> cheese;
  const CheeseLoaded(this.query, this.cheese);

  // always override equality because sometimes it may not emit new state..
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CheeseLoaded && other.cheese == cheese;
  }

  @override
  int get hashCode => cheese.hashCode;
}

//getting cheese failed
class CheeseError extends CheeseState {
  final String error;
  const CheeseError(this.error);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CheeseError && other.error == error;
  }

  @override
  int get hashCode => error.hashCode;
}
