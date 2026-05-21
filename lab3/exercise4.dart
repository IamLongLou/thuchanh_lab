Future<void> main() async {
  print("Exercise 4: Stream Transformation");

  // Stream 1-5
  Stream<int> numbers = Stream.fromIterable([1, 2, 3, 4, 5, 10]);

  // Square numbers
  Stream<int> squared = numbers.map((n) => n * n);

  // Filter even squares
  Stream<int> evenSquares = squared.where((n) => n % 2 == 0);

  print("Even squared values:");
  await for (var v in evenSquares) {
    print(" $v");
  }
}
