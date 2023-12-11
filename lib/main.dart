import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes/constant/routes.dart';
import 'package:quotes/provider/quote_provider.dart';
import 'package:quotes/provider/theme_provider.dart';
import 'package:quotes/screens/edit_screen.dart';
import 'package:quotes/screens/home_screen.dart';
import 'package:quotes/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ThemeProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => QuoteProvider(),
          ),
        ],
        child: Consumer<ThemeProvider>(
          builder: (context, value, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Quotes',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: value.themeMode,
            initialRoute: splashScreen,
            routes: {
              splashScreen: (context) => const SplashScreen(),
              homeScreen: (context) => const HomeScreen(),
              editScreen: (context) => const EditScreen(),
            },
          ),
        ));
  }
}
