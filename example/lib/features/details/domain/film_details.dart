import 'package:freezed_annotation/freezed_annotation.dart';

part 'film_details.freezed.dart';

part 'film_details.g.dart';

@freezed
class FilmDetails with _$FilmDetails {
  const factory FilmDetails({
    required int id,
    required String filmTitle,
    required String filmDescription,
    required double? filmRating,
    required double? filmIMBdRating,
    required double? filmKinopoiskRating,
    required String filmLabels,
    required String filmTrailerLink,
    required String filmPosterLink,
  }) = _FilmDetails;

  factory FilmDetails.fromJson(Map<String, Object?> json) =>
      _$FilmDetailsFromJson(json);
}
