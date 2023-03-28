import 'dart:ui';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import 'config/app_theme.dart';
import 'config/constants.dart';
import 'features/details/ui/details_view.dart';
import 'features/home/presentation/home_view.dart';
import 'features/player/video_player_view.dart';

void setup() async {
  GetIt.I.registerLazySingleton<Dio>(
    () => Dio(BaseOptions(baseUrl: Consts.baseUrl)),
  );

  await GetIt.I.allReady();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  setup();
  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        themeMode: ThemeMode.dark,
        theme: AppTheme.dark,
        darkTheme: AppTheme.dark,
        routes: <String, WidgetBuilder>{
          '/decsription': (BuildContext context) => const DetailsView(),
          '/player': (_) => const LandscapePlayerPage(),
        },
        home: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF232E42),
        selectedItemColor: const Color(0xFFB3A976),
        onTap: (value) => value != 0
            ? showOkAlertDialog(
                context: context,
                title: 'Демо приложение',
                message: 'Этот функционал не поддерживается.',
              )
            : null,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'ТВ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_drama),
            label: 'Фильмы',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_add),
            label: 'Сериалы',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_search),
            label: 'Еще',
          ),
        ],
      ),
      body: const MainPage(),
    );
  }
}
