import 'package:baseball_tapped_out/model/player.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final lineupProvider =
    NotifierProvider<LineupNotifier, List<Player>>(LineupNotifier.new);

class LineupNotifier extends Notifier<List<Player>> {
  @override
  build() {
    return [];
  }

  void changeState(List<Player> lineup) {
    state = lineup;
  }
}
