import 'package:meals_app/models/meal_class.dart';
import 'package:meals_app/screens/single_meal_screen.dart';
import 'package:meals_app/widgets/w_meal.dart';
import 'package:flutter/material.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });

  final List<Meal> meals;
  final String? title;

  void selectedmeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => SingleMealScreen(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) => MealItem(
        meal: meals[index],
        onselectmeal: (meal) {
          selectedmeal(context, meal);
        },
      ),
    );

    if (meals.isEmpty) {
      content = const Center(
        child: Text("NO DATA PRESENT COME BACK SOON !!"),
      );
    }

    if (title == null) return content;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          title: Text(title!),
          titleTextStyle: const TextStyle(
              color: Color.fromARGB(255, 247, 245, 245),
              fontSize: 20,
              fontStyle: FontStyle.italic),
        ),
        body: content,
      ),
    );
  }
}
