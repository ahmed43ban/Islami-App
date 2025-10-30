import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

Future<AudioHandler> initAudioService() async {
  return await AudioService.init(
    builder: () => RadioAudioHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.example.islami.radio',
      androidNotificationChannelName: 'Radio Playback',
      androidNotificationOngoing: true,
    ),
  );
}

class RadioAudioHandler extends BaseAudioHandler {
  final _player = AudioPlayer();

  RadioAudioHandler() {
    _notifyPlaybackState();
  }

  void _notifyPlaybackState() {
    _player.playbackEventStream.listen((event) {
      playbackState.add(playbackState.value.copyWith(
        controls: [
          MediaControl.pause,
          MediaControl.stop,
        ],
        playing: _player.playing,
        processingState: AudioProcessingState.ready,
      ));
    });
  }

  Future<void> playStream(String url) async {
    await _player.setUrl(url);
    await _player.play();
  }

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> stop() async {
    await _player.stop();
    await super.stop();
  }
}
