// OverlayEntryをProviderで管理する
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final overlayEntryProvider =
    StateNotifierProvider<OverlayEntryStateNotifier, OverlayEntry?>((ref) {
  return OverlayEntryStateNotifier();
});

class OverlayEntryStateNotifier extends StateNotifier<OverlayEntry?> {
  OverlayEntryStateNotifier() : super(null);

  void updateOverlayEntry(BuildContext context, OverlayEntry? newOverlayEntry) {
    state = newOverlayEntry;
    // overlayEntryを表示する
    Overlay.of(context).insert(
      // providerにScreenBのOverlayEntryをセット¥
      state!,
    );
  }

  void removeOverlayEntry() {
    state?.remove();
    state = null;
  }
}
