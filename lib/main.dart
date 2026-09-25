import 'package:booking_home_app/get_started.dart';
import 'package:booking_home_app/providers/user_provider.dart';
import 'package:booking_home_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:logging/logging.dart';
import 'dart:developer' as developer;

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    developer.log(
      rec.message,
      time: rec.time,
      level: rec.level.value,
      name: rec.loggerName,
      error: rec.error,
      stackTrace: rec.stackTrace,
    );
  });
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _setupLogging();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const GetStarted(),
    );
  }
}
