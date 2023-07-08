import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifier/overlay_entry_notifier.dart';
import 'screen_b.dart';
import 'screen_c.dart';

class ScreenA extends ConsumerWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // provider
    final overlayEntryNotifier = ref.watch(overlayEntryProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen A'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('Go to Screen B'),
              onPressed: () {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  overlayEntryNotifier.updateOverlayEntry(
                    context,
                    OverlayEntry(
                      builder: (context) => const ScreenB(),
                    ),
                  );
                });
              },
            ),
            ElevatedButton(
              child: const Text('Go to Screen C'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenC(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
