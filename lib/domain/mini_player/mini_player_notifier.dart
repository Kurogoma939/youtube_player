import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_youtube_player/domain/mini_player/mini_player_state.dart';
import 'package:miniplayer/miniplayer.dart';

final miniPlayerProvider =
    StateNotifierProvider.autoDispose<MiniPlayerNotifier, MiniPlayerState>(
  (ref) => MiniPlayerNotifier(),
);

class MiniPlayerNotifier extends StateNotifier<MiniPlayerState> {
  MiniPlayerNotifier()
      : super(
          MiniPlayerState(
            controller: MiniplayerController(),
          ),
        );

  // フラグを切り替える
  void forceToggleMiniPlayer(bool isMiniPlayerMode) {
    state = state.copyWith(isMiniPlayerMode: isMiniPlayerMode);
  }
}
