import 'package:flutter_examples/unit_test_example/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Counter Test", () {
    test("Sample Increment", () {
      final counter = Counter(1);

      counter.increment();

      expect(counter.number, 2);
    });

    test("Sample Decrement", () {
      final counter = Counter(5);

      counter.decrement();
      
      expect(counter.number, 4);
    });
  });
}
