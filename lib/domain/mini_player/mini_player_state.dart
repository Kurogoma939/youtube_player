import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:miniplayer/miniplayer.dart';

part 'mini_player_state.freezed.dart';

@freezed
class MiniPlayerState with _$MiniPlayerState {
  const factory MiniPlayerState({
    required MiniplayerController controller,
  }) = _MiniPlayerState;
}
