import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_1/core/config/app_router.dart';
import 'package:rick_and_morty_1/core/service/service_locator.dart' as get_it;
import 'package:rick_and_morty_1/modules/main/presentation/provider/theme_provider.dart';

final di = GetIt.instance;
void main() {
  get_it.setup(di);
  final appRouter = AppRouter();

  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: MyApp(
      router: appRouter,
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.router});

  final AppRouter router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: context.watch<ThemeProvider>().currentThemeData,
      routerConfig: router.config(),
      
    );
  }
}


