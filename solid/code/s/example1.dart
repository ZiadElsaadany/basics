void main() {
  final user = UserTrue(name: "John Doe");

  final emailService = EmailService();
  emailService.sendEmail(user);

  final saveUserData = SaveUserData();
  saveUserData.saveUserData(user);
}

// ❌ Violation:

class User {
  final String name;

  User({required this.name});

  void saveUserData() {
    // Save user to database
  }
  void sendEmail() {
    // Send welcome email
  }
}

//✅ SRP Applied:

class UserTrue {
  final String name;

  UserTrue({required this.name});
}


class EmailService {
  void sendEmail(UserTrue user) {
    // send email logic with user data
  }
}

class SaveUserData {
  void saveUserData(UserTrue user) {
    // save user data logic
  }
}
