import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miniplayer/miniplayer.dart';

import '../notifier/miniplayer_percentage_notifier.dart';

// Miniplayerの高さ
const _miniplayerHeight = 80.0;

class ScreenB extends ConsumerWidget {
  const ScreenB({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final miniplayerPercentageNotifier =
        ref.watch(miniplayerPercentageProvider.notifier);
    final miniplayerController = MiniplayerController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      miniplayerController.animateToHeight(state: PanelState.MAX);
    });

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Miniplayer(
        controller: miniplayerController,
        minHeight: _miniplayerHeight + kBottomNavigationBarHeight,
        maxHeight: MediaQuery.of(context).size.height -
            MediaQuery.paddingOf(context).top,
        backgroundColor: Colors.transparent,
        builder: (height, percentage) {
          // パーセンテージ更新
          WidgetsBinding.instance.addPostFrameCallback((_) {
            miniplayerPercentageNotifier.updatePercentage(percentage);
          });
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: percentage < 0.3
                ? _MiniplayerView(
                    miniplayerController: miniplayerController,
                  )
                : const _FullScreenView(),
          );
        },
      ),
    );
  }
}

class _MiniplayerView extends StatelessWidget {
  const _MiniplayerView({
    required this.miniplayerController,
  });

  final MiniplayerController miniplayerController;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onVerticalDragUpdate: (details) {
        if (details.delta.dy > 0) {
          miniplayerController.animateToHeight(state: PanelState.MIN);
        } else {
          miniplayerController.animateToHeight(state: PanelState.MAX);
        }
      },
      child: SizedBox(
        width: width,
        height: _miniplayerHeight,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.blue,
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: const Center(
                  child: Text('Dummy Text'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FullScreenView extends StatelessWidget {
  const _FullScreenView();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.blue,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: const Color.fromARGB(255, 238, 238, 238),
            child: const Center(
              child: Text('Dummy Text'),
            ),
          ),
        ),
      ],
    );
  }
}
