
// ❌ Violation Example:

class Vehicle {
  void startEngine() {
    print("Engine started");
  }
}

class Car extends Vehicle {
  @override
  void startEngine() {
    print("Car engine started");
  }
}

class Bicycle extends Vehicle {
  @override
  void startEngine() {
    throw Exception("Bicycles don’t have engines!");
  }
}

void testVehicle(Vehicle v) {
  v.startEngine(); // Assumes all vehicles have engines
}


/// ✅ Correct Example (Respects LSP):
 
abstract class Vehicle1 {}

abstract class MotorVehicle1 extends Vehicle1 {
  void startEngine();
}

class Car1 extends MotorVehicle1 {
  @override
  void startEngine() {
    print("Car engine started");
  }
}

class Bicycle1 extends Vehicle1 {} // بدون startEngine

void main() {
  MotorVehicle1 motorVehicle = Car1();
  motorVehicle.startEngine(); 
}
