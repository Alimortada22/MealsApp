import 'package:meals_app/models/category.dart';
import 'package:flutter/material.dart';


class CategoryGridView extends StatelessWidget {
  const CategoryGridView({super.key, required this.category,required this.onselectedcategory});
  final Categorys category;
  final void Function() onselectedcategory ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onselectedcategory,
      splashColor: Theme.of(context).focusColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(colors: [
                category.color.withOpacity(0.55),
                category.color.withOpacity(0.9)
              ])),
          child: Text(
            category.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          )),
    );
  }
}
