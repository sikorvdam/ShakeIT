import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/sample_recipes.dart';
import '../../providers/favorites_provider.dart';
import '../../theme/app_theme.dart';
import '../../widgets/recipe_card.dart';
import 'recipe_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recipes = sampleRecipes;
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Nagłówek
          SliverAppBar(
            floating: true,
            backgroundColor: AppTheme.darkBackground,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.local_bar,
                  color: AppTheme.neonAccent,
                  size: 32,
                ),
                const SizedBox(width: 8),
                const Text(
                  'ShakeIt',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: AppTheme.neonAccent,
                  ),
                ),
              ],
            ),
            centerTitle: true,
          ),
          // Powitanie
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cześć, Barmanie! 🍸',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Odkryj przepisy na pyszne drinki',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
          // Statystyki
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _StatCard(
                    icon: Icons.local_bar,
                    label: 'Przepisów',
                    value: '${recipes.length}',
                    color: AppTheme.primaryPurple,
                  ),
                  const SizedBox(width: 12),
                  _StatCard(
                    icon: Icons.category,
                    label: 'Kategorie',
                    value: '${getCategories().length}',
                    color: AppTheme.neonAccent,
                  ),
                  const SizedBox(width: 12),
                  _StatCard(
                    icon: Icons.favorite,
                    label: 'Ulubione',
                    value: '${favoritesProvider.getFavoriteRecipes(recipes).length}',
                    color: Colors.redAccent,
                  ),
                ],
              ),
            ),
          ),
          // Tytuł sekcji
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
              child: Text(
                'Wszystkie przepisy',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          // Lista przepisów
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final recipe = recipes[index];
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
              childCount: recipes.length,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 80),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.15),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                color: color,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                color: color.withOpacity(0.8),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}