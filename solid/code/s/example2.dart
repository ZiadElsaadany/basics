void main() {
  final post = BlogPost2(
    title: "Dart SRP",
    content: "Keep classes focused on one task.",
  );

  final printer = BlogPrinter();
  final database = BlogData();
  final notifier = NotificationService();

  database.saveToDatabase(post);
  printer.printPost(post);
  notifier.notifySubscribers(post);
}

// ❌ Violation of SRP (One class does too much):
class BlogPost {
  String title;
  String content;

  BlogPost(this.title, this.content);

  void saveToDatabase() {} // save to database

  void printPost() {
    // print post
    print("Title: $title\nContent: $content");
  }

  void sendToSubscribers() {} // Send notification to subscribers
}

// ✅ SRP Applied :
class BlogPost2 {
  final String title;
  final String content;
  BlogPost2({required this.title, required this.content});
}

class BlogPrinter {
  void printPost(BlogPost2 blogPost) {
    print("Title: ${blogPost.title}\nContent: ${blogPost.content}");
  }
}

class BlogData {
  void saveToDatabase(BlogPost2 blogPost) {
    //  store  to database
  }
  void retreiveFromDatabase() {}
}

class NotificationService {
  void notifySubscribers(BlogPost2 blogPost) {}
}
