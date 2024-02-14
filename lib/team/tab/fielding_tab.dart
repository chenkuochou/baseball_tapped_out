import 'package:baseball_tapped_out/model/player.dart';
import 'package:baseball_tapped_out/provider/player_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FieldingTab extends ConsumerStatefulWidget {
  const FieldingTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FieldingTabState();
}

class _FieldingTabState extends ConsumerState<FieldingTab>
    with AutomaticKeepAliveClientMixin<FieldingTab> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final List<Player> players = ref.read(hittersProvider);

    Container fielderTag(String position, Player player) {
      return Container(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
        decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Text(
          position,
          style: const TextStyle(color: Colors.white),
        ),
      );
    }

    return LayoutBuilder(
      builder: (_, box) {
        bool widerScreen = (box.maxWidth / box.maxHeight > 2);
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const ClampingScrollPhysics(),
          child: Container(
            height: box.maxHeight + (widerScreen ? 300 : 200),
            decoration: const BoxDecoration(
              color: Color(0xff301F1A),
              image: DecorationImage(
                image: AssetImage("assets/images/field.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: box.maxHeight * 0.07),
                fielderTag('CF', players[0]),
                SizedBox(height: box.maxHeight * 0.07),
                SizedBox(
                  width: box.maxWidth * 0.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      fielderTag('LF', players[0]),
                      fielderTag('RF', players[0]),
                    ],
                  ),
                ),
                SizedBox(height: box.maxHeight * 0.2),
                SizedBox(
                  width: box.maxWidth * 0.4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      fielderTag('SS', players[0]),
                      fielderTag('2B', players[0]),
                    ],
                  ),
                ),
                SizedBox(height: box.maxHeight * 0.2),
                SizedBox(
                  width: box.maxWidth * 0.55,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      fielderTag('3B', players[0]),
                      fielderTag('1B', players[0]),
                    ],
                  ),
                ),
                SizedBox(height: box.maxHeight * 0.04),
                fielderTag('SP', players[0]),
                SizedBox(height: box.maxHeight * 0.08),
                fielderTag('C', players[0]),
              ],
            ),
          ),
        );
      },
    );
  }
}
