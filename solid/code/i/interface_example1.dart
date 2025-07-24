// 🔴 Violation Example 1: A Printer Interface Doing Too Much

abstract class Printer {
  void printDocument(String doc);    
  void scanDocument(String doc);
  void faxDocument(String doc);
}

class OldPrinter implements Printer {
  @override
  void printDocument(String doc) {
    print("Printing: $doc");
  }

  @override
  void scanDocument(String doc) {
    // ❌ Not supported
    throw UnimplementedError("Scan not supported");
  }

  @override
  void faxDocument(String doc) {
    // ❌ Not supported
    throw UnimplementedError("Fax not supported");
  }
}


// ✅ Correct Example (Respects Interface Segregation Principle):

abstract class Printable {
  void printDocument(String doc);
}

abstract class Scannable {
  void scanDocument(String doc);
}

abstract class Faxable {
  void faxDocument(String doc);
}

class BasicPrinter implements Printable {
  @override
  void printDocument(String doc) {
    print("Printing: $doc");
  }
}
class ScannablePrinter implements Scannable {
  @override
  void scanDocument(String doc) {
    print("scannig $doc");
  } 

}
class FaxablePrinter implements Faxable {
  @override
  void faxDocument(String doc) {
    print("Faxing $doc");
  }
}



void main(List<String> args) {
  
  Printable basicPrinter = BasicPrinter();
  basicPrinter.printDocument("doc");
  Scannable scannablePrinter = ScannablePrinter();
  scannablePrinter.scanDocument("doc");
Faxable faxablePrinter = FaxablePrinter();
  faxablePrinter.faxDocument("doc");
}









