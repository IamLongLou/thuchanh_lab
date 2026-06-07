import 'package:flutter/material.dart';

class InputControlsDemo extends StatefulWidget {
  const InputControlsDemo({super.key});

  @override
  State<InputControlsDemo> createState() => _InputControlsDemoState();
}

class _InputControlsDemoState extends State<InputControlsDemo> {

  // Slider value
  double sliderValue = 50;

  // Switch value
  bool isNotificationEnabled = false;

  // Radio value
  String selectedGenre = "";

  // Date value
  DateTime? selectedDate;

  // Open DatePicker
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
    return Scaffold(

      appBar: AppBar(
        title: const Text("Exercise 2 - Input Widgets"),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              // =========================
              // Slider
              // =========================

              const Text(
                "Rating (Slider)",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Slider(
                value: sliderValue,
                min: 0,
                max: 100,

                divisions: 100,

                label: sliderValue.round().toString(),

                onChanged: (value) {
                  setState(() {
                    sliderValue = value;
                  });
                },
              ),

              Text(
                "Current Value: ${sliderValue.toStringAsFixed(0)}",
              ),

              const SizedBox(height: 25),

              // =========================
              // Switch
              // =========================

              const Text(
                "Active (Switch)",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SwitchListTile(
                title: const Text("Is movie active?"),

                value: isNotificationEnabled,

                onChanged: (value) {
                  setState(() {
                    isNotificationEnabled = value;
                  });
                },
              ),

              Text(
                isNotificationEnabled
                    ? "Notifications: ON"
                    : "Notifications: OFF",
              ),

              const SizedBox(height: 25),

              // =========================
              // RadioListTile
              // =========================

              const Text(
                "Genre (RadioListTile)",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              RadioListTile<String>(
                title: const Text("Action"),
                value: "Action",
                groupValue: selectedGenre,

                onChanged: (value) {
                  setState(() {
                    selectedGenre = value!;
                  });
                },
              ),

              RadioListTile<String>(
                title: const Text("Comedy"),
                value: "Comedy",
                groupValue: selectedGenre,

                onChanged: (value) {
                  setState(() {
                    selectedGenre = value!;
                  });
                },
              ),

              Text(
                selectedGenre == ""
                    ? "Selected Genre: None"
                    : "Selected Genre: $selectedGenre",
              ),

              const SizedBox(height: 25),

              // =========================
              // Date Picker
              // =========================

              const Text(
                "Date Picker",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: pickDate,
                  child: const Text("Open Date Picker"),
                ),
              ),

              Text(
                selectedDate == null
                    ? "No Date Selected"
                    : "Selected Date: "
                        "${selectedDate!.day}/"
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