import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favorite_sceeen.dart';

class TabsScreen extends StatefulWidget {

  final List<Meal> favoriteMeals;
  
  const TabsScreen({
    final Key? key,
    required this.favoriteMeals,
  }) : super (key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  late List<Map<String, Object>> _screens;
  int _selectedScreenIndex = 0;

  @override
  void initState() {
    _screens = [
    {'title': 'Recipes Categories', 'screen': const CategoriesScreen()},
    {'title': 'Favorite Recipes', 'screen': FavoriteScreen(favoriteMeals: widget.favoriteMeals)},
    ];
    super.initState();
  }


  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _screens[_selectedScreenIndex]['title'] as String
        ),
        centerTitle: true,
      ),
      drawer: const MainDrawer(),
      body: _screens[_selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).secondaryHeaderColor,
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites'
          ),
        ],
      ),
    );
  }
}