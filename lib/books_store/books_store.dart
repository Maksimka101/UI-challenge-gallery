import 'package:flutter/material.dart';

import 'data.dart';
import 'store_screen.dart';

class BooksStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(letterSpacing: -0.4),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          buttonColor: Colors.indigo[400],
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          canvasColor: Colors.white,
          accentColor: Colors.indigo[400],
        ),
        home: MainStoreScreen(
          favorite: favorite,
          popular: popular,
          reading: reading,
        ),
      ),
    );
  }
}