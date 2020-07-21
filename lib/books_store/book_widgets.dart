import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final Offset offset;
  final double blurRadius;

  const CustomCard({
    Key key,
    @required this.child,
    this.offset,
    this.blurRadius,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: blurRadius ?? 4,
            offset: offset ?? Offset(0, 3),
          ),
        ],
        color: Theme.of(context).canvasColor,
      ),
      child: child,
    );
  }
}

class ShelfTitle extends StatelessWidget {
  final String title;
  final String buttonText;
  final EdgeInsets padding;

  const ShelfTitle(
      {Key key, @required this.title, this.buttonText = 'View all', @required this.padding})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Spacer(),
          TextButton(
            onPressed: () {},
            child: Text(
              buttonText,
              style: TextStyle(color: Theme.of(context).accentColor),
            ),
          ),
        ],
      ),
    );
  }
}

class BookAuthor extends StatelessWidget {
  final String text;
  final TextStyle style;
  BookAuthor(this.text, {this.style});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey).merge(style),
    );
  }
}

class BookTitle extends StatelessWidget {
  final String text;
  final int maxLines;
  final TextStyle style;

  const BookTitle(this.text, {this.maxLines = 1, this.style}) : super();
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ).merge(style),
    );
  }
}

class StoreAppBar extends StatelessWidget {
  final EdgeInsets padding;

  const StoreAppBar({Key key, @required this.padding}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: padding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
              child: CustomCard(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  icon: Icon(Icons.search),
                ),
              ),
            ),
          )),
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                icon: Icon(
                  CupertinoIcons.bell,
                  size: 30,
                ),
                onPressed: () {},
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: theme.accentColor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class PopularBook extends StatelessWidget {
  final Book book;
  final void Function(Book book, BuildContext context) onTap;

  const PopularBook({Key key, @required this.book, @required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var imageHeight = mediaQuery.size.height / 4.1;
    return InkWell(
      onTap: () => onTap(book, context),
      child: IntrinsicWidth(
        child: SizedBox(
          width: imageHeight / sqrt(2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              BookImage(
                imageUrl: book.imageUrl,
                height: imageHeight,
              ),
              SizedBox(height: 4),
              BookTitle(book.title),
              SizedBox(height: 2),
              BookAuthor(book.author),
              SizedBox(height: 1),
            ],
          ),
        ),
      ),
    );
  }
}

class BookImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;

  BookImage({Key key, this.imageUrl, this.height, this.width}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: SizedBox(
        width: width,
        height: height,
        child: AspectRatio(
          aspectRatio: 1 / sqrt(2),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            height: height,
          ),
        ),
      ),
    );
  }
}

class BookStars extends StatelessWidget {
  final int stars;
  final double starSize;

  const BookStars({Key key, @required this.stars, this.starSize}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < stars; i++)
          Icon(
            Icons.star,
            color: Colors.yellow,
            size: starSize,
          ),
        for (int i = 0; i < 5 - stars; i++)
          Icon(
            Icons.star,
            color: Colors.black26,
            size: starSize,
          ),
      ],
    );
  }
}

class ReadingBook extends StatelessWidget {
  final Book book;
  final void Function(Book book, BuildContext context) onTap;

  const ReadingBook({Key key, @required this.book, @required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: () => onTap(book, context),
        child: BookImage(
          imageUrl: book.imageUrl,
          height: MediaQuery.of(context).size.height / 5,
        ),
      ),
    );
  }
}

class FavoriteBookCart extends StatelessWidget {
  final Book book;
  final void Function(Book book, BuildContext context) onTap;

  FavoriteBookCart({Key key, this.book, @required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _query = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 5,
        top: 3,
        right: 7,
      ),
      child: CustomCard(
        blurRadius: 4,
        offset: Offset(0, 2),
        child: SizedBox(
          width: _query.size.width / 1.5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () => onTap(book, context),
              child: Row(
                children: [
                  BookImage(
                    height: _query.size.height / 8,
                    imageUrl: book.imageUrl,
                  ),
                  SizedBox(width: 14),
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BookTitle(
                          book.title,
                          maxLines: 2,
                        ),
                        SizedBox(height: 3),
                        BookAuthor(book.author),
                        SizedBox(height: 5),
                        BookStars(
                          stars: book.stars,
                          starSize: 18,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
