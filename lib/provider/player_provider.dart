import 'dart:convert';

import 'package:baseball_tapped_out/generator/player_generator.dart';
import 'package:baseball_tapped_out/model/player.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// final hittersProvider =
//     AsyncNotifierProvider.autoDispose<HittersNotifier, List<Player>>(
//         HittersNotifier.new);

// class HittersNotifier extends AutoDisposeAsyncNotifier<List<Player>> {
//   HittersNotifier() : super(_initial()); // Call _initial() in the constructor

//   static Future<List<Player>> _initial() async {
//     final hitters =  generateHitters();
//     return hitters;
//   }

//   @override
//   Future<List<Player>> build() async => state; // Return cached state
// }

// final counterProvider = StateProvider<List<Player>>((ref) => generateHitters());

// class CounterNotifier extends StateNotifier<List<Player>> {
//   CounterNotifier() : super([]); // Initial state is 0

//   void initPlayers() {
//     state = generateHitters();

//   }
// }

// final counterProvider2 = StateNotifierProvider<CounterNotifier, List<Player>>(
//     (ref) => CounterNotifier());


final hittersProvider =
    NotifierProvider<HittersNotifier, List<Player>>(HittersNotifier.new);

class HittersNotifier extends Notifier<List<Player>> {
  @override
  List<Player> build() {
    // final preferences = ref.watch(sharedPreferencesProvider);
    // Map json = jsonDecode(preferences.getString('userData')!);
    // final List<Player>? user = Player.fromJson(json as String) as List<Player>?;
    final List<Player> currentValue = generateHitters();
    return currentValue;
    // return generateHitters();
  }

  void updateState(List<Player> players) async {
    state = players;
  }
}

// final hitterProvider =
//     StateNotifierProvider<HitterNotifier, List<Player>>((ref) {
//   return HitterNotifier();
// });

// class HitterNotifier extends StateNotifier<List<Player>> {
//   HitterNotifier() : super(generateHitters());
// }

// final teamProvider = FutureProvider<List<Player>>((ref) async {
//   return generateHitters();
// });

// final hittersProvider =
//     StateNotifierProvider<HittersNotifier, List<Player>?>((ref) {
//   final hitters = ref.watch(teamProvider);
//   return HittersNotifier();
// });

// class HittersNotifier extends StateNotifier<List<Player>?> {
//   HittersNotifier() : super(generateHitters());
// }
