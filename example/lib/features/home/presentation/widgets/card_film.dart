part of '../home_view.dart';

class CardFilm extends StatelessWidget {
  const CardFilm({Key? key, required this.film}) : super(key: key);

  final FilmDetails film;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/description', arguments: {
        'film': film,
      },),
      child: SizedBox(
        height: 300,
        width: 160,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  film.filmPosterLink,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              film.filmTitle,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
            ),
            RichText(
              text: TextSpan(
                children: [
                  const WidgetSpan(
                    child: Icon(
                      Icons.star,
                      size: 14,
                      color: Colors.amber,
                    ),
                  ),
                  TextSpan(
                    text: ' ${film.filmRating}  ',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextSpan(
                    text: ' / Бесплатно',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.green),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
