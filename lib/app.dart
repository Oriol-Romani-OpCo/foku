import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/theme.dart';
import 'screens/home_screen.dart';
import 'screens/daily_planner_screen.dart';
import 'screens/stats_screen.dart';
import 'screens/settings_screen.dart';

class TDAHCompanionApp extends StatelessWidget {
  const TDAHCompanionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TDAH Companion',
      theme: AppTheme.lightTheme,
      supportedLocales: const [
        Locale('ca'),
        Locale('es'),
        Locale('en'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      initialRoute: '/',
      routes: {
        '/': (_) => const HomeScreen(),
        '/planner': (_) => const DailyPlannerScreen(),
        '/stats': (_) => const StatsScreen(),
        '/settings': (_) => const SettingsScreen(),
      },
    );
  }
}
