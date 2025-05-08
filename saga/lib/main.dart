import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saga/core/database.dart';
import 'package:saga/core/routes.dart';
import 'package:saga/theme/theme.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    useEffect(() {
      ref.read(databaseProvider).clearData();
      return null;
    }, []);

    return MaterialApp.router(
      title: 'Saga',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        scaffoldBackgroundColor: Prism.lightTheme.surface,
        dividerTheme: DividerThemeData(
          color: Prism.lightTheme.border.primary,
          thickness: 1,
          space: 1,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Prism.darkTheme.surface,
        dividerTheme: DividerThemeData(
          color: Prism.darkTheme.border.primary,
          thickness: 1,
          space: 1,
        ),
      ),
      routerConfig: router,
    );
  }
}
