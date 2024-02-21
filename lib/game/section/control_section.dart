import 'package:baseball_tapped_out/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ControlSection extends ConsumerWidget {
  const ControlSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (_, constraints) => Column(
        children: [
          SizedBox(
            height: constraints.maxHeight * 0.25,
          ),
          SizedBox(
            height: constraints.maxHeight * 0.75,
            // padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(flex: 1, child: controlButton('Wait')),
                              Flexible(flex: 1, child: controlButton('Bunt')),
                            ],
                          )),
                      Flexible(
                        flex: 1,
                        child: controlButton('Power'),
                      )
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(flex: 3, child: controlButton('Swing')),
                      Flexible(flex: 1, child: controlButton('Contact')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget controlButton(String text) => Padding(
      padding: const EdgeInsets.all(2),

      /// TODO: Add onTap ripple effect
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Palette.pureWhite),
          ),
          child: Center(child: Text(text)),
        ),
      ),
    );
