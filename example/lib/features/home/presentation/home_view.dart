import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        overlays: SystemUiOverlay.values,);
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

    final bannerWidth = min(MediaQuery.of(context).size.width, 900) * 0.95;
    final bannerHeight = bannerWidth / 1.6;

    return ListView(
      children: [
        bannerFilms.when(
          data: (films) => AnimatedHorizontalListView(
            height: bannerHeight,
            itemWidth: bannerWidth,
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
          loading: () => LoadingElementsStub(
            height: bannerHeight,
            width: bannerWidth,
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
            height: 200,
            color: Colors.red[200],
            child: Center(
              child: Text(
                'error ${__.toString()}',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.amber),
              ),
            ),
          ),
          loading: () => const LoadingElementsStub(
            height: 300,
            width: 160,
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
          loading: () => const LoadingElementsStub(
            height: 300,
            width: 160,
          ),
        ),
      ],
    );
  }
}
