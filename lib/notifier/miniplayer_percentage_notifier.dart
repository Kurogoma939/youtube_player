import 'package:flutter_riverpod/flutter_riverpod.dart';

final miniplayerPercentageProvider =
    StateNotifierProvider<MiniplayerPercentageNotifier, double>((ref) {
  return MiniplayerPercentageNotifier();
});

class MiniplayerPercentageNotifier extends StateNotifier<double> {
  MiniplayerPercentageNotifier() : super(0);

  void updatePercentage(double newPercentage) {
    state = newPercentage;
  }
}
