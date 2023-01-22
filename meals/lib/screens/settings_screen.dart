import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {

  final Settings settings;
  final Function(Settings) onSettingsChanged;
  
  const SettingsScreen({
    final Key? key,
    required this.settings,
    required this.onSettingsChanged,
  }) : super(key : key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  var settings;

  @override
  void initState() {
    settings = widget.settings;
    super.initState();
  }

  Widget _createSwitch(String title, String subtitle, bool value, Function(bool)? onChanged) {
    
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value, 
      onChanged: (value) {
        onChanged!(value);
        widget.onSettingsChanged(settings);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Filters', 
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  'GlutenFree', 
                  'shows only meals that not contain gluten', 
                  settings.isGlutenFree, 
                  (value) => setState(() => settings.isGlutenFree = value),
                ),
                _createSwitch(
                  'LactoseFree', 
                  'shows only meals that not contain lactose', 
                  settings.isLactoseFree, 
                  (value) => setState(() => settings.isLactoseFree = value),
                ),
                _createSwitch(
                  'Vegan', 
                  'shows only meals that are vegan', 
                  settings.isVegan, 
                  (value) => setState(() => settings.isVegan = value),
                ),
                _createSwitch(
                  'Vegetarian', 
                  'shows only meals that are vegetarian', 
                  settings.isVegetarian, 
                  (value) => setState(() => settings.isVegetarian = value),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}