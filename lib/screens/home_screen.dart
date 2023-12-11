import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes/provider/theme_provider.dart';
import 'package:quotes/widgets/quote_grid.dart';
import 'package:quotes/widgets/quote_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context,listen: false);
    Widget buildHomeScreen() {
    return Consumer<ThemeProvider>(builder: (context, value, child) => value.isList?const QuoteList():const QuoteGrid(),);
  }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quotes'),
        actions: [
          Consumer<ThemeProvider>(
            builder: (context, value, child) => IconButton(
                onPressed: ()=> value.changeView(), icon: Icon(value.isList?Icons.grid_view:Icons.menu)),
          ),
          Consumer<ThemeProvider>(
            builder: (context, value, child) => IconButton(
                onPressed: () {
                  value.changeTheme();
                },
                icon: Icon(value.themeMode==ThemeMode.dark?Icons.sunny:Icons.dark_mode_outlined)),
          )
        ],
      ),
      body: buildHomeScreen(),
    );
  }

  
}
