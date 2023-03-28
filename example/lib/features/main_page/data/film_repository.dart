import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../../details/domain/film_details.dart';

typedef Films = List<FilmDetails>;

class FilmRepository {
  FilmRepository();
  static const film = FilmDetails(
      filmTitle: 'test',
      filmDescription: 'test descr',
      filmRating: 3,
      filmIMBdRating: 4,
      filmKinopoiskRating: 5,
      filmLabels: ['adsdas'],
      filmTrailerLink: 'archlinux.com',
      filmPosterLink:
          'https://imgs.search.brave.com/jiVbQAvDraaUWUfLijdNpFjGuqZjPdV-SEZ30ORPB20/rs:fit:748:225:1/g:ce/aHR0cHM6Ly90c2U0/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5X/OGFwVEtBUlRxVmht/THpNQ2lzTm1BSGFF/cyZwaWQ9QXBp');

  final Dio dio = GetIt.I.get<Dio>();

  Future<Films> getBigBanner() async {
    return [
      film,
      film.copyWith(
          filmPosterLink:
              'https://imgs.search.brave.com/XQGY10TrZ0834ZCG_DbHvA9TbicprXW4Ut_3hmKe5Dw/rs:fit:759:225:1/g:ce/aHR0cHM6Ly90c2Ux/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5r/QlNHX2ZVelRLdXdC/eVlITVFvQTZBSGFF/byZwaWQ9QXBp')
    ];
  }

  Future<Films> getPopularNow() async {
    return 
      [
      film,
      film.copyWith(
          filmPosterLink:
              'https://imgs.search.brave.com/XQGY10TrZ0834ZCG_DbHvA9TbicprXW4Ut_3hmKe5Dw/rs:fit:759:225:1/g:ce/aHR0cHM6Ly90c2Ux/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5r/QlNHX2ZVelRLdXdC/eVlITVFvQTZBSGFF/byZwaWQ9QXBp')
    
    ];
  }

  Future<Films> getRecomended() async {
    return [];
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
  (ref) => ref.read(filmRepositoryProvider).getRecomended(),
);
