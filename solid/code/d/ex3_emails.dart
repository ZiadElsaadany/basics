
// violating the Dependency Inversion Principle (DIP):
class EmailService {
  void sendEmail(String msg) => print("Sending email: $msg");
}

class NotificationManager {
  final EmailService email = EmailService();

  void notify(String msg) {
    email.sendEmail(msg);
  }
}


// correct implementation of the Dependency Inversion Principle (DIP):
abstract class NotificationService {
  void sendMessage(String msg);
}


class EmailServiceImpl implements NotificationService {
  @override
  void sendMessage(String msg) => print("Sending email: $msg");
}

class SMSServiceImpl implements NotificationService {
  @override
  void sendMessage(String msg) => print("Sending SMS: $msg");
}
class NotificationManagerWithDIP {
  final NotificationService notificationService;

  NotificationManagerWithDIP(this.notificationService);

  void notify(String msg) {
    notificationService.sendMessage(msg);
  }
}