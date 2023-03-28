import 'package:flutter/material.dart';

import '../../../../common_widgets/responsive.dart';

class GradientWidget extends StatelessWidget {
  final Widget child;

  const GradientWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Responsive.isDesktop(context)
            ? Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Theme.of(context).scaffoldBackgroundColor.withOpacity(.5),
                      Theme.of(context).scaffoldBackgroundColor,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [ 0.6, 0.7, 1.0],
                  )),
                ),
              )
            : const SizedBox.shrink(),
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: Responsive.isMobile(context)
                  ? LinearGradient(
                      colors: [
                        Theme.of(context).scaffoldBackgroundColor,
                        Theme.of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(.5),
                        Colors.transparent,
                        Colors.transparent,
                        Theme.of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(.5),
                        Theme.of(context).scaffoldBackgroundColor,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.0, 0.1, 0.2, 0.6, 0.8, 1.0],
                    )
                  : RadialGradient(
                      radius: 0.85,
                      colors: [
                        Colors.transparent,
                        Theme.of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(.5),
                        Theme.of(context).scaffoldBackgroundColor,
                      ],
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
