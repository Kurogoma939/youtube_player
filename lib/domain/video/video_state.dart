import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/video.dart';

part 'video_state.freezed.dart';

@freezed
class VideoState with _$VideoState {
  const factory VideoState({
    required Video? video,
  }) = _VideoState;
}
