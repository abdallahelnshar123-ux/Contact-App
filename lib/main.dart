import 'package:contact_app/home_screen/home_screen.dart';
import 'package:contact_app/utils/app_routes.dart';
import 'package:contact_app/utils/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeRouteName,
      routes: {
        AppRoutes.homeRouteName: (context) => HomeScreen(),

      },
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
    );
  }
}
