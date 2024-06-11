import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favmeals_provider.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/w_side_drawer.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/providers/filters_provider.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreen();
  }
}

class _TabsScreen extends ConsumerState<TabsScreen> {
  int _selectedpage = 0;

  void _changeselectpage(int index) {
    setState(() {
      _selectedpage = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FitlerScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String activepagetitle = 'MENU CARD';

    Widget activepage = const CategoriesScreen();

    if (_selectedpage == 1) {
      final favoriteMeals = ref.watch(favmealsProvider);
      activepage = MealsScreen(
        meals: favoriteMeals,
      );
      activepagetitle = 'FAVORITES';
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          title: Text(activepagetitle),
          titleTextStyle: const TextStyle(
              color: Color.fromARGB(255, 247, 245, 245),
              fontSize: 25,
              fontStyle: FontStyle.italic),
        ),
        drawer: SideDrawer(onSelectTile: _setScreen),
        body: activepage,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _changeselectpage,
          currentIndex: _selectedpage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_border_rounded),
              label: 'Favorites',
            ),
          ],
        ),
      ),
    );
  }
}
