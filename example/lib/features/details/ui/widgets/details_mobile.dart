import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readmore/readmore.dart';

import '../../../../common_widgets/animated_horizontal_scroll_view.dart';
import '../../../home/data/film_repository.dart';
import '../../../home/presentation/home_view.dart';
import 'movie_trailer.dart';

class DetailsMobileView extends ConsumerStatefulWidget {
  const DetailsMobileView({Key? key}) : super(key: key);

  @override
  ConsumerState<DetailsMobileView> createState() => _DetailsMobileViewState();
}

class _DetailsMobileViewState extends ConsumerState<DetailsMobileView> {
  @override
  void initState() {
    super.initState();
    setOrientation();
  }

  Future setOrientation() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final popularFilms = ref.watch(popularFilmsProvider);
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final film = arguments['film'];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: MovieTrailer(
                  trailerLink: film.filmTrailerLink,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 160,
                      width: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          film.filmPosterLink,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .5,
                          child: Text(
                            film.filmTitle,
                            softWrap: true,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                const WidgetSpan(
                                  child: Icon(
                                    Icons.star,
                                    size: 14,
                                    color: Colors.white70,
                                  ),
                                ),
                                TextSpan(
                                  text: ' ${film.filmRating.toString()} ',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                const WidgetSpan(
                                  child: Icon(
                                    Icons.reviews,
                                    size: 14,
                                    color: Colors.white70,
                                  ),
                                ),
                                TextSpan(
                                  text: ' ${film.filmIMBdRating.toString()} ',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                const WidgetSpan(
                                  child: Icon(
                                    Icons.change_circle_rounded,
                                    size: 14,
                                    color: Colors.white70,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      ' ${film.filmKinopoiskRating.toString()} ',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(
                context,
                '/player',
                arguments: {
                  'filmId': film.id,
                },
              ),
              child: const Text('Смотреть'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ReadMoreText(
              film.filmDescription,
              trimLines: 5,
              colorClickableText: Theme.of(context).primaryColor,
              trimMode: TrimMode.Line,
              trimCollapsedText: '\t\t\t▼',
              trimExpandedText: '\t\t\t▲',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  film.filmLabels,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Все о сериале',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white),
                          ),
                          padding: const EdgeInsets.all(12),
                          width: double.infinity,
                          child: const Icon(Icons.star_border_outlined),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Оценить',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () => Navigator.pushNamed(
                            context,
                            '/player',
                            arguments: {
                              'filmId': film.id,
                            },
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white),
                            ),
                            padding: const EdgeInsets.all(12),
                            width: double.infinity,
                            child: const Icon(Icons.bookmark_add_outlined),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Смотреть',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white),
                          ),
                          padding: const EdgeInsets.all(12),
                          width: double.infinity,
                          child: const Icon(Icons.ios_share_rounded),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Поделиться',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              'Специально для вас',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
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
        ],
      ),
    );
  }
}
