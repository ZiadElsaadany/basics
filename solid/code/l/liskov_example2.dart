


// If your subclass cannot fully behave like the parent class, do NOT inherit from it. Use composition instead.
void main(List<String> args) {
  Shape rectangle = Rectangle(height: 10, width: 5);
  Shape square = Square(5);
Shape  circle =Circle(radius: 5);

rectangle.calculatArea();
square.calculatArea();
circle.calculatArea();

}


abstract class Shape { 
  void calculatArea( );

}  

class Rectangle extends Shape{
  final int height;
  final int width;

  Rectangle({required this.height, required this.width});
@override
  calculatArea() {
    print((height * width).toString());
  }
}

class Square extends Shape {
  final int side;
  Square(this.side);
  @override

  calculatArea() {
    print((side * side).toString());
  }
}


class Circle extends Shape {
final double radius;

  Circle({required this.radius});
  @override
  void calculatArea() {
    
    print(radius*radius*3.14);
  }

}