part of './main_page.dart';

class CardFilm extends StatelessWidget {
  final FilmDetails film;

  const CardFilm({super.key, required this.film});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(film.filmPosterLink),
        Text(film.filmTitle,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium),
        Row(
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            Text(
              '${film.filmRating}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            // Text(data)
          ],
        )
      ],
    );
  }
}
