part of '../home_view.dart';

class BannerFilm extends StatelessWidget {
  final FilmDetails film;

  const BannerFilm({super.key, required this.film});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Positioned.fill(
          child: Image.network(
            film.filmBannerBgLink ?? film.filmPosterLink,
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: film.filmBannerTitleLink == null
                ? const SizedBox.shrink()
                : LayoutBuilder(
                    builder: (context, constraints) => Image.network(
                      film.filmBannerTitleLink!,
                      width: constraints.maxWidth / 2,
                    ),
                  ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.music_note),
        )
      ],
    );
  }
}
