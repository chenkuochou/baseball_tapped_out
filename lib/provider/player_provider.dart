import 'package:baseball_tapped_out/flow/player_generator.dart';
import 'package:baseball_tapped_out/main.dart';
import 'package:baseball_tapped_out/model/player.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final hittersProvider =
    NotifierProvider<HittersNotifier, List<Player>>(HittersNotifier.new);

final pitchersProvider =
    NotifierProvider<PitchersNotifier, List<Player>>(PitchersNotifier.new);

class HittersNotifier extends Notifier<List<Player>> {
  @override
  List<Player> build() {
    final preferences = ref.watch(sharedPreferencesProvider);
    final List<Player> currentValue;
    final List<String>? data = preferences.getStringList('hitters');
    if (data != null) {
      currentValue = data.map((e) => Player.fromJson(e)).toList();
    } else {
      currentValue = generateHitters();
    }

    ref.listenSelf((_, current) {
      final List<String> data = current.map((e) => e.toJson()).toList();
      preferences.setStringList('hitters', data);
    });
    return currentValue;
  }

  void updateState(List<Player> hitters) {
    state = hitters;
  }
}

class PitchersNotifier extends Notifier<List<Player>> {
  @override
  List<Player> build() {
    final preferences = ref.watch(sharedPreferencesProvider);
    final List<Player> currentValue;
    final List<String>? data = preferences.getStringList('pitchers');
    if (data != null) {
      currentValue = data.map((e) => Player.fromJson(e)).toList();
    } else {
      currentValue = generatePitchers();
    }

    ref.listenSelf((_, current) {
      final List<String> data = current.map((e) => e.toJson()).toList();
      preferences.setStringList('pitchers', data);
    });
    return currentValue;
  }

  void updateState(List<Player> hitters) {
    state = hitters;
  }
}
