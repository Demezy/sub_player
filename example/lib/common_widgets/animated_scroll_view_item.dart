part of 'animated_horizontal_scroll_view.dart';

class AnimatedScrollViewItem extends HookWidget {
  const AnimatedScrollViewItem({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 300),
    )..forward();
    final scaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );
    return ScaleTransition(
      scale: scaleAnimation,
      child: child,
    );
  }
}
