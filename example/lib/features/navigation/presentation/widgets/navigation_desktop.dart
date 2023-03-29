import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';

import '../../../../common_widgets/logo.dart';
import '../../../../common_widgets/responsive.dart';
import '../../../../common_widgets/responsive_center.dart';

part './navigation_desktop_nav_item.dart';

class NavigationDesktop extends StatelessWidget {
  final Widget body;
  const NavigationDesktop({
    super.key,
    required this.body,
  });

  final Widget gapSmall = const SizedBox(width: 24);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          MediaQuery.of(context).padding.top + kToolbarHeight,
        ),
        child: Padding(
          padding: Responsive.isTablet(context)
              ? const EdgeInsets.symmetric(horizontal: 20)
              : const EdgeInsets.only(),
          child: ResponsiveCenter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const KionLogo(),
                // navigation
                Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 3,
                            color: Theme.of(context)
                                    .bottomNavigationBarTheme
                                    .selectedIconTheme
                                    ?.color ??
                                Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Главная',
                          style: TextStyle(
                            color: Theme.of(context)
                                    .bottomNavigationBarTheme
                                    .selectedIconTheme
                                    ?.color ??
                                Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                    gapSmall,
                    const NavigationDesktopItem(title: 'Телеканалы'),
                    gapSmall,
                    const NavigationDesktopItem(title: 'Фильмы'),
                    gapSmall,
                    const NavigationDesktopItem(title: 'Сериалы'),
                  ],
                ),
                Row(
                  children: const [
                    SizedBox(
                      width: 300,
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Поиск',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.person,
                      ),
                    ),
                    NavigationDesktopItem(title: 'Войти'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: Responsive.isTablet(context)
            ? const EdgeInsets.symmetric(horizontal: 20)
            : const EdgeInsets.only(),
        child: ResponsiveCenter(child: body),
      ),
    );
  }
}
