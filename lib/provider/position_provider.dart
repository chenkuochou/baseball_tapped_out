import 'package:baseball_tapped_out/model/player.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final positionProvider =
    NotifierProvider<PositionNotifier, List<Player>>(PositionNotifier.new);

class PositionNotifier extends Notifier<List<Player>> {
  @override
  build() {
    return [];
//1 (pitcher), 2 (catcher), 3 (first baseman), 4 (second baseman), 5 (third baseman),
//6 (shortstop), 7 (left fielder), 8 (center fielder), and 9 (right fielder)
  }
}
