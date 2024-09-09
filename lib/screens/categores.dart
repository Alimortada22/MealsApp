import 'package:flutter/material.dart';
import 'package:meals_app/Widget/grid_view_item.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/models/category.dart';

class CategoresScreen extends StatefulWidget {
  const CategoresScreen({super.key, required this.availablemeals});
  final List<Meal> availablemeals;

  @override
  State<CategoresScreen> createState() => _CategoresScreenState();
}

class _CategoresScreenState extends State<CategoresScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
        lowerBound: 0,
        upperBound: 1);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void selectedcategory(BuildContext context, Categorys category) {
    final filteredmeal = widget.availablemeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(
              title: category.title,
              meals: filteredmeal,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 3.3 / 2),
          children: [
            ...availablecategores.map((e) => CategoryGridView(
                  category: e,
                  onselectedcategory: () {
                    selectedcategory(context, e);
                  },
                ))
          ],
        ),
        builder: (BuildContext context, child) => SlideTransition(position:Tween(
          begin: const Offset(0, -0.3),
          end: const Offset(0, 0)
        ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),),child: child,));
  }
}
