import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'books_store/books_store.dart';

class ChallengeGallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Challenge gallery'),
      ),
      body: _ChallengeGalleryBody(),
    );
  }
}

class _ChallengeGalleryBody extends StatelessWidget {
  void _openChallenge(BuildContext context, Widget screen) =>
      Navigator.push(context, CupertinoPageRoute(builder: (_) => screen));
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('Books store'),
          onTap: () => _openChallenge(context, BooksStore()),
        )
      ],
    );
  }
}
