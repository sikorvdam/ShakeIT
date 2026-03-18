import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/sample_recipes.dart';
import '../../providers/favorites_provider.dart';
import '../../theme/app_theme.dart';
import '../../widgets/recipe_card.dart';
import 'recipe_details_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final searchResults = _searchQuery.isEmpty
        ? <dynamic>[]
        : searchRecipes(_searchQuery);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Szukaj'),
      ),
      body: Column(
        children: [
          // Pole wyszukiwania
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Wyszukaj przepis...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          _searchController.clear();
                          setState(() {
                            _searchQuery = '';
                          });
                        },
                        icon: const Icon(Icons.clear),
                      )
                    : null,
              ),
            ),
          ),
          // Wyniki wyszukiwania
          Expanded(
            child: _searchQuery.isEmpty
                ? _buildEmptyState()
                : searchResults.isEmpty
                    ? _buildNoResults()
                    : _buildSearchResults(searchResults, favoritesProvider),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            size: 80,
            color: AppTheme.textSecondary.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          Text(
            'Wyszukaj przepis',
            style: TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'Wpisz nazwę drinka, aby znaleźć przepis',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 32),
          // Szybkie tagi
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: [
              _QuickSearchChip(
                label: 'Mojito',
                onTap: () => _quickSearch('Mojito'),
              ),
              _QuickSearchChip(
                label: 'Margarita',
                onTap: () => _quickSearch('Margarita'),
              ),
              _QuickSearchChip(
                label: 'Tequila',
                onTap: () => _quickSearch('Tequila'),
              ),
              _QuickSearchChip(
                label: 'Whiskey',
                onTap: () => _quickSearch('Whiskey'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _quickSearch(String term) {
    _searchController.text = term;
    setState(() {
      _searchQuery = term;
    });
  }

  Widget _buildNoResults() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: 80,
            color: AppTheme.textSecondary.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          Text(
            'Brak wyników',
            style: TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'Nie znaleziono przepisów dla "$_searchQuery"',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults(
      List<dynamic> results, FavoritesProvider favoritesProvider) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text(
                'Wyniki wyszukiwania',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.primaryPurple.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${results.length}',
                  style: const TextStyle(
                    color: AppTheme.primaryPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(bottom: 80),
            itemCount: results.length,
            itemBuilder: (context, index) {
              final recipe = results[index];
              return RecipeCard(
                recipe: recipe,
                isFavorite: favoritesProvider.isFavorite(recipe.id),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RecipeDetailsScreen(recipe: recipe),
                    ),
                  );
                },
                onFavoriteToggle: () {
                  favoritesProvider.toggleFavorite(recipe.id);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class _QuickSearchChip extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _QuickSearchChip({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: AppTheme.primaryPurple.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppTheme.primaryPurple.withOpacity(0.5),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: AppTheme.primaryPurple,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}