part of '../home_view.dart';

class CardFilm extends StatefulWidget {
  const CardFilm({Key? key, required this.film}) : super(key: key);

  final FilmDetails film;

  @override
  State<CardFilm> createState() => _CardFilmState();
}

class _CardFilmState extends State<CardFilm> {
  bool focused = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onFocusChange: (newFocused) {
        setState(() {
          focused = newFocused;
        });
      },
      focusColor: Colors.transparent,
      onTap: () => Navigator.pushNamed(
        context,
        '/description',
        arguments: widget.film,
      ),
      child: Transform.scale(
        scale: focused ? 1.2 : 1,
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
                    widget.film.filmPosterLink,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                widget.film.filmTitle,
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
                      text: ' ${widget.film.filmRating}  ',
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
      ),
    );
  }
}
