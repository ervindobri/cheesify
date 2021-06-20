import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cheesify/models/cheese.dart';
import 'package:cheesify/models/repositories/cheese_repository.dart';
import 'package:meta/meta.dart';

part 'cheese_event.dart';
part 'cheese_state.dart';

class CheeseBloc extends Bloc<CheeseEvent, CheeseState> {
  final CheeseRepository _cheeseRepository;
  CheeseBloc(this._cheeseRepository) : super(CheeseInitial());

  @override
  Stream<CheeseState> mapEventToState(
    CheeseEvent event,
  ) async* {
    if (event is GetCheese) {
      try {
        yield CheeseLoading();
        final cheese = await _cheeseRepository.fetchCheese(event.cheeseName);
        yield CheeseLoaded(event.cheeseName, cheese);
      } catch (Exception) {
        yield CheeseError("Cheese search failed!");
      }
    } else {
      //Clear cheese event
      yield CheeseLoading();
      yield CheeseInitial();
    }
  }
}
