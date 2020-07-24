import 'package:flutter/material.dart';

import 'data.dart';
import 'store_screen.dart';

class BooksStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        buttonColor: Colors.indigo[400],
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        canvasColor: Colors.white,
        accentColor: Colors.indigo[400],
      ),
      child: DefaultTextStyle(
        style: TextStyle(letterSpacing: -0.4),
        child: MainStoreScreen(
          favorite: favorite,
          popular: popular,
          reading: reading,
        ),
      ),
    );
  }
}
