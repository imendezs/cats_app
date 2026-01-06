import 'package:equatable/equatable.dart';

abstract class BreedsEvent extends Equatable {
  const BreedsEvent();

  @override
  List<Object> get props => [];
}

class LoadBreedsEvent extends BreedsEvent {}

class LoadMoreBreedsEvent extends BreedsEvent {}

class SearchBreedsEvent extends BreedsEvent {
  final String query;

  const SearchBreedsEvent(this.query);

  @override
  List<Object> get props => [query];
}

class ClearSearchEvent extends BreedsEvent {}
