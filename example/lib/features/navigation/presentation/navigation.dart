import 'package:flutter/material.dart';

import '../../../common_widgets/responsive.dart';
import 'widgets/navigation_desktop.dart';
import 'widgets/navigation_mobile.dart';

class AdaptiveNavigation extends StatelessWidget {
  final Widget body;
  const AdaptiveNavigation({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context)
        ? NavigationMobile(body: body)
        : NavigationDesktop(body: body);
  }
}
