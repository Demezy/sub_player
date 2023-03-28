part of './main_page.dart';

class BannerFilm extends StatelessWidget {
  final FilmDetails film;

  const BannerFilm({super.key, required this.film});

  @override
  Widget build(BuildContext context) {
    return Stack(
    alignment: Alignment.bottomRight,
      children: [
        Image.network(
          film.filmPosterLink,
          fit: BoxFit.cover,
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.music_note),
        )
      ],
    );
  }
}
