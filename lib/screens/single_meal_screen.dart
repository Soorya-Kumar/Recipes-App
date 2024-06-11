import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal_class.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/providers/favmeals_provider.dart';

class SingleMealScreen extends ConsumerWidget {
  const SingleMealScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final favlist = ref.watch(favmealsProvider);
    final isInFav = favlist.contains(meal);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(meal.title),
        titleTextStyle: const TextStyle(
            color: Color.fromARGB(255, 247, 245, 245),
            fontSize: 25,
            fontStyle: FontStyle.italic),
        actions: [
          IconButton(
            onPressed: () {
              bool isAdded =
                  ref.read(favmealsProvider.notifier).favmealToggle(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(isAdded
                      ? 'Item is removed from the favourites'
                      : 'Item is added to the favourites'),
                ),
              );
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) => RotationTransition(
                turns: Tween<double>(
                  begin: 0.9,
                  end: 1,
                ).animate(animation),
                child: child,
              ),
              child: Icon(
                isInFav ? Icons.star : Icons.star_border_rounded,
                key: ValueKey(isInFav),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
            decelerationRate: ScrollDecelerationRate.fast),
        children: [
          Image(
            image: NetworkImage(meal.imageUrl),
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200,
          ),
          const SizedBox(height: 20),
          Text(
            "INGREDIENTS ",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 20),
          for (final items in meal.ingredients)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              child: Text(
                items,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 20,
                    ),
              ),
            ),
          const SizedBox(height: 40),
          Text(
            "INSTRUCTIONS ",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 20),
          for (final items in meal.steps)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              child: Text(
                items,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 20,
                    ),
              ),
            ),
        ],
      ),
    );
  }
}
