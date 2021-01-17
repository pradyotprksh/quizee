import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// A chunk of all the events which will be listened
/// by the common bloc and change the state based on events.
class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchQueryChange extends SearchEvent {
  SearchQueryChange({@required this.query});

  final String query;

  @override
  List<Object> get props => [query];
}
