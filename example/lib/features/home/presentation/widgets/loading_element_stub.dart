import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../common_widgets/animated_horizontal_scroll_view.dart';

class LoadingElementsStub extends HookWidget {
  final double height;
  final double width;
  final int childrenCount;
  const LoadingElementsStub({
    required this.height,
    required this.width,
    this.childrenCount = 5,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final opacityController = useAnimationController(
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
    final opacity = useAnimation<double>(
        Tween<double>(begin: 1, end: 0.2).animate(opacityController),);
    return Shimmer.fromColors(
      baseColor: Theme.of(context).cardColor,
      highlightColor: const Color(0xffaaaaaa),
      child: AnimatedHorizontalListView(
        height: height,
        itemWidth: width,
        children: List<Widget>.generate(
          childrenCount,
          (index) => Container(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
