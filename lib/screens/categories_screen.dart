import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal_class.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/w_grid_category.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category_class.dart';
import 'package:meals_app/providers/filters_provider.dart';

class CategoriesScreen extends ConsumerWidget {
  const CategoriesScreen({
    super.key,
  });

  void _selectcategory(BuildContext context, CategoryData category, List<Meal> listMeals, Map<Filter, bool> currentFilters) {
    
    final availableMeals = listMeals.where((meal) {
      if (currentFilters[Filter.glutosefree]! && !meal.isGlutenFree) return false;
      if (currentFilters[Filter.lactosefree]! && !meal.isLactoseFree) return false;
      if (currentFilters[Filter.vegeterian]! && !meal.isVegetarian) return false;
      if (currentFilters[Filter.vegan]! && !meal.isVegan) return false;
      return true;
    }).toList();

    final filtered = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filtered,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: GridView(
        padding: const EdgeInsets.fromLTRB(5, 50, 5, 5),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        physics: const BouncingScrollPhysics(
          decelerationRate: ScrollDecelerationRate.fast,
        ),
        children: [
          for (final category in availableCategorires)
            WGridItem(
              category: category,
              onselectCategory: () {
                final argumentMeals = ref.watch(mealsProvider);
                final currentFilters = ref.watch(filtersProvider);
                _selectcategory(context, category, argumentMeals, currentFilters);
              },
            )
        ],
      ),
    );
  }
}
