import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_youtube_player/domain/mini_player/mini_player_notifier.dart';
import 'package:flutter_youtube_player/domain/video/video_notifier.dart';
import '/screens/home_screen.dart';
import 'package:miniplayer/miniplayer.dart';

import 'mini_player_screen.dart';

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
    final miniPlayerController =
        ref.watch(miniPlayerProvider.select((value) => value.controller));
    final isMiniPlayerMode =
        ref.watch(miniPlayerProvider.select((value) => value.isMiniPlayerMode));
    double screenHeight = MediaQuery.of(context).size.height;
    double triggerHeight = screenHeight / 10;
    return RawGestureDetector(
      gestures: {
        VerticalDragGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<VerticalDragGestureRecognizer>(
          () => VerticalDragGestureRecognizer(),
          (VerticalDragGestureRecognizer instance) {
            instance.onUpdate = (details) {
              debugPrint('ドラッグしている');
              if (details.delta.dy > triggerHeight) {
                miniPlayerController.animateToHeight(state: PanelState.MIN);
              }
            };
          },
        ),
      },
      child: Scaffold(
        body: Stack(
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
                child: const MiniPlayerScreen(),
              ),
            ),
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
      ),
    );
  }
}
