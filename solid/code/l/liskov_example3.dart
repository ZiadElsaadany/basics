
/// ❌  Bad Example (Violates LSP)

// main(){ 
   

//    PaymentProcessor paypal = PayPalProcessor();
//    PaymentProcessor free = FreeTrialProcessor();
//    paypal.processPayment(100);
//    free.processPayment(4);   // ❌  exception
 
// }
class PaymentProcessor {
  void processPayment(double amount) {
    print("Processing payment of \$${amount}");
  }
}

class PayPalProcessor extends PaymentProcessor {
  @override
  void processPayment(double amount) {
    print("Processing PayPal payment of \$${amount}");
  }
}

class FreeTrialProcessor extends PaymentProcessor {
  @override
  void processPayment(double amount) {
    throw Exception("Cannot process payment in free trial mode.");
  }
}


/// ✅ Correct Example (Respects LSP)

void main(List<String> args) {
  
PaymentProcessor1 paypal = PayPalProcessor1(amount: 100) ;
PaymentProcessor1 free = FreeTrialProcessor1();
paypal.processPayment();
free.processPayment();




}
abstract class PaymentProcessor1 { 
  void processPayment(  ) ;
} 
class PayPalProcessor1 extends PaymentProcessor1 {
final double amount  ;

  PayPalProcessor1({required this.amount});
  @override
  void processPayment() {
    print( "price is $amount");
  }
}

class FreeTrialProcessor1 extends PaymentProcessor1 {
  @override
  void processPayment() {
    // TODO: implement processPayment
    print("free trial ") ;
  }

  }