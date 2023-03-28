import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../details/domain/film_details.dart';
import '../data/film_repository.dart';
import 'animated_horisontal_scroll_view.dart';

part './section_heading.dart';
part './see_all_button.dart';
part './banner_film.dart';
part './card_film.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bannerFilms = ref.watch(bigBannerFilmsProvider);
    final popularFilms = ref.watch(popularFilmsProvider);
    final recommendedFilms = ref.watch(recommendedFilmsProvider);

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
                // big baner films
                AnimatedHorizontalListView(
                  height: 200,
                  itemWidth: 300,
                  children: bannerFilms.when(
                    data: (films) => films.isEmpty
                        ? const [
                            Center(
                              child: Text('empty'),
                            )
                          ]
                        : films.map((film) => BannerFilm(film: film)).toList(),
                    error: (_, __) => [
                      Container(
                        color: Colors.red[200],
                        child: Center(
                          child: Text(
                            'error',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: Colors.amber),
                          ),
                        ),
                      )
                    ],
                    loading: () => List<Widget>.generate(
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
                ),

                SectionHeading(
                  title: 'Popular now',
                  onPressed: () {},
                ),
                //  popular now films
                AnimatedHorizontalListView(
                  height: 300,
                  itemWidth: 160,
                  children: popularFilms.when(
                    data: (films) => films.isEmpty
                        ? const [
                            Center(
                              child: Text('empty'),
                            )
                          ]
                        : films.map((film) => CardFilm(film: film)).toList(),
                    error: (_, __) => [
                      Container(
                        color: Colors.red[200],
                        child: Center(
                          child: Text(
                            'error',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: Colors.amber),
                          ),
                        ),
                      )
                    ],
                    loading: () => List<Widget>.generate(
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
                ),
                SectionHeading(
                  title: 'Recommend',
                  onPressed: () {},
                ),
                // recommended films
                AnimatedHorizontalListView(
                  height: 300,
                  itemWidth: 160,
                  children: popularFilms.when(
                    data: (films) => films.isEmpty
                        ? const [
                            Center(
                              child: Text('empty'),
                            )
                          ]
                        : films.map((film) => CardFilm(film: film)).toList(),
                    error: (_, __) => [
                      Container(
                        color: Colors.red[200],
                        child: Center(
                          child: Text(
                            'error',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: Colors.amber),
                          ),
                        ),
                      )
                    ],
                    loading: () => List<Widget>.generate(
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
