
/// violating the Dependency Inversion Principle (DIP):

class MySQLDatabase {
  void save(String data) => print("Saved '$data' to MySQL");
}


class UserService {
  final MySQLDatabase db = MySQLDatabase(); // tightly coupled to MySQL

  void register(String name) {
    db.save(name);
  }
}


// correct implementation of the Dependency Inversion Principle (DIP):

abstract class Database {
  void save(String data);
}
class MySQLDatabaseImpl implements Database {
  @override
  void save(String data) => print("Saved '$data' to MySQL");
}
class MongoDBDatabaseImpl implements Database {
  @override
  void save(String data) => print("Saved '$data' to MongoDB");
} 
class UserServiceWithDIP {
  final Database db;

  UserServiceWithDIP(this.db); // dependency injected

  void register(String name) {
    db.save(name);
  }
}