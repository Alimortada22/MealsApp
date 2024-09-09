import 'package:flutter/material.dart';
import 'package:meals_app/Widget/meal_item.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key, this.title, required this.meals});
  final String? title;
  final List<Meal> meals;

  void mealdeti(BuildContext context, Meal mel) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealDetails(
              meal: mel,
              
            )));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
              meal: meals[index],
              mealdeti: (meal) {
                mealdeti(context, meal);
              },
            ));
    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('oh ouh.....nothing here!',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
            const SizedBox(
              height: 15,
            ),
            Text(
              'try different category!.',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            )
          ],
        ),
      );
    }
    if (title == null) {
      return content;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content);
  }
}
