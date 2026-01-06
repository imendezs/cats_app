import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/breeds_bloc.dart';
import '../bloc/breeds_event.dart';
import '../bloc/breeds_state.dart';
import '../widgets/breed_card.dart';
import 'breed_detail_page.dart';

class BreedsListPage extends StatefulWidget {
  const BreedsListPage({super.key});

  @override
  State<BreedsListPage> createState() => _BreedsListPageState();
}

class _BreedsListPageState extends State<BreedsListPage> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    context.read<BreedsBloc>().add(LoadBreedsEvent());
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= 
        _scrollController.position.maxScrollExtent - 200) {
      if (!_isLoadingMore) {
        _isLoadingMore = true;
        context.read<BreedsBloc>().add(LoadMoreBreedsEvent());
        Future.delayed(const Duration(seconds: 1), () {
          _isLoadingMore = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catbreeds')),
      body: Column(
        children: [
          _buildSearchBar(),
          Expanded(
            child: BlocBuilder<BreedsBloc, BreedsState>(
              builder: (context, state) {
                if (state is BreedsLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is BreedsLoadingMore) {
                  return _buildBreedsList(state, isLoadingMore: true);
                }
                if (state is BreedsLoaded) {
                  return _buildBreedsList(state, isLoadingMore: false);
                }
                if (state is BreedsError) {
                  return _buildErrorView(state.message);
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: _searchController,
        onChanged: (query) => context.read<BreedsBloc>().add(SearchBreedsEvent(query)),
        decoration: InputDecoration(
          hintText: 'Buscar raza...',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    context.read<BreedsBloc>().add(ClearSearchEvent());
                  },
                )
              : null,
        ),
      ),
    );
  }

  Widget _buildBreedsList(dynamic state, {required bool isLoadingMore}) {
    final breeds = state is BreedsLoaded ? state.filteredBreeds : state.filteredBreeds;
    final hasReachedMax = state is BreedsLoaded ? state.hasReachedMax : false;
  
    if (breeds.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text('No se encontraron razas', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text('Intenta con otro término de búsqueda', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      );
    }

    return ListView.builder(
      controller: _scrollController,
      itemCount: breeds.length + (isLoadingMore && !hasReachedMax ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == breeds.length && isLoadingMore && !hasReachedMax) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        
        final breed = breeds[index];
        return BreedCard(
          breed: breed,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => BreedDetailPage(breed: breed)),
          ),
        );
      },
    );
  }

  Widget _buildErrorView(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: Colors.red[300]),
          const SizedBox(height: 16),
          Text('Error', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(message, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () => context.read<BreedsBloc>().add(LoadBreedsEvent()),
            icon: const Icon(Icons.refresh),
            label: const Text('Reintentar'),
          ),
        ],
      ),
    );
  }
}
