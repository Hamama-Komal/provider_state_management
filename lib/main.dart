import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/cart_example/cart_provider.dart';
import 'package:provider_state/cart_example/cart_screen.dart';
import 'package:provider_state/cart_example/home_screen.dart';
import 'package:provider_state/favorite_example/favorite_provider.dart';
import 'package:provider_state/favorite_example/favorite_screen.dart';
import 'package:provider_state/seekbar_example/seekbar_provider.dart';
import 'package:provider_state/seekbar_example/seekbar_screen.dart';
import 'package:provider_state/stateless_as_statefull_widget/StatelessScreen.dart';
import 'package:provider_state/theme_example/theme_provider.dart';
import 'package:provider_state/theme_example/theme_screen.dart';
import 'package:provider_state/timer_example/timer_provider.dart';
import 'package:provider_state/timer_example/timer_screen.dart';

import 'login_example/login_provider.dart';
import 'login_example/login_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // print("Hello world");

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => SeekbarProvider()),
        ChangeNotifierProvider(create: (_) => TimerProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: Builder(builder: (BuildContext context){
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          title: 'Provider State Management',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: Brightness.light,
              appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.blue
              )),
          darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.orange,
              appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.orange
              )),
          /*theme: FlexThemeData.light(scheme: FlexScheme.indigoM3),
          darkTheme: FlexThemeData.dark(scheme: FlexScheme.indigoM3),*/
          themeMode: themeProvider.themeMode ,
          home: LoginScreen(),
          /* initialRoute: "/home",
        routes: {
          "/home": (context) => HomeScreen(),
          "/cart": (context) => CartScreen(),
        },*/
        );
      })
    );
  }
}


