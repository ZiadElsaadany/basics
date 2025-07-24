// 🔴  Violation : Worker Interface with Unneeded Methods

abstract class Worker {
  void work();
  void eat();
}

class Robot implements Worker {
  @override
  void work() {
    print("Robot working");
  }

  @override
  void eat() {
    throw UnimplementedError(); // ❌ Robots don't eat
  }
}


///✅   correct

abstract class Workable {
  void work();
  }
abstract class Eatable{ 
  void eat();
}

class Robot1 implements Workable {
  @override
  void work() {
    print("Robot working");
  }

}
class Human implements Eatable, Workable{
  @override
  void eat() {
    print("Eating");
  }
  
  @override
  void work() {
    // TODO: implement work
  }
}