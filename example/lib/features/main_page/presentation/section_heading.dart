import 'package:flutter/material.dart';

import 'see_all_button.dart';

class SectionHeading extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  const SectionHeading({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        SeeAllButton(onPressed: onPressed),
      ],
    );
  }
}
