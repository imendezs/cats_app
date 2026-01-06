import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/breed.dart';
import '../../domain/usecases/get_breeds.dart';
import '../../../../core/utils/usecase.dart';
import 'breeds_event.dart';
import 'breeds_state.dart';

class BreedsBloc extends Bloc<BreedsEvent, BreedsState> {
  final GetBreeds getBreeds;
  static const int _pageSize = 20;

  BreedsBloc({required this.getBreeds}) : super(BreedsInitial()) {
    on<LoadBreedsEvent>(_onLoadBreeds);
    on<LoadMoreBreedsEvent>(_onLoadMoreBreeds);
    on<SearchBreedsEvent>(_onSearchBreeds);
    on<ClearSearchEvent>((event, emit) => add(const SearchBreedsEvent('')));
  }

  Future<void> _onLoadBreeds(LoadBreedsEvent event, Emitter<BreedsState> emit) async {
    emit(BreedsLoading());
    final result = await getBreeds(GetBreedsParams(page: 0, limit: _pageSize));
    result.fold(
      (failure) => emit(BreedsError(failure.message)),
      (breeds) => emit(BreedsLoaded(
        breeds: breeds,
        filteredBreeds: breeds,
        hasReachedMax: breeds.length < _pageSize,
      )),
    );
  }

  Future<void> _onLoadMoreBreeds(LoadMoreBreedsEvent event, Emitter<BreedsState> emit) async {
    if (state is! BreedsLoaded) return;
    
    final currentState = state as BreedsLoaded;
    if (currentState.hasReachedMax) return;

    emit(BreedsLoadingMore(
      breeds: currentState.breeds,
      filteredBreeds: currentState.filteredBreeds,
      searchQuery: currentState.searchQuery,
    ));

    final nextPage = (currentState.breeds.length / _pageSize).floor();
    final result = await getBreeds(GetBreedsParams(page: nextPage, limit: _pageSize));
    
    result.fold(
      (failure) => emit(BreedsError(failure.message)),
      (newBreeds) {
        final updatedBreeds = [...currentState.breeds, ...newBreeds];
        final hasReachedMax = newBreeds.length < _pageSize;
        
        emit(BreedsLoaded(
          breeds: updatedBreeds,
          filteredBreeds: _filterBreeds(updatedBreeds, currentState.searchQuery),
          searchQuery: currentState.searchQuery,
          hasReachedMax: hasReachedMax,
        ));
      },
    );
  }

  void _onSearchBreeds(SearchBreedsEvent event, Emitter<BreedsState> emit) {
    if (state is! BreedsLoaded) return;
    final currentState = state as BreedsLoaded;
    final filtered = _filterBreeds(currentState.breeds, event.query);
    emit(currentState.copyWith(filteredBreeds: filtered, searchQuery: event.query));
  }

  List<Breed> _filterBreeds(List<Breed> breeds, String query) {
    if (query.isEmpty) return breeds;
    return breeds.where((b) => b.name.toLowerCase().contains(query.toLowerCase())).toList();
  }
}
