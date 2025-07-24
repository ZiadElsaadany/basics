/// Classes should not be forced to implement methods they do not need.

abstract class Animal {
  void fly(); // ❌ مش كل الحيوانات بتطير
}

class Dog implements Animal {
  @override
  void fly() {
    // ❌ الكلب مش بيطير
    throw UnimplementedError();
  }
}
//✅ Correct Example (Respects Interface Segregation Principle):
abstract class CanFly {
  void fly();
}

abstract class Animal1 {
  void walk();
}
