// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FilmDetails _$$_FilmDetailsFromJson(Map<String, dynamic> json) =>
    _$_FilmDetails(
      filmTitle: json['filmTitle'] as String,
      filmDescription: json['filmDescription'] as String,
      filmRating: (json['filmRating'] as num).toDouble(),
      filmIMBdRating: (json['filmIMBdRating'] as num).toDouble(),
      filmKinopoiskRating: (json['filmKinopoiskRating'] as num).toDouble(),
      filmLabels: (json['filmLabels'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      filmTrailerLink: json['filmTrailerLink'] as String,
      filmPosterLink: json['filmPosterLink'] as String,
    );

Map<String, dynamic> _$$_FilmDetailsToJson(_$_FilmDetails instance) =>
    <String, dynamic>{
      'filmTitle': instance.filmTitle,
      'filmDescription': instance.filmDescription,
      'filmRating': instance.filmRating,
      'filmIMBdRating': instance.filmIMBdRating,
      'filmKinopoiskRating': instance.filmKinopoiskRating,
      'filmLabels': instance.filmLabels,
      'filmTrailerLink': instance.filmTrailerLink,
      'filmPosterLink': instance.filmPosterLink,
    };