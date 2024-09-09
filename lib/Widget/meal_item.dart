import 'package:flutter/material.dart';
import 'package:meals_app/Widget/meal_item_traid.dart';
import 'package:meals_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.mealdeti});
  final Meal meal;
  final void Function(Meal meal) mealdeti;
  get mealcomplexty {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  get mealaffortabelty {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          mealdeti(meal);
        },
        child: Stack(
          children: [
            Hero(
                tag: meal.id,
                child: FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl),
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                )),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                  color: Colors.black45,
                  child: Column(children: [
                    Text(
                      meal.title,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTraid(
                            icon: Icons.schedule,
                            label: "${meal.duration} min"),
                        const SizedBox(
                          width: 6,
                        ),
                        MealItemTraid(icon: Icons.work, label: mealcomplexty),
                        const SizedBox(
                          width: 6,
                        ),
                        MealItemTraid(
                            icon: Icons.attach_money, label: mealaffortabelty),
                      ],
                    )
                  ]),
                ))
          ],
        ),
      ),
    );
  }
}
