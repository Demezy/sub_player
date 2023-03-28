import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'animated_horisontal_scroll_view.dart';

part './section_heading.dart';
part './see_all_button.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: SvgPicture.asset(
              'assets/svg/kion_logo.svg',
              semanticsLabel: 'kion logo',
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 12.0),
                child: Icon(Icons.settings),
              ),
              Icon(Icons.search),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                AnimatedHorizontalListView(
                  height: 200,
                  itemWidth: 300,
                  children: List.generate(
                    10,
                    (index) => Container(
                      color: Color.lerp(
                        Colors.amber,
                        Colors.red,
                        index / 10,
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
                    (index) => Container(
                      color: Color.lerp(
                        Colors.blue,
                        Colors.purple,
                        index / 10,
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
                    (index) => Container(
                      color: Color.lerp(
                        Colors.green,
                        Colors.cyan,
                        index / 10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
