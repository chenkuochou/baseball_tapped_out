import 'package:baseball_tapped_out/model/player.dart';
import 'package:baseball_tapped_out/provider/player_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class FieldingTab extends ConsumerWidget {
  const FieldingTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Player> players = ref.read(hittersProvider);
    // final AsyncValue<List<Player>> activity = ref.watch(hittersProvider);

    Widget fielderTag(String position, Player player) {
      return Column(
        children: [
          CircleAvatar(
            // radius: 20,
            backgroundColor: Colors.transparent,
            child: SvgPicture.network(player.avatarUrl, height: 30),
          ),
          // const SizedBox(height: 5),
          Container(
            padding:
                const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Text(
              position,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    }

    return LayoutBuilder(
      builder: (_, box) {
        bool widerScreen = (box.maxWidth / box.maxHeight > 2);
        return SingleChildScrollView(
          controller: ScrollController(
            initialScrollOffset: 150.0,
            keepScrollOffset: true,
          ),
          scrollDirection: Axis.vertical,
          physics: const ClampingScrollPhysics(),
          child:
              // switch (activity) {
              //   AsyncData(:final value) =>

              Container(
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
                SizedBox(height: box.maxHeight * (widerScreen ? 0.35 : 0.2)),
                fielderTag('CF', players[0]),
                SizedBox(height: box.maxHeight * (widerScreen ? 0.05 : 0)),
                SizedBox(
                  width: box.maxWidth * 0.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      fielderTag('LF', players[1]),
                      fielderTag('RF', players[2]),
                    ],
                  ),
                ),
                SizedBox(height: box.maxHeight * (widerScreen ? 0.02 : 0)),
                SizedBox(
                  width: box.maxWidth * 0.35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      fielderTag('SS', players[3]),
                      fielderTag('2B', players[4]),
                    ],
                  ),
                ),
                SizedBox(height: box.maxHeight * (widerScreen ? 0.05 : 0)),
                SizedBox(
                  width: box.maxWidth * 0.55,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      fielderTag('3B', players[5]),
                      fielderTag('1B', players[6]),
                    ],
                  ),
                ),
                // SizedBox(height: box.maxHeight * 0.0005),
                fielderTag('SP', players[7]),
                SizedBox(height: box.maxHeight * (widerScreen ? 0.25 : 0.15)),
                fielderTag('C', players[8]),
              ],
            ),
          ),
          // AsyncError() => const Text('Oops, something unexpected happened'),
          // _ => const CircularProgressIndicator(),
          // },
        );
      },
    );
  }
}
