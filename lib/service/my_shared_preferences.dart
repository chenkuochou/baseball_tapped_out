import 'package:baseball_tapped_out/model/player.dart';
import 'package:baseball_tapped_out/provider/player_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';


// void saveHitters(List<Player> hitters) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();

//   List<String> data = hitters.map((e) => e.toJson()).toList();
//   prefs.setStringList('hitters', data);
//   // print(data.first);
//   debugPrint('saveHitters');
// }

// final readHittersProvider = FutureProvider((ref) async {
//   // final preferences = ref.watch(sharedPreferencesProvider);
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   final List<String> data = prefs.getStringList('hitters') ?? [];

//   final List<Player> result = data.map((e) => Player.fromJson(e)).toList();
//   ref.read(hittersProvider.notifier).updateState(result);
//   // print(result.first);
//   debugPrint('readHittersProvider');
// });

// Future readHitters() async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();

//   final List<String> data = prefs.getStringList('hitters') ?? [];
//   print(data[2]);
//   final List<Player> result = data.map((e) => Player.fromJson(e)).toList();
// }
