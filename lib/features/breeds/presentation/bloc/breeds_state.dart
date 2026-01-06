import 'package:equatable/equatable.dart';
import '../../domain/entities/breed.dart';

abstract class BreedsState extends Equatable {
  const BreedsState();

  @override
  List<Object> get props => [];
}

class BreedsInitial extends BreedsState {}

class BreedsLoading extends BreedsState {}

class BreedsLoadingMore extends BreedsState {
  final List<Breed> breeds;
  final List<Breed> filteredBreeds;
  final String searchQuery;

  const BreedsLoadingMore({
    required this.breeds,
    required this.filteredBreeds,
    this.searchQuery = '',
  });

  @override
  List<Object> get props => [breeds, filteredBreeds, searchQuery];
}

class BreedsLoaded extends BreedsState {
  final List<Breed> breeds;
  final List<Breed> filteredBreeds;
  final String searchQuery;
  final bool hasReachedMax;

  const BreedsLoaded({
    required this.breeds,
    required this.filteredBreeds,
    this.searchQuery = '',
    this.hasReachedMax = false,
  });

  @override
  List<Object> get props => [breeds, filteredBreeds, searchQuery, hasReachedMax];

  BreedsLoaded copyWith({
    List<Breed>? breeds,
    List<Breed>? filteredBreeds,
    String? searchQuery,
    bool? hasReachedMax,
  }) {
    return BreedsLoaded(
      breeds: breeds ?? this.breeds,
      filteredBreeds: filteredBreeds ?? this.filteredBreeds,
      searchQuery: searchQuery ?? this.searchQuery,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}

class BreedsError extends BreedsState {
  final String message;

  const BreedsError(this.message);

  @override
  List<Object> get props => [message];
}
