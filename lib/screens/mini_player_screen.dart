import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miniplayer/miniplayer.dart';

import '../domain/mini_player/mini_player_notifier.dart';
import '../domain/video/video_notifier.dart';
import 'player_full_screen.dart';

const double playerMinHeight = 60.0;

ValueNotifier<double> miniPlayerValueNotifier = ValueNotifier(playerMinHeight);

/// ミニプレイヤー
class MiniPlayerScreen extends ConsumerWidget {
  const MiniPlayerScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoState = ref.watch(videoNotifierProvider);
    final videoNotifier = ref.watch(videoNotifierProvider.notifier);
    final miniPlayerController =
        ref.watch(miniPlayerProvider.select((value) => value.controller));
    final isMiniPlayerMode =
        ref.watch(miniPlayerProvider.select((value) => value.isMiniPlayerMode));
    final miniPlayerNotifier = ref.watch(miniPlayerProvider.notifier);
    double screenHeight = MediaQuery.of(context).size.height;
    double triggerHeight = screenHeight / 10;
    return Miniplayer(
      controller: miniPlayerController,
      minHeight: playerMinHeight,
      maxHeight: MediaQuery.of(context).size.height,
      onDismiss: () {
        debugPrint('onDismissed');
      },
      valueNotifier: miniPlayerValueNotifier,
      builder: (height, percentage) {
        if (videoState.selectedVideo == null) {
          return const SizedBox.shrink();
        }

        if (height <= triggerHeight) {
          miniPlayerController.animateToHeight(state: PanelState.MIN);
        }

        // isMiniPlayerModeの切り替え
        // Todo: Widget内でいいがメソッド化したい
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (height == playerMinHeight && !isMiniPlayerMode) {
            miniPlayerNotifier.forceToggleMiniPlayer(true);
          } else if (height == screenHeight && isMiniPlayerMode) {
            miniPlayerNotifier.forceToggleMiniPlayer(false);
          }
        });

        if (height <= playerMinHeight + 50.0) {
          return Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Column(
              children: [
                Row(
                  children: [
                    Image.network(
                      videoState.selectedVideo!.thumbnailUrl,
                      height: playerMinHeight - 4.0,
                      width: 120.0,
                      fit: BoxFit.cover,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Text(
                                videoState.selectedVideo!.title,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                videoState.selectedVideo!.author.username,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.play_arrow),
                      onPressed: () {
                        debugPrint('動画再生');
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        debugPrint('ミニプレーヤー停止');
                        videoNotifier.unselectVideo();
                      },
                    ),
                  ],
                ),
                const LinearProgressIndicator(
                  value: 0.4,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color.fromARGB(255, 244, 114, 54),
                  ),
                ),
              ],
            ),
          );
        }
        return const PlayerFullScreen();
      },
    );
  }
}
