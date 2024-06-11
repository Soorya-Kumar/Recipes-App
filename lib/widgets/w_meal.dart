import 'package:meals_app/widgets/w_meta_data.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_class.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onselectmeal});

  final Meal meal;
  final void Function(Meal meal) onselectmeal;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 8,
      child: InkWell(
        onTap: () {
          onselectmeal(meal);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                color: Colors.black54,
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealMetaData(
                          icon: Icons.access_alarm_rounded,
                          label: '${meal.duration} min',
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        MealMetaData(
                          icon: Icons.anchor_rounded,
                          label:
                              meal.complexity.name[0].toUpperCase().toString() +
                                  meal.complexity.name.substring(1).toString(),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        MealMetaData(
                          icon: Icons.attach_money_sharp,
                          label: meal.affordability.name[0].toUpperCase() +
                              meal.affordability.name.substring(1),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
