// ignore_for_file: unused_element, unused_local_variable

import 'dart:math';

import 'package:baseball_tapped_out/provider/game_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Check status

final gameFlowProvider = Provider((ref) {
  int pControl = ref.watch(currentPitcherProvider).control!;
  int hSwing = ref.watch(currentHitterProvider).eye!;
  int hContact = ref.watch(currentHitterProvider).control!;

});

bool _pStrike(int value) => (_checkIfTrue(value));
bool _hSwing(int value) => _checkIfTrue(value);
bool _hContact(int value) => _checkIfTrue(value);

// Hitter hit

// Ball result

// Basement update

// Player update

// Inning update

/// help funcs
bool _checkIfTrue(int value) => Random().nextDouble() < value / 100;
