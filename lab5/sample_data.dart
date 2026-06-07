import 'movie_model.dart';

final List<Movie> sampleMovies = [
  Movie(
    id: 1,
    title: 'Dune: Part Two',
    posterUrl: 'https://image.tmdb.org/t/p/w500/1pdf39uSwwDWMWLsG7Fi6HZ9T98.jpg',
    overview: 'Follow the mythic journey of Paul Atreides as he unites with Chani and the Fremen while on a path of revenge against the conspirators who destroyed his family.',
    genres: ['Sci-Fi', 'Adventure', 'Drama'],
    rating: 8.6,
    trailers: ['Official Trailer #1', 'IMAX Sneak Peek'],
  ),
  Movie(
    id: 2,
    title: 'Deadpool & Wolverine',
    posterUrl: 'https://image.tmdb.org/t/p/w500/8cdcl36GbYv86G0sTq8u6pIsas8.jpg',
    overview: 'A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary, Deadpool, behind him. But when his homeworld faces an existential threat, Wade must reluctantly suit-up again with an even more reluctant Wolverine.',
    genres: ['Action', 'Comedy', 'Sci-Fi'],
    rating: 8.3,
    trailers: ['First Look Trailer', 'Behind the Scenes'],
  ),
];
