import 'exercise1.dart' as ex1;
import 'exercise2.dart' as ex2;
import 'exercise3.dart' as ex3;
import 'exercise4.dart' as ex4;
import 'exercise5.dart' as ex5;

void main() async {
  print('========================================');
  print('       LAB 3: ADVANCED DART PRACTICE    ');
  print('========================================\n');

  print('--- Exercise 1: Product Model & Repository ---');
  await ex1.main();

  print('\n--- Exercise 2: User Repository with JSON ---');
  await ex2.main();

  print('\n--- Exercise 3: Async + Microtask Debugging ---');
  await ex3.main();

  print('\n--- Exercise 4: Stream Transformation ---');
  await ex4.main();

  print('\n--- Exercise 5: Factory Constructors & Cache ---');
  ex5.main();

  print('\n========================================');
  print('          LAB 3 COMPLETED               ');
  print('========================================');
}
