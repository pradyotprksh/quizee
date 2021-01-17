import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

/// A state of the application after the bloc
/// executes the events.
class SearchState extends Equatable {
  const SearchState({
    this.searchStatus = SearchStatus.idle,
    this.errorMessage = '',
    this.wikiSearchResponse,
  });

  final SearchStatus searchStatus;
  final String errorMessage;
  final WikiSearchResponse wikiSearchResponse;

  SearchState copyWith({
    SearchStatus searchStatus,
    String errorMessage,
    WikiSearchResponse wikiSearchResponse,
  }) =>
      SearchState(
        searchStatus: searchStatus ?? this.searchStatus,
        errorMessage: errorMessage ?? this.errorMessage,
        wikiSearchResponse: wikiSearchResponse ?? this.wikiSearchResponse,
      );

  @override
  List<Object> get props => [searchStatus];
}
