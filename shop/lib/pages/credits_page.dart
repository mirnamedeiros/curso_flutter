import 'package:flutter/material.dart';
import 'package:shop/components/app_drawer.dart';

class CreditsPage extends StatelessWidget {
  const CreditsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Credits'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            Text(
              'Products placeholder image:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '<a href="https://www.flaticon.com/free-icons/box" title="box icons">Box icons created by Becris - Flaticon</a>',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      drawer: const AppDrawer(),
    );
  }
}
