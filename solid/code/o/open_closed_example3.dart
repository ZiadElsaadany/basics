void main(List<String> args) {
  final TaxCalculatorTrue taxCalculatorForEgypt = TaxCalculatorTrue(
    taxCalculatorStrategy: EgyptTaxCalculator(),
  );
  taxCalculatorForEgypt.calculate(1000);
  final TaxCalculatorTrue taxCalculatorForGermany = TaxCalculatorTrue(
    taxCalculatorStrategy: GermanyTaxCalculator(),
  );
  taxCalculatorForGermany.calculate(1000);
}

class TaxCalculator {
  double calculate(String country, double income) {
    if (country == 'Egypt') {
      return income * 0.15;
    } else if (country == 'Germany') {
      return income * 0.25;
    } else if (country == 'USA') {
      return income * 0.20;
    }
    return 0;
  }
}

abstract class TaxCalculatorStrategy {
  double calculate(double income);
}

class TaxCalculatorTrue {
  final TaxCalculatorStrategy taxCalculatorStrategy;

  TaxCalculatorTrue({required this.taxCalculatorStrategy});
  double calculate(double income) {
    return taxCalculatorStrategy.calculate(income);
  }
}

class EgyptTaxCalculator implements TaxCalculatorStrategy {
  @override
  double calculate(double income) {
    return income * 0.15;
  }
}

class GermanyTaxCalculator implements TaxCalculatorStrategy {
  @override
  double calculate(double income) {
    return income * 0.25;
  }
}

class USATaxCalculator implements TaxCalculatorStrategy {
  @override
  double calculate(double income) {
    return income * 0.20;
  }
}
