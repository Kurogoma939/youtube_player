import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifier/overlay_entry_notifier.dart';
import 'screem_b.dart';
import 'screem_c.dart';

class ScreenA extends ConsumerWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // provider
    var overlayEntry = ref.watch(overlayEntryProvider);
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
                overlayEntry =
                    OverlayEntry(builder: (context) => const ScreenB());
                Overlay.of(context).insert(
                  // providerにScreenBのOverlayEntryをセット¥
                  overlayEntry!,
                );
              },
            ),
            ElevatedButton(
              child: const Text('Go to Screen C'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ScreenC()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
