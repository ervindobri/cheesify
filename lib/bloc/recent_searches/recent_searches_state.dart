part of 'recent_searches_bloc.dart';

@immutable
abstract class RecentSearchesState {
  const RecentSearchesState();
}

class RecentSearchesInitial extends RecentSearchesState {
  const RecentSearchesInitial();
}

class RecentSearchesLoading extends RecentSearchesState {
  const RecentSearchesLoading();
}

class RecentSearchesLoaded extends RecentSearchesState {
  final List<String> recent;
  const RecentSearchesLoaded(this.recent);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RecentSearchesLoaded && other.recent == recent;
  }

  @override
  int get hashCode => recent.hashCode;
}

class RecentSearchesRemoved extends RecentSearchesState {
  const RecentSearchesRemoved();
}

class RecentSearchesEmpty extends RecentSearchesState {
  const RecentSearchesEmpty();
}
