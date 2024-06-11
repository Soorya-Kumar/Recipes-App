import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key, required this.onSelectTile});

  final void Function(String identifier) onSelectTile;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.5),
                ],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood_outlined,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  size: 40,
                ),
                const SizedBox(width: 20,),
                Text(
                  'COOKING IS AN ART',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant_menu,
              size: 26,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            onTap: () { onSelectTile('meals');},
            title: const Text(
              'MEALS',
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.settings_applications,
              size: 26,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            onTap: () { onSelectTile('filters');},
            title: const Text(
              'FILTERS',
            ),
          ),
        ],
      ),
    );
  }
}
