import 'package:flutter/material.dart';

class LayoutBasicsDemo extends StatelessWidget {
  const LayoutBasicsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // Data mẫu
    final List<String> movies = [
      "Avengers: Endgame",
      "Spider-Man: No Way Home",
      "The Batman",
      "John Wick 4",
      "Interstellar",
      "Inception",
      "Dune",
      "Top Gun: Maverick",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercise 3 - Layout Basics"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [

            // ========================
            // Header Section
            // ========================

            const Text(
              "Now Playing",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // ========================
            // Movie List Title
            // ========================

            // ========================
            // ListView.builder
            // ========================

            Expanded(
              child: ListView.builder(
                itemCount: movies.length,

                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),

                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 191, 167, 194),
                        child: Text(
                          movies[index][0], // Lấy chữ cái đầu tiên của tên phim
                          style: TextStyle(
                            color: const Color.fromARGB(255, 107, 67, 114),
                          ),
                        ),
                      ),
                        

                      title: Text(movies[index]),
                      subtitle: Text("Sample description"), 

                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Category Widget
  static Widget categoryChip(String title) {
    return Chip(
      label: Text(title),
    );
  }
}