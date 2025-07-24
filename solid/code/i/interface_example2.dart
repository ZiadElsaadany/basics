// 🔴 Violation Example 3: MediaPlayer Doing Everything

abstract class MediaPlayer {
  void playAudio();
  void playVideo();
}

class AudioPlayer implements MediaPlayer {
  @override
  void playAudio() => print("Playing audio");

  @override
  void playVideo() {
    // ❌ Audio player can't play video
    throw UnimplementedError("Audio player can't play video");
  }
}

// ✅ Correct Example (Respects Interface Segregation Principle):
abstract class AudioPlayable {
  void playAudio();
}

abstract class VideoPlayable {
  void playVideo();
}

class AudioPlayer1 implements AudioPlayable {
  @override
  void playAudio() => print("Playing audio");
}

class VideoPlayer implements VideoPlayable {
  @override
  void playVideo() => print("Playing video");
}
