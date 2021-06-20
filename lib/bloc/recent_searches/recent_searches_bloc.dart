import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cheesify/constants/data.dart';
import 'package:cheesify/models/repositories/cheese_repository.dart';
import 'package:meta/meta.dart';

part 'recent_searches_event.dart';
part 'recent_searches_state.dart';

class RecentSearchesBloc
    extends Bloc<RecentSearchesEvent, RecentSearchesState> {
  final CheeseRepository _cheeseRepository;

  RecentSearchesBloc(this._cheeseRepository) : super(RecentSearchesInitial());

  @override
  Stream<RecentSearchesState> mapEventToState(
    RecentSearchesEvent event,
  ) async* {
    if (event is GetRecentSearch) {
      print("Getting recent!");
      yield RecentSearchesInitial();
    } else if (event is AddRecentSearch) {
      yield RecentSearchesLoading();
      var recent = await _cheeseRepository.fetchRecentSearches();
      recent.add(event.cheeseName);
      yield RecentSearchesLoaded(recent);
    } else if (event is RemoveRecentSearch) {
      var recent = await _cheeseRepository.fetchRecentSearches();
      recent.remove(event.cheeseName);
      yield RecentSearchesRemoved();
      if (recent.isNotEmpty) {
        print("Removed!");
        yield RecentSearchesLoaded(recent);
      } else {
        yield RecentSearchesEmpty();
      }
    } else {
      //pass
      print("Else: $event");
      yield RecentSearchesLoading();
      var recent = await _cheeseRepository.fetchRecentSearches();
      yield RecentSearchesLoaded(recent);
    }
  }
}
