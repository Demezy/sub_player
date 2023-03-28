import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import 'config/app_theme.dart';
import 'config/constants.dart';
import 'features/home_screen/presentation/home_screen.dart';

void setup() async {
  GetIt.I.registerLazySingleton<Dio>(
    () => Dio(BaseOptions(baseUrl: Consts.baseUrl)),
  );

  await GetIt.I.allReady();
}

void main() async {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        themeMode: ThemeMode.dark,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        home: const HomeScreen(),
        // home: const DetailsView(),
      ),
    );
  }
}
