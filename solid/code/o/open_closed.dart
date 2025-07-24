// “Software entities should be open for extension but closed for modification.”
// In short: you should be able to add new behavior without changing existing code.

void main() {
  DiscountCalculatorTrue discountCalculatorTrue = DiscountCalculatorTrue(
    RegularDiscount(),
  );

  discountCalculatorTrue.calculate(100);
}

/// ❌ Violation of OCP
class DiscountCalculator {
  double calculate(String customerType, double amount) {
    if (customerType == "regular") {
      return amount * 0.9;
    } else if (customerType == "vip") {
      return amount * 0.8;
    } else if (customerType == "student") {
      return amount * 0.85;
    } else {
      return amount;
    }
  }
}

/// ✅ OCP Applied

abstract class DiscountStrategy {
  double calculate(double amount);
}

class DiscountCalculatorTrue {
  DiscountStrategy discountCalculatorByRule;
  DiscountCalculatorTrue(this.discountCalculatorByRule);
  double calculate(double amount) {
    return discountCalculatorByRule.calculate(amount);
  }
}

class StudentDiscount extends DiscountStrategy {
  @override
  double calculate(double amount) {
    return 0.85 * amount;
  }
}

class VipDiscount extends DiscountStrategy {
  @override
  double calculate(double amount) {
    return 0.8 * amount;
  }
}

class RegularDiscount extends DiscountStrategy {
  @override
  double calculate(double amount) {
    return 0.9 * amount;
  }
}
