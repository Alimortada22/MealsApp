import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/Widget/main_drawer.dart';
import 'package:meals_app/provider/favouritemeals_provider.dart';
import 'package:meals_app/provider/filters_providers.dart';
import 'package:meals_app/screens/categores.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';

class TapsScreen extends ConsumerStatefulWidget {
  const TapsScreen({super.key});
  @override
  ConsumerState<TapsScreen> createState() {
    return _TapsScreen();
  }
}

class _TapsScreen extends ConsumerState<TapsScreen> {
  int _selectedindex = 0;

  void navtap(index) {
    setState(() {
      _selectedindex = index;
    });
  }

  void setscreen(String identifer) async {
    Navigator.of(context).pop();
    if (identifer == "Filters") {
      await Navigator.of(context).push<Map<Filters, bool>>(
          MaterialPageRoute(builder: (ctx) => const FilterScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final availablemeals = ref.watch(filtermealsprovider);
    String title = "Categores";
    Widget activepage = CategoresScreen(
      availablemeals: availablemeals,
    );
    if (_selectedindex == 1) {
      final favouritmeal = ref.watch(favouritemealsprovider);
      activepage = MealsScreen(
        meals: favouritmeal,
      );
      title = "Favourite";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: MainDrawer(
        setscreen: setscreen,
      ),
      body: activepage,
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            navtap(index);
          },
          currentIndex: _selectedindex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: "Categores"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favourit")
          ]),
    );
  }
}
