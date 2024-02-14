import 'package:baseball_tapped_out/generator/player_generator.dart';
import 'package:baseball_tapped_out/model/player.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hittersProvider =
    NotifierProvider<HittersNotifier, List<Player>>(HittersNotifier.new);

class HittersNotifier extends Notifier<List<Player>> {
  @override
  List<Player> build() => generateHitters();
}
