import 'package:flutter/material.dart';

void main() => runApp(const ResponsiveMovieApp());

// Step 2: Define Movie Model
class Movie {
  final String title;
  final int year;
  final List<String> genres;
  final String posterUrl;
  final double rating;

  Movie({
    required this.title,
    required this.year,
    required this.genres,
    required this.posterUrl,
    required this.rating,
  });
}

// Step 2: Sample Data
final List<Movie> allMovies = [
  Movie(
    title: 'Dune: Part Two',
    year: 2024,
    genres: ['Sci-Fi', 'Adventure'],
    posterUrl: 'https://image.tmdb.org/t/p/w500/1pdf39uSwwDWMWLsG7Fi6HZ9T98.jpg',
    rating: 8.6,
  ),
  Movie(
    title: 'Deadpool & Wolverine',
    year: 2024,
    genres: ['Action', 'Comedy'],
    posterUrl: 'https://image.tmdb.org/t/p/w500/8cdcl36GbYv86G0sTq8u6pIsas8.jpg',
    rating: 8.3,
  ),
  Movie(
    title: 'Inception',
    year: 2010,
    genres: ['Sci-Fi', 'Action'],
    posterUrl: 'https://image.tmdb.org/t/p/w500/edv5CZvRjS99vO6YznvQGBrA1FU.jpg',
    rating: 8.8,
  ),
  Movie(
    title: 'The Dark Knight',
    year: 2008,
    genres: ['Action', 'Drama'],
    posterUrl: 'https://image.tmdb.org/t/p/w500/qJ2tW6WMUDp9EXS1I89zTuh0Cuc.jpg',
    rating: 9.0,
  ),
  Movie(
    title: 'Interstellar',
    year: 2014,
    genres: ['Sci-Fi', 'Drama'],
    posterUrl: 'https://image.tmdb.org/t/p/w500/gEU2QniE6EwfVDxCzs2ndRHTpUu.jpg',
    rating: 8.7,
  ),
];

// Step 3: Base Scaffold
class ResponsiveMovieApp extends StatelessWidget {
  const ResponsiveMovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Movie Browser',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const GenreScreen(),
    );
  }
}

class GenreScreen extends StatefulWidget {
  const GenreScreen({super.key});

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  // State variables for filtering and sorting
  String searchQuery = "";
  Set<String> selectedGenres = {};
  String selectedSort = "A-Z";

  final List<String> availableGenres = ['Action', 'Comedy', 'Drama', 'Sci-Fi', 'Adventure'];
  final List<String> sortOptions = ['A-Z', 'Z-A', 'Year', 'Rating'];

  @override
  Widget build(BuildContext context) {
    // Step 7: Filter and Sort logic
    List<Movie> visibleMovies = allMovies.where((movie) {
      final matchesSearch = movie.title.toLowerCase().contains(searchQuery.toLowerCase());
      final matchesGenre = selectedGenres.isEmpty || 
          movie.genres.any((genre) => selectedGenres.contains(genre));
      return matchesSearch && matchesGenre;
    }).toList();

    // Sorting
    if (selectedSort == 'A-Z') {
      visibleMovies.sort((a, b) => a.title.compareTo(b.title));
    } else if (selectedSort == 'Z-A') {
      visibleMovies.sort((a, b) => b.title.compareTo(a.title));
    } else if (selectedSort == 'Year') {
      visibleMovies.sort((a, b) => b.year.compareTo(a.year));
    } else if (selectedSort == 'Rating') {
      visibleMovies.sort((a, b) => b.rating.compareTo(a.rating));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Find a Movie')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Step 4: Responsive Search Bar
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  onChanged: (value) => setState(() => searchQuery = value),
                  decoration: const InputDecoration(
                    hintText: 'Search movies...',
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Step 5: Genre Chips using Wrap
              const Text('Filter by Genre:', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8.0,
                children: availableGenres.map((genre) {
                  final isSelected = selectedGenres.contains(genre);
                  return FilterChip(
                    label: Text(genre),
                    selected: isSelected,
                    onSelected: (bool value) {
                      setState(() {
                        if (value) {
                          selectedGenres.add(genre);
                        } else {
                          selectedGenres.remove(genre);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),

              // Step 6: Sort Dropdown
              Row(
                children: [
                  const Text('Sort by: ', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(width: 10),
                  DropdownButton<String>(
                    value: selectedSort,
                    items: sortOptions.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() => selectedSort = newValue!);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Step 8: Responsive Movie List (LayoutBuilder)
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth < 600) {
                      // Small screens: single column list
                      return ListView.builder(
                        itemCount: visibleMovies.length,
                        itemBuilder: (context, index) => MovieCard(movie: visibleMovies[index]),
                      );
                    } else {
                      // Wider screens: two column grid
                      return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2.5,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: visibleMovies.length,
                        itemBuilder: (context, index) => MovieCard(movie: visibleMovies[index]),
                      );
                    }
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

// Step 10: Movie Item Card
class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Responsive poster size
            LayoutBuilder(builder: (context, constraints) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  movie.posterUrl,
                  width: 80,
                  height: 120,
                  fit: BoxFit.cover,
                  errorBuilder: (c, e, s) => Container(width: 80, height: 120, color: Colors.grey),
                ),
              );
            }),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    movie.title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('Year: ${movie.year}'),
                  Text('Rating: ★ ${movie.rating}'),
                  Text('Genres: ${movie.genres.join(', ')}', style: const TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
