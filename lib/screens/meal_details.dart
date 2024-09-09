import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/provider/favouritemeals_provider.dart';

class MealDetails extends ConsumerWidget {
  const MealDetails({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouritmeals=ref.watch(favouritemealsprovider);
    final isfavourite=favouritmeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                final wasadd = ref
                    .read(favouritemealsprovider.notifier)
                    .togglefavouritemeals(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(wasadd
                        ? "You add ${meal.title} to favourite list."
                        : "you remove ${meal.title} from afavourite list.")));
              },
              icon: AnimatedSwitcher(duration: const Duration(milliseconds: 300) ,
              transitionBuilder: (child,animation){
                return RotationTransition(turns: animation,child: child,);
              },
              child: Icon(isfavourite? Icons.star : Icons.star_border,key: ValueKey(isfavourite),)),
               ) 
        ],
      ),
      body: ListView(
        children: [
          Hero(tag: meal.id, child: Image.network(meal.imageUrl)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Ingredients",
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 32,
                    ),
                  ),
                  ...meal.ingredients.map((e) => Text(
                        e,
                        style: const TextStyle(color: Colors.white),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Steps",
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 32,
                      )),
                  ...meal.steps.map((e) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Text(e,
                            style: const TextStyle(
                              color: Colors.white,
                            )),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
