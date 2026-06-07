import 'package:flutter/material.dart';

class CoreWidgetsDemo extends StatelessWidget {
  const CoreWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercise 1 - Core Widgets Demo"),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              // ======================
              // Text Widget
              // ======================
              const Text(
                "Welcome to Flutter UI",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold
                ),
              ),

              const SizedBox(height: 20),

              // ======================
              // Icon Widget
              // ======================
              Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.movie,
                  size: 100,
                  color: Colors.blue,
                ),
              ),

              const SizedBox(height: 20),

              // ======================
              // Image Widget
              // ======================
              Image.network(
                "data:image/jpeg;base64,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",
                height: 180,
                width: 500,
                fit: BoxFit.cover,
              ),

              const SizedBox(height: 20),

              // ======================
              // Card + ListTile
              // ======================
              Card(
                elevation: 6,

                child: ListTile(
                  leading: const Icon(
                    Icons.star_sharp,
                    color: Colors.black,
                  ),

                  title: const Text("Movie Item"),

                  subtitle: const Text(
                    "This is a sample ListTile inside a Card.",
                  ),

                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("ListTile clicked!"),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}