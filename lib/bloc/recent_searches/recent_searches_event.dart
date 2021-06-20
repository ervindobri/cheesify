part of 'recent_searches_bloc.dart';

@immutable
abstract class RecentSearchesEvent {}

class GetRecentSearch extends RecentSearchesEvent {
  final List<String> recent;
  GetRecentSearch(this.recent);
}

class AddRecentSearch extends RecentSearchesEvent {
  final String cheeseName;
  AddRecentSearch(this.cheeseName);
}

class RemoveRecentSearch extends RecentSearchesEvent {
  final String cheeseName;
  RemoveRecentSearch(this.cheeseName);
}
