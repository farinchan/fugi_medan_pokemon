import 'package:flutter/material.dart';
import 'package:fugi_gathering2/home_page.dart';
import 'package:fugi_gathering2/provider/pokemon.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Pokemon()..list(),
        ),
      ],
      child: MaterialApp(
        home: HomePage(),
        theme: ThemeData(primarySwatch: Colors.red),
      ),
    );
  }
}
