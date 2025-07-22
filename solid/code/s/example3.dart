void main ( ) { 

InvoiceTrue invoice = InvoiceTrue("Ziad", [100.0, 150.0, 75.5]);

InvoicePrinter invoicePrinter = InvoicePrinter();
invoicePrinter.printInvoice(invoice, InvoiceCalculator());

InvoiceSaver invoiceSaver = InvoiceSaver();
invoiceSaver.saveToFile(invoice);



} 



// ❌ Violates (SRP):

class Invoice {
  final String customer;
  final List<double> items;

  Invoice(this.customer, this.items);

  double calculateTotal() {
    return items.reduce((a, b) => a + b);
  }

  void printInvoice() {
    print("Invoice for $customer:");
    for (var item in items) {
      print("Item: \$${item.toStringAsFixed(2)}");
    }
    print("Total: \$${calculateTotal().toStringAsFixed(2)}");
  }

  void saveToFile() {
    // Imagine file writing logic here
    print("Saving invoice for $customer to file...");
  }
}





// ✅ SRP Applied : 

class InvoiceTrue{ 

  final String customer;
  final List<double> items;

  InvoiceTrue(this.customer, this.items);
}

class InvoicePrinter {
  void printInvoice(InvoiceTrue invoice, InvoiceCalculator invoiceCalculator) {
    print("Invoice for ${invoice.customer}:");
    for (var item in invoice.items) {
      print("Item: \$${item.toStringAsFixed(2)}");
    }
    print("Total: \$${invoiceCalculator.calculateTotal(invoice).toStringAsFixed(2)}");
  }
}

class InvoiceSaver {
  void saveToFile(InvoiceTrue invoice) {
    // Imagine file writing logic here
    print("Saving invoice for ${invoice.customer} to file...");
  }
}
class InvoiceCalculator {
  double calculateTotal(InvoiceTrue invoice) {
    return invoice.items.reduce((a, b) => a + b);
  }
}