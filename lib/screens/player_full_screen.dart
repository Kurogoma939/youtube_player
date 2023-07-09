import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_youtube_player/domain/video/video_notifier.dart';
import '../data/video.dart';
import '../domain/mini_player/mini_player_notifier.dart';
import '/widgets/widgets.dart';
import 'package:miniplayer/miniplayer.dart';

///
/// 全画面表示状態の縦画面再生
///
class PlayerFullScreen extends ConsumerStatefulWidget {
  const PlayerFullScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PlayerFullScreenState();
}

class _PlayerFullScreenState extends ConsumerState<PlayerFullScreen> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  // 端末回転の方向により、縦画面か横画面かを判定する
  Orientation get _deviceOrientation {
    return MediaQuery.of(context).orientation;
  }

  @override
  Widget build(BuildContext context) {
    final miniPlayerController =
        ref.watch(miniPlayerProvider.select((value) => value.controller));
    final selectedVideo =
        ref.watch(videoNotifierProvider.select((value) => value.selectedVideo));

    final Orientation deviceOrientation = MediaQuery.of(context).orientation;

    if (deviceOrientation == Orientation.landscape) {
      return _LandscapeScreen(
        scrollController: _scrollController,
        selectedVideo: selectedVideo,
        miniPlayerController: miniPlayerController,
      );
    } else if (deviceOrientation == Orientation.portrait) {
      return _PortraitScreen(
        scrollController: _scrollController,
        selectedVideo: selectedVideo,
        miniPlayerController: miniPlayerController,
      );
    } else {
      return Container();
    }
  }
}

///
/// 縦画面再生
///
class _PortraitScreen extends StatelessWidget {
  const _PortraitScreen({
    required ScrollController? scrollController,
    required this.selectedVideo,
    required this.miniPlayerController,
  }) : _scrollController = scrollController;

  final ScrollController? _scrollController;
  final Video? selectedVideo;
  final MiniplayerController miniPlayerController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: CustomScrollView(
          controller: _scrollController,
          shrinkWrap: true,
          slivers: [
            SliverToBoxAdapter(
              child: Consumer(
                builder: (context, ref, _) {
                  return SafeArea(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Image.network(
                              selectedVideo!.thumbnailUrl,
                              height: 220.0,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            IconButton(
                              iconSize: 30.0,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              onPressed: () => miniPlayerController
                                  .animateToHeight(state: PanelState.MIN),
                            ),
                          ],
                        ),
                        const LinearProgressIndicator(
                          value: 0.4,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color.fromARGB(255, 244, 114, 54),
                          ),
                        ),
                        VideoInfo(video: selectedVideo!),
                      ],
                    ),
                  );
                },
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final video = suggestedVideos[index];
                  return VideoCard(
                    video: video,
                    hasPadding: true,
                    onTap: () => _scrollController!.animateTo(
                      0,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeIn,
                    ),
                  );
                },
                childCount: suggestedVideos.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///
/// 横画面再生
///
class _LandscapeScreen extends StatelessWidget {
  const _LandscapeScreen({
    required ScrollController? scrollController,
    required this.selectedVideo,
    required this.miniPlayerController,
  });

  final Video? selectedVideo;
  final MiniplayerController miniPlayerController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network(
                    selectedVideo!.thumbnailUrl,
                    height: MediaQuery.sizeOf(context).height,
                    width: MediaQuery.sizeOf(context).width,
                    fit: BoxFit.cover,
                  ),
                  IconButton(
                    iconSize: 30.0,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    onPressed: () => miniPlayerController.animateToHeight(
                        state: PanelState.MIN),
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
        ),
      ),
    );
  }
}
