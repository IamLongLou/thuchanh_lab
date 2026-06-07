import 'package:flutter/material.dart';

class DebugFixDemo extends StatefulWidget {
  const DebugFixDemo({super.key});

  @override
  State<DebugFixDemo> createState() => _DebugFixDemoState();
}

class _DebugFixDemoState extends State<DebugFixDemo> {

  int counter = 0;

  DateTime? selectedDate;

  Future<void> pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    List<String> movies = [
      "Avengers",
      "Batman",
      "Superman",
      "Spider-Man",
      "Iron Man",
      "Thor",
      "Hulk",
      "Doctor Strange",
      "Captain America",
      "Black Panther",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercise 5 - Debug UI"),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              const Text(
                "1. Fix ListView inside Column",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                height: 250,
                child: ListView.builder(
                  itemCount: movies.length,

                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(movies[index]),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              const Divider(),

              const Text(
                "2. Fix setState() issue",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "Counter: $counter",
                style: const TextStyle(fontSize: 20),
              ),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    counter++;
                  });
                },
                child: const Text("Increase Counter"),
              ),

              const SizedBox(height: 20),

              const Divider(),

              const Text(
                "3. DatePicker",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: pickDate,
                child: const Text("Select Date"),
              ),

              const SizedBox(height: 10),

              Text(
                selectedDate == null
                    ? "No Date Selected"
                    : "${selectedDate!.day}/"
                      "${selectedDate!.month}/"
                      "${selectedDate!.year}",
              ),
            ],
          ),
        ),
      ),
    );
  }
}