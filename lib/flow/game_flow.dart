import 'dart:math';

import 'package:baseball_tapped_out/provider/game_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

double _number = Random().nextDouble();
// Check status

final gameFlowProvider = Provider((ref) {
  bool isPitchingStrike =
      _isPitchingStrike(ref.watch(currentPitcherProvider)!.control!);

  if (isPitchingStrike) {
    // Strike
  } else {
    // Ball
  }
  return;
});

bool _isPitchingStrike(int value) {
  return _number < value / 100;
}


// Hitter hit

// Ball result

// Basement update

// Player update

// Inning update
