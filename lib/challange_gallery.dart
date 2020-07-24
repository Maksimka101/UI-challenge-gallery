import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_challenge_gallery/bank_card_info.dart/bank_card_info.dart';

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
          subtitle: Text('Two screens with middle interactions'),
          onTap: () => _openChallenge(context, BooksStore()),
        ),
        Divider(),
        ListTile(
          title: Text('Bank card info'),
          subtitle: Text('Two screens with low interactions'),
          onTap: () => _openChallenge(context, BankCardInfo()),
        ),
        Divider(),
      ],
    );
  }
}
