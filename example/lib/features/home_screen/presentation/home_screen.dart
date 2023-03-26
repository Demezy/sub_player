import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';

import '../../main_page/presentation/main_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) async {
          if (value != 0) {
            final _ = await showOkAlertDialog(
              context: context,
              title: 'Demo app',
              message: 'This functional is not implemented in demo.',
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Main',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'TV',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_drama),
            label: 'Films',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_add),
            label: 'Series',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_search),
            label: 'More',
          ),
        ],
      ),
      body: const MainPage(),
    );
  }
}
