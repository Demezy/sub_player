import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class KionLogo extends StatelessWidget {
  const KionLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/kion_logo.svg',
      semanticsLabel: 'kion logo',
    );
  }
}
