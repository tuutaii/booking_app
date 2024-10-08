import 'package:booking_home_app/get_started.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xfffcd1a8),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xff2a2a2a),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff2a2a2a),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          elevation: 0,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            iconColor: WidgetStateProperty.all(Colors.white),
          ),
        ),
        fontFamily: 'Montserrat',
      ),
      home: const GetStarted(),
    );
  }
}
