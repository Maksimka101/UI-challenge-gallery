import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'book_widgets.dart';
import 'data.dart';

class BookInfoScreen extends StatelessWidget {
  final Book book;

  const BookInfoScreen({Key key, @required this.book}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final padding = EdgeInsets.only(left: 15, right: 10);
    return Scaffold(
      body: SafeArea(
        left: false,
        right: false,
        child: Padding(
          padding: padding,
          child: ListView(
            children: [
              SizedBox(height: 15),
              BookInfoAppBar(),
              SizedBox(height: 15),
              BookInfoHeader(book: book),
              SizedBox(height: 10),
              Divider(height: 40),
              BookDescription(book: book),
              Comments(comments: book.comments),
            ],
          ),
        ),
      ),
    );
  }
}

class BookInfoAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BackButton(),
        Spacer(),
        InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Theme.of(context).buttonColor,
            ),
            child: Text(
              'Buy Book',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(width: 7),
      ],
    );
  }
}

class BookInfoHeader extends StatelessWidget {
  final Book book;

  const BookInfoHeader({Key key, @required this.book}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BookImage(
          imageUrl: book.imageUrl,
          width: MediaQuery.of(context).size.width / 3.3,
        ),
        SizedBox(width: 10),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                  child: BookTitle(
                book.title,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.4,
                ),
              )),
              SizedBox(height: 10),
              BookAuthor(
                book.author,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              BookStars(
                stars: book.stars,
                starSize: 20,
              ),
              SizedBox(height: 10),
              Wrap(
                  children: book.tags
                      .map<Widget>(
                        (text) => Padding(
                          padding: const EdgeInsets.only(right: 6, top: 6),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                                color: Colors.grey[200], borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              text,
                              style: Theme.of(context).textTheme.caption.merge(TextStyle(
                                    fontWeight: FontWeight.w700,
                                  )),
                            ),
                          ),
                        ),
                      )
                      .toList()),
            ],
          ),
        ),
      ],
    );
  }
}

class BookDescription extends StatelessWidget {
  final Book book;

  const BookDescription({Key key, this.book}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(height: 10),
        Text(
          book.description,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.caption.merge(
                TextStyle(
                  fontSize: 14,
                  height: 1.8,
                  letterSpacing: -0.4,
                  fontWeight: FontWeight.w600,
                ),
              ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'See More',
            style: TextStyle(color: Theme.of(context).accentColor),
          ),
        ),
      ],
    );
  }
}

class Comments extends StatelessWidget {
  final List<Comment> comments;

  const Comments({Key key, @required this.comments}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ShelfTitle(
          padding: EdgeInsets.symmetric(vertical: 3),
          title: 'Comments (${comments.length})',
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(comments.first.imageUrl),
            radius: 25,
          ),
          title: Text(comments.first.name),
          subtitle: Text(comments.first.message),
        ),
      ],
    );
  }
}
