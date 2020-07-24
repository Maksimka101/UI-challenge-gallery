import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'book_info_screen.dart';
import 'book_widgets.dart';
import 'data.dart';

class MainStoreScreen extends StatelessWidget {
  final List<Book> favorite;
  final List<Book> popular;
  final List<Book> reading;
  // final _padding = const EdgeInsets.symmetric(horizontal: 25, vertical: 15);
  final _padding = const EdgeInsets.only(left: 15, right: 10, top: 0, bottom: 0);

  MainStoreScreen({
    Key key,
    @required this.favorite,
    @required this.popular,
    @required this.reading,
  }) : super(key: key);

  void _bookTapped(Book book, BuildContext context) => Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (_) => Theme(
            data: Theme.of(context),
            child: BookInfoScreen(
              book: book,
            ),
          ),
        ),
      );

  Widget _buildPopular(MediaQueryData mediaQuery) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: _padding.left),
                ...popular
                    .map<Widget>(
                      (book) => Padding(
                        padding: EdgeInsets.only(right: _padding.right),
                        child: PopularBook(
                          book: book,
                          onTap: _bookTapped,
                        ),
                      ),
                    )
                    .toList()
              ],
            ),
          ),
        ],
      );

  Widget _buildFavorites() => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: _padding.left),
            ...favorite
                .map<Widget>(
                  (book) => Padding(
                    padding: EdgeInsets.only(right: 4),
                    child: FavoriteBookCart(
                      onTap: _bookTapped,
                      book: book,
                    ),
                  ),
                )
                .toList()
          ],
        ),
      );

  Widget _buildReading() => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: _padding.left),
            ...reading
                .map<Widget>(
                  (book) => Flexible(
                    child: ReadingBook(
                      onTap: _bookTapped,
                      book: book,
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        right: false,
        left: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            SizedBox(height: 5),
            StoreAppBar(
              padding: _padding,
            ),
            Spacer(flex: 3),
            ShelfTitle(
              padding: _padding,
              title: 'Popular',
            ),
            Spacer(),
            _buildPopular(mediaQuery),
            Spacer(flex: 3),
            ShelfTitle(
              padding: _padding,
              title: 'Favorite',
            ),
            Spacer(),
            _buildFavorites(),
            Spacer(flex: 3),
            ShelfTitle(
              padding: _padding,
              title: 'Reading',
            ),
            Spacer(),
            _buildReading(),
            SizedBox(height: 5),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
