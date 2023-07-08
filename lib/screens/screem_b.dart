import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miniplayer/miniplayer.dart';

import '../notifier/miniplayer_percentage_notifier.dart';
import '../notifier/overlay_entry_notifier.dart';

class ScreenB extends ConsumerWidget {
  const ScreenB({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // provider
    var overlayEntry = ref.watch(overlayEntryProvider);
    var miniplayerPercentage = ref.watch(miniplayerPercentageProvider);
    final miniplayerController = MiniplayerController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      miniplayerController.animateToHeight(state: PanelState.MAX);
    });

    final width = MediaQuery.of(context).size.width;

    return Material(
      child: Stack(
        children: [
          Miniplayer(
            controller: miniplayerController,
            minHeight: 100,
            maxHeight: MediaQuery.of(context).size.height,
            builder: (height, percentage) {
              // パーセンテージ更新
              miniplayerPercentage = percentage;
              return Scaffold(
                backgroundColor: const Color.fromARGB(125, 13, 12, 12),
                body: percentage < 0.08
                    ? SafeArea(
                        top: false,
                        child: SizedBox(
                          width: width,
                          child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onVerticalDragUpdate: (details) {
                              if (details.delta.dy > 0) {
                                miniplayerController.animateToHeight(
                                    state: PanelState.MIN);
                              } else {
                                miniplayerController.animateToHeight(
                                    state: PanelState.MAX);
                              }
                            },
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    child: const Center(
                                      child: Text('Dummy Text'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : SafeArea(
                        // topのみ適応
                        bottom: false,
                        child: Column(
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
                                color: Colors.grey[200],
                                child: const Center(
                                  child: Text('Dummy Text'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              );
            },
          ),
          Positioned(
            right: 10,
            // 理想はSafeAreaのbottom + Miniplayerの高さの半分
            bottom: MediaQuery.paddingOf(context).bottom +
                (50 - 24 * 1.2), // 計算式悩み中
            child: Visibility(
              visible: miniplayerPercentage > 0.08,
              child: InkWell(
                child: const Icon(Icons.close),
                onTap: () {
                  print('タップ');
                  overlayEntry?.remove();
                  overlayEntry = null;
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
