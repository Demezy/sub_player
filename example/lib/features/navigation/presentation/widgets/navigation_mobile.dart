import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';

import '../../../../common_widgets/logo.dart';

class NavigationMobile extends StatelessWidget {
  final Widget body;
  const NavigationMobile({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const KionLogo(),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Icon(Icons.segment),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Icon(Icons.search),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF232E42),
        selectedItemColor: const Color(0xFFB3A976),
        onTap: (value) => value != 0
            ? showOkAlertDialog(
                context: context,
                title: 'Демо приложение',
                message: 'Этот функционал не поддерживается.',
              )
            : null,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'ТВ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_drama),
            label: 'Фильмы',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_add),
            label: 'Сериалы',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_search),
            label: 'Еще',
          ),
        ],
      ),
      body: body,
    );
  }
}
