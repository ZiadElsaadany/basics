//High-level modules should not depend on low-level modules. Both should depend on abstractions.
// Abstractions should not depend on details. Details should depend on abstractions.

/// violation of the Dependency Inversion Principle: 

class OrderDataAccess {
  fetchOrders() {
    // Fetch orders from a database
    return ['Order1', 'Order2'];
  }
}
class OrderService {
  final OrderDataAccess orderDataAccess = OrderDataAccess(); // tight coupling
  // High-level module depends on low-level module directly
  // This makes it difficult to change the data access method
  // or to test the service in isolation
  void processOrders() {
    var orders = orderDataAccess.fetchOrders();
    // Process orders
    print('Processing: $orders');
  }
}

// correct implementation of the Dependency Inversion Principle:

abstract class IOrderDataAccess {
  fetchOrders();
}
class OrderDataAccessFromSqlImpl implements IOrderDataAccess {
  @override
  fetchOrders() {
    // Fetch orders from a database
    return ['Order1', 'Order2'];
  }
}
// multiple implementations can be created
class OrderDataAccessFromApiImpl implements IOrderDataAccess {
  @override
  fetchOrders() {
    // Fetch orders from an API
    return ['Order3', 'Order4'];
  }
}
class OrderServiceWithDependencyInversion {
  final IOrderDataAccess orderDataAccess;
  OrderServiceWithDependencyInversion(this.orderDataAccess);
  // Dependency is injected through the constructor
  // This allows for flexibility and easier testing
  void processOrders() {
    var orders = orderDataAccess.fetchOrders();
    // Process orders
    print('Processing: $orders');
  }
}