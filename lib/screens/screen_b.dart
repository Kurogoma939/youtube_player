import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miniplayer/miniplayer.dart';

import '../notifier/miniplayer_percentage_notifier.dart';
import '../notifier/overlay_entry_notifier.dart';

class ScreenB extends ConsumerWidget {
  const ScreenB({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final overlayEntryNotifier = ref.watch(overlayEntryProvider.notifier);
    var miniplayerPercentage = ref.watch(miniplayerPercentageProvider);
    final miniplayerPercentageNotifier =
        ref.watch(miniplayerPercentageProvider.notifier);
    final miniplayerController = MiniplayerController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      miniplayerController.animateToHeight(state: PanelState.MAX);
    });

    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Miniplayer(
            controller: miniplayerController,
            minHeight: 100,
            maxHeight: MediaQuery.of(context).size.height -
                MediaQuery.paddingOf(context).top,
            builder: (height, percentage) {
              // パーセンテージ更新
              WidgetsBinding.instance.addPostFrameCallback((_) {
                miniplayerPercentageNotifier.updatePercentage(percentage);
              });
              return Scaffold(
                backgroundColor: Colors.transparent,
                body: percentage < 0.08
                    ? SizedBox(
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
                          child: Column(
                            children: [
                              Row(
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
                            ],
                          ),
                        ),
                      )
                    : Column(
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
              );
            },
          ),
          Positioned(
            right: 10,
            // 理想はSafeAreaのbottom + Miniplayerの高さの半分
            bottom: MediaQuery.paddingOf(context).bottom + 22, // 計算式悩み中
            child: Visibility(
              visible: miniplayerPercentage < 0.08,
              child: InkWell(
                child: const Icon(Icons.close),
                onTap: () {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    overlayEntryNotifier.removeOverlayEntry();
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
