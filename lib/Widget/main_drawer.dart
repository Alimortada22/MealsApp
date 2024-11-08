import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key,required this.setscreen});
  final void Function(String identifer) setscreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Icon(
                    Icons.fastfood,
                    size: 48,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Text(
                    "Cooking...up!",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  )
                ],
              )),
              ListTile(
                leading: Icon(Icons.restaurant,size: 26,color: Theme.of(context).colorScheme.onBackground,),
                title: Text("Meals",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Theme.of(context).colorScheme.onBackground,fontSize: 24)),
                onTap: (){
                  setscreen("Meals");
                },
              ),
                   ListTile(
                leading: Icon(Icons.settings_outlined,size: 26,color: Theme.of(context).colorScheme.onBackground,),
                title: Text("Filters",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Theme.of(context).colorScheme.onBackground,fontSize: 24)),
                onTap: (){
                  setscreen("Filters");
                },
              )
        ],
      ),
    );
  }
}
