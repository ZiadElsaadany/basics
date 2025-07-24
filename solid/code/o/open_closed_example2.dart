// ❌  Violates OCP

void main(List<String> args) {
  // final emailNotifier =PushNotifier(notifierStrategy: EmailNotifier());

  final NotifierStrategy emailNotifier = EmailNotifier();
  emailNotifier.send("Hello");
}

class Notifier {
  void send(String type, String message) {
    if (type == "email") {
      print("Sending Email: $message");
    } else if (type == "sms") {
      print("Sending SMS: $message");
    } else if (type == "push") {
      print("Sending Push Notification: $message");
    }
  }
}

abstract class NotifierStrategy {
  void send(String message);
}

class PushNotifier {
  final NotifierStrategy notifierStrategy;

  PushNotifier({required this.notifierStrategy});

  void send(String message) {
    notifierStrategy.send(message);
  }
}

class EmailNotifier implements NotifierStrategy {
  @override
  void send(String message) {
    print("Sending Email: $message");
  }
}

class SmsNotifier implements NotifierStrategy {
  @override
  void send(String message) {
    print("Sending SMS: $message");
  }
}
