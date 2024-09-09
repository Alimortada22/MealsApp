import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/filters_providers.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activefilters = ref.watch(filterprovider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: Column(children: [
        SwitchListTile(
          value: activefilters[Filters.goltenfree]!,
          onChanged: (ischecked) {
            ref
                .read(filterprovider.notifier)
                .setfilter(Filters.goltenfree, ischecked);
          },
          title: Text(
            "Gulten-Free",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          subtitle: Text(
            "Only include gulten-free meals.",
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
        SwitchListTile(
          value: activefilters[Filters.lactosfree]!,
          onChanged: (ischecked) {
            ref
                .read(filterprovider.notifier)
                .setfilter(Filters.lactosfree, ischecked);
          },
          title: Text(
            "Lactos-Free",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          subtitle: Text(
            "Only include lactos-free meals.",
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
        SwitchListTile(
          value: activefilters[Filters.vegetarian]!,
          onChanged: (ischecked) {
            ref
                .read(filterprovider.notifier)
                .setfilter(Filters.vegetarian, ischecked);
          },
          title: Text(
            "Vegetarian",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          subtitle: Text(
            "Only include Vegetarian meals.",
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
        SwitchListTile(
          value: activefilters[Filters.vegan]!,
          onChanged: (ischecked) {
            ref
                .read(filterprovider.notifier)
                .setfilter(Filters.vegan, ischecked);
          },
          title: Text(
            "Vegan",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          subtitle: Text(
            "Only include vegan meals.",
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
      ]),
    );
  }
}
