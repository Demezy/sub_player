import 'package:flutter/material.dart';

import '../../../common_widgets/responsive.dart';
import 'widgets/details_mobile.dart';
import 'widgets/details_web.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Responsive.isMobile(context)
      ? const DetailsMobileView()
      : const DetailsWebView();
}
