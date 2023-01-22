import 'package:flutter/material.dart';
import 'package:meals/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _createItem(IconData icon, String label, Function()? onTap) {
    return ListTile(
      leading: Icon( 
        icon, 
        size: 16,
      ),
      title: Text(
        label, 
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).secondaryHeaderColor,
            alignment: Alignment.bottomRight,
            child: Text(
              'Let\'s Cook!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor
              ),
            ),
          ),
          const SizedBox(height: 20),
          _createItem(
            Icons.restaurant, 
            'Recipes',
            () => Navigator.of(context).pushReplacementNamed(AppRoutes.home),
          ),
          _createItem(
            Icons.settings, 
            'Settings',
            () => Navigator.of(context).pushReplacementNamed(AppRoutes.settings),
          )
        ],
      ),
    );
  }
}