// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FilmDetails _$$_FilmDetailsFromJson(Map<String, dynamic> json) =>
    _$_FilmDetails(
      id: json['id'] as int,
      filmTitle: json['filmTitle'] as String,
      filmDescription: json['filmDescription'] as String,
      filmRating: (json['filmRating'] as num?)?.toDouble(),
      filmIMBdRating: (json['filmIMBdRating'] as num?)?.toDouble(),
      filmKinopoiskRating: (json['filmKinopoiskRating'] as num?)?.toDouble(),
      filmLabels: json['filmLabels'] as String,
      filmTrailerLink: json['filmTrailerLink'] as String,
      filmPosterLink: json['filmPosterLink'] as String,
      filmBannerBgLink: json['filmBannerBgLink'] as String?,
      filmBannerTitleLink: json['filmBannerTitleLink'] as String?,
    );

Map<String, dynamic> _$$_FilmDetailsToJson(_$_FilmDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'filmTitle': instance.filmTitle,
      'filmDescription': instance.filmDescription,
      'filmRating': instance.filmRating,
      'filmIMBdRating': instance.filmIMBdRating,
      'filmKinopoiskRating': instance.filmKinopoiskRating,
      'filmLabels': instance.filmLabels,
      'filmTrailerLink': instance.filmTrailerLink,
      'filmPosterLink': instance.filmPosterLink,
      'filmBannerBgLink': instance.filmBannerBgLink,
      'filmBannerTitleLink': instance.filmBannerTitleLink,
    };
