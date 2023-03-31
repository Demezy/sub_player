import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../../details/domain/film_details.dart';

typedef Films = List<FilmDetails>;
typedef ResponseJson = Map<String, dynamic>;

class FilmRepository {
  FilmRepository();

  final Dio _dio = GetIt.I.get<Dio>();

  Future<Films> getBigBanner() async {
    late final Response<List> response;
    try {
      response = await _dio.get<List>('/movies/banners/');
    } on DioError {
      throw UnimplementedError();
    }
    if (response.data == null) {
      throw UnimplementedError();
    }

    return (response.data as List)
        .map((dynamic e) => FilmDetails.fromJson(e as ResponseJson))
        .toList();
  }

  Future<Films> getPopularNow() async {
    late final Response<List> response;
    try {
      response = await _dio.get<List>('/movies/');
    } on DioError catch (e) {
      print(e.toString());
      throw UnimplementedError();
    }
    if (response.data == null) {
      throw UnimplementedError();
    }

    return (response.data as List)
        .map((dynamic e) => FilmDetails.fromJson(e as ResponseJson))
        .toList();
  }

  Future<Films> getRecommended() async {
    late final Response<List> response;
    try {
      response = await _dio.get<List>('/movies/recommended/');
    } on DioError {
      throw UnimplementedError();
    }
    if (response.data == null) {
      throw UnimplementedError();
    }

    return (response.data as List)
        .map((dynamic e) => FilmDetails.fromJson(e as ResponseJson))
        .toList();
  }

  Future<List<String>> getQualities(int filmId) async {
    late final Response<List> response;
    try {
      response = await _dio.get<List>('/movies/$filmId/qualities');
    } on DioError {
      throw UnimplementedError();
    }
    if (response.data == null) {
      throw UnimplementedError();
    }

    return (response.data as List).map((e) => e as String).toList();
  }
}

final filmRepositoryProvider =
    Provider<FilmRepository>((ref) => FilmRepository());

final bigBannerFilmsProvider = FutureProvider<Films>(
  (ref) => ref.read(filmRepositoryProvider).getBigBanner(),
);

final popularFilmsProvider = FutureProvider<Films>(
  (ref) => ref.read(filmRepositoryProvider).getPopularNow(),
);

final recommendedFilmsProvider = FutureProvider<Films>(
  (ref) => ref.read(filmRepositoryProvider).getRecommended(),
);

final filmQualitiesProvider =
    FutureProvider.family.autoDispose<List<String>, int>(
  (ref, filmId) => ref.read(filmRepositoryProvider).getQualities(filmId),
);
