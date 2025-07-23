// Liskov Substitution Principle (LSP)

//📘 What is Liskov Substitution Principle?
// Liskov Substitution Principle is the L in SOLID principles.
// "Objects of a (superclass should be replaceable with objects of its subclasses without breaking the application)."

// 💡 Summary Rule:
// If your subclass cannot fully behave like the parent class, do NOT inherit from it. Use composition instead.


// ❌ Bad Example (Violates LSP):
class Bird {
  void fly() {
    print("Flying");
  }
}

// االبطريق
class Penguin extends Bird {
  @override
  void fly() {
    throw Exception("Penguins can't fly!");
  }
}




//✅ Correct Example (Respects LSP):
abstract class BirdTrue {}

abstract class FlyingBird extends BirdTrue {
  void fly();
}


//عصفور
class Sparrow extends FlyingBird {
  @override
  void fly() {
    print("Sparrow is flying");
  }
}

class Penguin1 extends BirdTrue {
  void swim() {
    print("Penguin is swimming");
  }
}
