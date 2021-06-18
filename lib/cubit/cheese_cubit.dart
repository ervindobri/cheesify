import 'package:cheesify/models/cheese.dart';
import 'package:cheesify/models/repositories/cheese_repository.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

part 'cheese_state.dart';

class CheeseCubit extends Cubit<CheeseState> {
  final CheeseRepository _cheeseRepository;
  CheeseCubit(this._cheeseRepository) : super(CheeseInitial());

  Future<void> getCheese(String name) async {
    try {
      emit(CheeseLoading());
      final cheese = await _cheeseRepository.fetchCheese(name);
      emit(CheeseLoaded(name, cheese));
    } catch (Exception) {
      emit(CheeseError("Cheese search failed!"));
    }
  }

  void clearQuery() {
    emit(CheeseLoading());
    emit(CheeseInitial());
  }
}
