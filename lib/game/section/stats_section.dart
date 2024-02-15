import 'package:baseball_tapped_out/provider/game_stats_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatsSection extends ConsumerWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameStats = ref.watch(gameStatsProvider);
    final Size size = MediaQuery.of(context).size;

    TextStyle boardStyle =
        const TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
    TextStyle scoreStyle =
        const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold);

    Widget horizontalList(List list, [bool board = false]) {
      return Container(
        height: size.height * 0.05, //20,
        color: board ? Colors.transparent : Colors.black,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          primary: false,
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (_, index) {
            return SizedBox(
              width: size.height * 0.05,
              child: Center(
                  child: Align(
                alignment: const Alignment(0.1, 0.4),
                child: Text(list[index].toString(),
                    style: board ? boardStyle : scoreStyle),
              )),
            );
          },
        ),
      );
    }

    Widget blackCircle() {
      return const Icon(
        Icons.circle,
        size: 20,
        color: Colors.black,
      );
    }

    Widget greenCircle() {
      return const Icon(
        Icons.circle,
        size: 20,
        color: Colors.lightGreen,
      );
    }

    Widget redCircle() {
      return const Icon(
        Icons.circle,
        size: 20,
        color: Colors.red,
      );
    }

    List<Widget> ballSwitch() {
      return switch (gameStats.ball) {
        1 => [greenCircle(), blackCircle(), blackCircle()],
        2 => [greenCircle(), greenCircle(), blackCircle()],
        3 => [greenCircle(), greenCircle(), greenCircle()],
        _ => [blackCircle(), blackCircle(), blackCircle()],
      };
    }

    List<Widget> strikeSwitch() {
      return switch (gameStats.strike) {
        1 => [redCircle(), blackCircle()],
        2 => [redCircle(), redCircle()],
        _ => [blackCircle(), blackCircle()],
      };
    }

    List<Widget> outSwitch() {
      return switch (gameStats.out) {
        1 => [redCircle(), blackCircle()],
        2 => [redCircle(), redCircle()],
        _ => [blackCircle(), blackCircle()],
      };
    }

    return LayoutBuilder(
      builder: (_, constraints) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          // width: constraints.maxWidth,
          constraints: BoxConstraints(
            minWidth: constraints.maxWidth,
          ),
          // -AppBar().preferredSize.height
          //  - MediaQuery.of(context).padding.top
          //  - MediaQuery.of(context).padding.bottom
          //  + 40
          // -kBottomNavigationBarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Away', style: boardStyle),
                          const SizedBox(height: 5),
                          Text('Home', style: boardStyle),
                          const SizedBox(height: 2),
                        ],
                      ),
                      const SizedBox(width: 5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          horizontalList(
                              List.generate(9, (i) => (i + 1)), true),
                          horizontalList(gameStats.scoreList.first),
                          horizontalList(gameStats.scoreList.last),
                        ],
                      ),
                      const SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          horizontalList(['R', 'H', 'E'], true),
                          horizontalList([
                            gameStats.runs[0],
                            gameStats.hits[0],
                            gameStats.errors[0]
                          ]),
                          horizontalList([
                            gameStats.runs[1],
                            gameStats.hits[1],
                            gameStats.errors[1]
                          ]),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(width: size.width * 0.03),
              Row(
                children: [
                  Row(
                    children: [
                      Text(gameStats.inning.toString(), style: boardStyle),
                      Icon(
                        gameStats.isAway
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(width: 5),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('AT BAT', style: boardStyle),
                      const SizedBox(height: 2),
                      Container(
                        color: Colors.black,
                        padding:
                            const EdgeInsets.only(left: 3, right: 3, top: 2),
                        child: Text('11', style: scoreStyle),
                      ),
                    ],
                  ),
                  const SizedBox(width: 5),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Text('BALL', style: boardStyle),
                      ),
                      Row(
                        children: ballSwitch(),
                      ),
                    ],
                  ),
                  const SizedBox(width: 5),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('STRIKE', style: boardStyle),
                      Row(
                        children: strikeSwitch(),
                      ),
                    ],
                  ),
                  const SizedBox(width: 5),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: Text('OUT', style: boardStyle),
                      ),
                      Row(
                        children: outSwitch(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
