import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common_widgets/animated_horizontal_scroll_view.dart';
import '../../details/domain/film_details.dart';
import '../data/film_repository.dart';
import 'widgets/loading_element_stub.dart';

part './widgets/see_all_button.dart';
part 'widgets/banner_film.dart';
part 'widgets/card_film.dart';
part 'widgets/section_heading.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  Future setOrientation() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    setOrientation();
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
              Icon(
                Icons.search,
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                bannerFilms.when(
                  data: (films) => AnimatedHorizontalListView(
                    height: 300,
                    itemWidth: 160,
                    children: films.isEmpty
                        ? const [
                            Center(
                              child: Text('Oops.. Nothing to show.'),
                            )
                          ]
                        : [
                            ...films
                                .map(
                                  (film) => BannerFilm(
                                    film: film,
                                  ),
                                )
                                .toList()
                          ],
                  ),
                  error: (_, __) => Container(
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
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                SectionHeading(
                  title: 'Популярно сейчас',
                  onPressed: () {},
                ),
                //  popular now films
                popularFilms.when(
                  data: (films) => AnimatedHorizontalListView(
                    height: 300,
                    itemWidth: 160,
                    children: films.isEmpty
                        ? const [
                            Center(
                              child: Text('Oops.. Nothing to show.'),
                            )
                          ]
                        : [
                            ...films
                                .map(
                                  (film) => CardFilm(
                                    film: film,
                                  ),
                                )
                                .toList()
                          ],
                  ),
                  error: (_, __) => Container(
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
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                SectionHeading(
                  title: 'Рекомендуем',
                  onPressed: () {},
                ),
                // recommended films
                recommendedFilms.when(
                  data: (films) => AnimatedHorizontalListView(
                    height: 300,
                    itemWidth: 160,
                    children: films.isEmpty
                        ? const [
                            Center(
                              child: Text('Oops.. Nothing to show.'),
                            )
                          ]
                        : [
                            ...films
                                .map(
                                  (film) => CardFilm(
                                    film: film,
                                  ),
                                )
                                .toList()
                          ],
                  ),
                  error: (_, __) => Container(
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
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
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
