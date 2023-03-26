import 'package:flutter/material.dart';

class SeeAllButton extends StatelessWidget {
  final void Function() onPressed;
  const SeeAllButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: const Text('All >'));
  }
}
