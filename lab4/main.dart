import 'package:flutter/material.dart';
import 'Exe4.dart';
import 'Exe1.dart';
import 'Exe5.dart';
import 'Exe2.dart';
import 'Exe3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 4',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Lab4Home(),
    );
  }
}

class Lab4Home extends StatelessWidget {
  const Lab4Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lab 4 - Flutter UI Fundamentals"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildMenuItem(
              context,
              "Exercise 1 - Core Widgets Demo",
              const CoreWidgetsDemo(),
            ),
            _buildMenuItem(
              context,
              "Exercise 2 - Input Controls Demo",
              const InputControlsDemo(),
            ),
            _buildMenuItem(
              context,
              "Exercise 3 - Layout Demo",
              const LayoutBasicsDemo(),
            ),
            _buildMenuItem(
              context,
              "Exercise 4 - App Structure & Theme",
              const AppStructureDemo(),
            ),
            _buildMenuItem(
              context,
              "Exercise 5 - Common UI Fixes",
              const DebugFixDemo(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, Widget destination) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        },
      ),
    );
  }
}
