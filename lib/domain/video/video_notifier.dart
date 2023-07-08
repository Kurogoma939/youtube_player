import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_youtube_player/domain/video/video_state.dart';

import '../../data/video.dart';

final videoNotifierProvider =
    StateNotifierProvider.autoDispose<VideoNotifier, VideoState>(
  (ref) => VideoNotifier(),
);

class VideoNotifier extends StateNotifier<VideoState> {
  VideoNotifier()
      : super(
          const VideoState(selectedVideo: null),
        );

  /// [Video]を選択する
  void selectVideo(Video? video) {
    state = state.copyWith(selectedVideo: video);
  }

  /// 選択解除する
  void unselectVideo() {
    state = state.copyWith(selectedVideo: null);
  }
}
