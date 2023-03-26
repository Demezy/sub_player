import 'package:flutter/material.dart';

import 'animated_horisontal_scroll_view.dart';
import 'section_heading.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            AnimatedHorizontalListView(
              height: 200,
              itemWidth: 300,
              children: List.generate(
                10,
                (index) => Padding(
                  key: Key('$index'),
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Color.lerp(Colors.amber, Colors.red, index / 10),
                  ),
                ),
              ),
            ),
            SectionHeading(
              title: 'title',
              onPressed: () {},
            ),
            AnimatedHorizontalListView(
              height: 300,
              itemWidth: 160,
              children: List.generate(
                10,
                (index) => Padding(
                  key: Key('$index'),
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Color.lerp(Colors.blue, Colors.purple, index / 10),
                  ),
                ),
              ),
            ),
            SectionHeading(
              title: 'title2',
              onPressed: () {},
            ),
            AnimatedHorizontalListView(
              height: 300,
              itemWidth: 160,
              children: List.generate(
                10,
                (index) => Padding(
                  key: Key('$index'),
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Color.lerp(Colors.green, Colors.cyan, index / 10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
