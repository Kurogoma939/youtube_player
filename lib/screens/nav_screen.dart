import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_youtube_player/domain/mini_player/mini_player_notifier.dart';
import 'package:flutter_youtube_player/domain/video/video_notifier.dart';
import '/screens/home_screen.dart';
import 'player_screen.dart';
import 'package:miniplayer/miniplayer.dart';

const double playerMinHeight = 60.0;

class NavScreen extends ConsumerStatefulWidget {
  const NavScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NavScreenState();
}

class _NavScreenState extends ConsumerState<NavScreen> {
  int _selectedIndex = 0;

  final _screens = [
    const HomeScreen(),
    const Scaffold(body: Center(child: Text('ショートタブ'))),
    const Scaffold(body: Center(child: Text('動画投稿'))),
    const Scaffold(body: Center(child: Text('登録チャンネル'))),
    const Scaffold(body: Center(child: Text('ライブラリ'))),
  ];

  @override
  Widget build(BuildContext context) {
    final videoState = ref.watch(videoNotifierProvider);
    final videoNotifier = ref.watch(videoNotifierProvider.notifier);
    final miniPlayerController =
        ref.watch(miniPlayerProvider.select((value) => value.controller));
    final isMiniPlayerMode =
        ref.watch(miniPlayerProvider.select((value) => value.isMiniPlayerMode));
    final miniPlayerNotifier = ref.watch(miniPlayerProvider.notifier);
    return Scaffold(
      body: Consumer(
        builder: (context, watch, _) {
          return Stack(
            children: _screens
                .asMap()
                .map((i, screen) => MapEntry(
                      i,
                      Offstage(
                        offstage: _selectedIndex != i,
                        child: screen,
                      ),
                    ))
                .values
                .toList()
              ..add(
                Offstage(
                  offstage: videoState.selectedVideo == null,
                  child: Miniplayer(
                    controller: miniPlayerController,
                    minHeight: playerMinHeight,
                    maxHeight: MediaQuery.of(context).size.height,
                    builder: (height, percentage) {
                      if (videoState.selectedVideo == null) {
                        return const SizedBox.shrink();
                      }

                      // isMiniPlayerModeの切り替え
                      // Todo: Widget内でいいがメソッド化したい
                      if (height == playerMinHeight && !isMiniPlayerMode) {
                        Future.delayed(const Duration(), () {
                          miniPlayerNotifier.forceToggleMiniPlayer(true);
                        });
                      } else if (isMiniPlayerMode) {
                        Future.delayed(const Duration(), () {
                          miniPlayerNotifier.forceToggleMiniPlayer(false);
                        });
                      }

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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                              videoState.selectedVideo!.author
                                                  .username,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500),
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
                      return const PlayerScreen();
                    },
                  ),
                ),
              ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() {
          // 全画面モードであればミニプレーヤーにしてから遷移
          debugPrint(miniPlayerController.value!.height.toString());
          if (!isMiniPlayerMode) {
            miniPlayerController.animateToHeight(state: PanelState.MIN);
          }

          _selectedIndex = i;
        }),
        selectedFontSize: 10.0,
        unselectedFontSize: 10.0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline_outlined),
            activeIcon: Icon(Icons.play_circle_fill_rounded),
            label: 'ショート',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            activeIcon: Icon(Icons.add_circle),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions_outlined),
            activeIcon: Icon(Icons.subscriptions),
            label: '登録チャンネル',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library_outlined),
            activeIcon: Icon(Icons.video_library),
            label: 'ライブラリ',
          ),
        ],
      ),
    );
  }
}
