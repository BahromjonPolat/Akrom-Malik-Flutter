/*

  Created by: Bakhromjon Polat
  Created on: May 21 2023 09:02:16
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:akrom_malik_flutter/service/audio_hadler.dart';
import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';

class PlayerService {
  PlayerService._();

  static late AudioPlayerHandler _audioHandler;
  static bool _initialized = false;
  static final _audioPlayer = AudioPlayer();

  static Future<void> init() async {
    if (_initialized) return;
    _initialized = true;
    // _audioHandler = await AudioService.init(
    //   builder: () => AudioPlayerHandler(),
    //   config: const AudioServiceConfig(
    //     androidNotificationChannelId: 'com.ryanheise.myapp.channel.audio',
    //     androidNotificationChannelName: 'Audio playback',
    //     androidNotificationOngoing: true,
    //   ),
    // );

    final source = ConcatenatingAudioSource(
      children: [
        AudioSource.uri(
          Uri.parse('asset:///books/audio/jangchi_01.mp3'),
          tag: const MediaItem(
            id: '0',
            title: 'Jangchi',
          ),
        ),
        AudioSource.asset(
          'books/audio/jangchi_01.mp3',
          tag: const MediaItem(
            id: 'books/audio/jangchi_01.mp3',
            title: 'Jangchi',
          ),
        ),
      ],
    );
    await _audioPlayer.setAudioSource(source);
  }

  static Future<void> play() async {
    // final session = await AudioSession.instance;
    // await session.configure(const AudioSessionConfiguration.music());

    // // Activate the audio session before playing audio.
    // if (await session.setActive(true)) {
    //   // Now play audio.
    // } else {
    //   // The request was denied and the app should not play audio
    // }

    if (_audioPlayer.playing) {
      _audioPlayer.pause();
    } else {
      // await _audioPlayer.setAudio('books/audio/jangchi_01.mp3');
      await _audioPlayer.play();
    }
  }
}
