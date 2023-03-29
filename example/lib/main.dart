import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import 'config/app_theme.dart';
import 'config/constants.dart';
import 'features/details/domain/film_details.dart';
import 'features/details/ui/details_view.dart';
import 'features/home/presentation/home_view.dart';
import 'features/navigation/presentation/navigation.dart';
import 'features/player/video_player_view.dart';

void setup() async {
  GetIt.I.registerLazySingleton<Dio>(
    () => Dio(BaseOptions(baseUrl: Consts.baseUrl)),
  );

  await GetIt.I.allReady();
}

void main() async {
  if (!kIsWeb) {
    DartPluginRegistrant.ensureInitialized();
  }
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(
    ProviderScope(
      child: Shortcuts(
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
        },
        child: MaterialApp(
          title: 'Flutter Demo',
          themeMode: ThemeMode.dark,
          theme: AppTheme.dark,
          darkTheme: AppTheme.dark,
          routes: <String, WidgetBuilder>{
            '/description': (BuildContext context) => const DetailsView(),
            '/player': (BuildContext context) => LandscapePlayerPage(
                ModalRoute.of(context)!.settings.arguments as FilmDetails,
            ),
          },
          home: const MyApp(),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdaptiveNavigation(
      body: MainPage(),
    );
  }
}
