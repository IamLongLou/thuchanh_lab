import 'dart:async';

Future<void> main() async {
  print("Exercise 3: Async + Microtask Debugging");

  print("Start");

  scheduleMicrotask(() => print("Microtask executed"));

  Future(() => print("Future executed"));

  print("End");

  await Future.delayed(Duration(milliseconds: 300));

  print("\nExplanation:");
  print("- Microtasks run first (higher priority).");
  print("- Futures run later in event queue.");
}
