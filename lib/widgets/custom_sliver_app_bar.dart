import 'package:flutter/material.dart';

import '../data/user.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      leadingWidth: 100.0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Image.asset('assets/youtube-logo.png'),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.cast),
          onPressed: () {
            debugPrint('キャストアイコンタップ');
          },
        ),
        IconButton(
          icon: const Icon(Icons.notifications_outlined),
          onPressed: () {
            debugPrint('通知アイコンタップ');
          },
        ),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            debugPrint('検索アイコンタップ');
          },
        ),
        IconButton(
          iconSize: 40.0,
          icon: CircleAvatar(
            backgroundColor: Colors.white,
            foregroundImage: NetworkImage(currentUser.profileImageUrl),
          ),
          onPressed: () {
            debugPrint('プロフィールアイコンタップ');
          },
        ),
      ],
    );
  }
}
