import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

part 'animated_scroll_view_item.dart';

class AnimatedHorizontalListView extends StatelessWidget {
  final List<Widget> children;
  final double height;
  final double itemWidth;

  const AnimatedHorizontalListView({
    Key? key,
    required this.children,
    this.height = 220,
    this.itemWidth = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        cacheExtent: 0,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
        itemCount: children.length,
        itemBuilder: (context, index) {
          return AnimatedScrollViewItem(
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SizedBox(
                width: itemWidth,
                child: children[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
