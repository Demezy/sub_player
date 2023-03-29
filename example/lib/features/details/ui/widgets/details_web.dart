import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../common_widgets/responsive_center.dart';
import '../../domain/film_details.dart';
import 'movie_trailer.dart';

class DetailsWebView extends StatelessWidget {
  const DetailsWebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final film = ModalRoute.of(context)?.settings.arguments as FilmDetails;

    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Padding(
            padding:
                EdgeInsets.only(right: MediaQuery.of(context).size.width * .03),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .76,
              child: MovieTrailer(
                trailerLink: film.filmTrailerLink,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.width * .2,
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ResponsiveCenter(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.width * .2,
                            width: MediaQuery.of(context).size.width * .14,
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
                          Flexible(
                            fit: FlexFit.tight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .5,
                                  child: Text(
                                    film.filmTitle,
                                    softWrap: true,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                          fontSize: 36,
                                        ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  '2012 | Россия | 1 сезон',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        const WidgetSpan(
                                          child: Icon(
                                            Icons.star,
                                            color: Colors.white70,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              ' ${film.filmRating.toString()} ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge,
                                        ),
                                        TextSpan(
                                          text:
                                              'IMDB ${film.filmIMBdRating.toString()} | Kinopoisk ${film.filmKinopoiskRating.toString()} ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .1,
                                      child: ElevatedButton(
                                        onPressed: () => Navigator.pushNamed(
                                          context,
                                          '/player',
                                          arguments: film,
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text('Смотреть'),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12.0,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(.3),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.white),
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      child: const Icon(
                                        Icons.bookmark_add_outlined,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12.0,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(.3),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.white),
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      child:
                                          const Icon(Icons.ios_share_rounded),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 32,
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
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 18,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
