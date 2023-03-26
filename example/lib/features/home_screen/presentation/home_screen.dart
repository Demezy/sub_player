import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final Widget child;
  const HomeScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
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
      body: child,
    );
  }
}
