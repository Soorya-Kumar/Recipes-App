import 'package:flutter/material.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FitlerScreen extends ConsumerWidget {
  const FitlerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("SETTINGS"),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        titleTextStyle: const TextStyle(
            color: Color.fromARGB(255, 247, 245, 245),
            fontSize: 25,
            fontStyle: FontStyle.italic),
      ),
      body: Column(children: [

        SwitchListTile(
          value: activeFilters[Filter.glutosefree]!,
          onChanged: (isOn) {
            ref
                .read(filtersProvider.notifier)
                .tooglefilters(Filter.glutosefree, isOn);
          },
          activeColor: Theme.of(context).colorScheme.secondary,
          title: Text(
            'Gluten-free',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          subtitle: Text(
            'Only Gluten-free meals will be displayed',
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          contentPadding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
        ),


        SwitchListTile(
          value: activeFilters[Filter.lactosefree]!,
          onChanged: (isOn) {
            ref
                .read(filtersProvider.notifier)
                .tooglefilters(Filter.lactosefree, isOn);
          },
          activeColor: Theme.of(context).colorScheme.tertiary,
          title: Text(
            'Lactose-free',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          subtitle: Text(
            'Only Lactose-free meals will be displayed',
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          contentPadding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
        ),


        SwitchListTile(
          value: activeFilters[Filter.vegeterian]!,
          onChanged: (isOn) {
            ref
                .read(filtersProvider.notifier)
                .tooglefilters(Filter.vegeterian, isOn);
          },
          activeColor: Theme.of(context).colorScheme.tertiary,
          title: Text(
            'Vegetarian',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          subtitle: Text(
            'Only Vegetarian meals will be displayed',
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          contentPadding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
        ),

        
        SwitchListTile(
          value: activeFilters[Filter.vegan]!,
          onChanged: (isOn) {
            ref
                .read(filtersProvider.notifier)
                .tooglefilters(Filter.vegan, isOn);
          },
          activeColor: Theme.of(context).colorScheme.tertiary,
          title: Text(
            'Vegan',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          subtitle: Text(
            'Only Vegan meals will be displayed',
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          contentPadding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
        ),
      ]),
    );
  }
}
