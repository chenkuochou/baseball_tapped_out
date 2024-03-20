import 'dart:math';

import 'package:baseball_tapped_out/common/common.dart';
import 'package:baseball_tapped_out/common/my_cached_img.dart';
import 'package:baseball_tapped_out/common/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FieldSection extends ConsumerWidget {
  const FieldSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
            height: size.height * 0.3,
            color: Palette.black,
            child: const Row(
              children: [
                DiamondView(),
              ],
            )),
        Center(
          child: myCachedImg('https://api.dicebear.com/7.x/pixel-art/png',height: 20),
        ),
      ],
    );
  }
}

class DiamondView extends ConsumerWidget {
  const DiamondView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (_, constraints) => Container(
        color: Colors.green.shade800,
        width: constraints.maxHeight,
        child: const Diamond(),
      ),
    );
  }
}

class Diamond extends StatelessWidget {
  const Diamond({super.key});

  Widget basement(int baseNumber) {
    return Transform.rotate(
      angle: 45 * pi / 180,
      child: Icon(
        Icons.square,
        size: 30,
        color: true ? Colors.lightGreen : Palette.black,
      ),
    );
  }

  Widget player(int baseNumber) => CircleAvatar(
        radius: 15,
        backgroundImage: null,
        backgroundColor:
            [true, false, true][baseNumber] ? Colors.amber : Colors.transparent,
      );

  LayoutBuilder shape(Widget base1, Widget base2, Widget base3) =>
      LayoutBuilder(
        builder: (_, constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: constraints.maxHeight * 0.1),
              base1,
              // SizedBox(height: constraints.maxHeight * 0.005),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  base2,
                  SizedBox(width: constraints.maxWidth * 0.1),
                  base3,
                ],
              ),
              SizedBox(height: constraints.maxHeight * 0.1),
            ],
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        shape(basement(0), basement(1), basement(2)),
        shape(player(0), player(1), player(2)),
      ],
    );
  }
}
