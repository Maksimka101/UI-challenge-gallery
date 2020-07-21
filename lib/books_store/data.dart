import 'package:flutter/foundation.dart';
const _comments = <Comment>[
    Comment(
        name: 'Nil Armstrong',
        message:
            "In his customary pose as the grumpiest of grumpy old men, Raymond Briggs contemplates old age and death… and doesn’t like them much. Illustrated with Briggs’s inimitable pencil drawings, Time for Lights Out is a collection of short pieces, some funny, some melancholy, some remembering his wife who died young, others about the joy of grandchildren, of walking the dog… He looks back at his schooldays and his time as an evacuee during the war, and remembers his parents and the house in which he grew up.",
        imageUrl:
            'https://www.penguin.co.uk/content/dam/prh/contributors/171/17111/contributor.jpg'),
  ];
  const _tags = ['Popular', 'Must read', 'Great author', 'My choose'];
  final popular = <Book>[
    Book(
      imageUrl:
          'https://www.penguin.co.uk/content/dam/prh/books/751/75189/9780141364278.jpg.transform/PRHDesktopWide_small/image.jpg',
      title: 'The Snowman',
      author: 'Raymond Briggs',
      description:
          "Christmas wouldn’t be complete without a few sniffles over a very special pile of snow... you'll see the animated version on TV no doubt, but nothing beats the original picture book about the young boy and his intrepid night-time adventure with a certain friendly Snowman. This special 40th anniversary edition from 2018 includes a limited edition print and a letter from Raymond Briggs, as well as the beautiful illustrations. Perfect for fans new and old.",
      comments: _comments,
      tags: _tags,
      stars: 4,
    ),
    Book(
      imageUrl:
          'https://www.penguin.co.uk/content/dam/prh/books/312/312573/9780241378694.jpg.transform/PRHDesktopWide_small/image.jpg',
      title: 'Matilda at 30: Chief Executive of the British Library',
      author: "Roald Dahl",
      description:
          "The original, magical story with a brand new cover from Quentin Blake! October 2018 marked 30 years since Matilda was published! This brand new jacket comes with a never-before-seen illustration of Matilda as the Chief Executive of the British Library- one of the careers that Quentin Blake himself has imagined that Matilda might have at 30 years old.",
      comments: _comments,
      tags: _tags,
      stars: 4,
    ),
    Book(
      imageUrl:
          'https://www.penguin.co.uk/content/dam/prh/books/111/1116980/9780753553190.jpg.transform/PRHDesktopWide_small/image.jpg',
      description:
          """Unleash your inner artist and learn to draw with ‘queen of colouring’ Johanna Basford.
In this beautiful, accessible guide Johanna shares the fun, simple, no-skills-needed secrets to creating your own flora, fauna and fantasies inspired by her bestselling and beloved colouring books.
With step-by-step exercises, inspiring prompts and plenty of pages to colour, let your creativity run wild. How to Draw Inky Wonderlands invites you to develop your personal drawing style and master creating marvellous creatures and landscapes using only the pen or pencil in your hand and the wildest reaches of your imagination.""",
      author: 'Johanna Basford',
      title: 'How to Draw Inky Wonderlands',
      comments: _comments,
      tags: _tags,
      stars: 4,
    ),
  ];
  const favorite = <Book>[
    Book(
      imageUrl:
          'https://www.penguin.co.uk/content/dam/prh/books/309/309423/9780241355510.jpg.transform/PRHDesktopWide_small/image.jpg',
      title: 'Game of Thrones: A Guide to Westeros and Beyond',
      author: 'Myles McNutt',
      description:
          'Feeling lost without Game of Thrones? Relive all 8 series with the ONLY official tie-in guide to the biggest TV series in the world. Delve deeper into Westeros than ever before. . .Covering all eight seasons of the hit HBO show, this remarkable volume offers a unique and exciting visual exploration into the incredible world of Game of Thrones. In two parts, the book follows the story of the South, where kings and queens battle for the Iron Throne, and of the North...',
      comments: _comments,
      tags: _tags,
      stars: 4,
    ),
    Book(
      imageUrl:
          'https://www.penguin.co.uk/content/dam/prh/books/111/1117145/9781787631151.jpg.transform/PRHDesktopWide_small/image.jpg',
      title: 'Harry Potter: A Pop-Up Guide to Hogwarts',
      author: 'Matthew Reinhart',
      description:
          "A 3D masterpiece celebrating Harry Potter's Hogwarts School of Witchcraft and Wizardry from New York Times best-selling pop-up engineer Matthew Reinhart. Harry Potter: A Pop-Up Guide to Hogwarts is an exhilarating, interactive guide to the iconic school of witchcraft and wizardry. This book features spectacular pop-up re-creations of key locations inside and outside Hogwarts castle, and it opens flat to form a pop-up map of the castle and its grounds - including the Quidditch pitch, the Forbidden Forest, and beyond. In addition to large pops on each spread, numerous mini-pops will bring to life beloved elements from the Harry Potter films, such as the Marauder's Map and the Flying Ford Anglia. Each pop will include insightful text about Hogwarts as seen in the films, making for a must-have collectible for fans of the Wizarding World.",
      comments: _comments,
      stars: 2,
      tags: _tags,
    ),
  ];
  const reading = <Book>[
    Book(
      imageUrl:
          'https://www.penguin.co.uk/content/dam/prh/books/111/1115478/9781780899602.jpg.transform/PRHDesktopWide_small/image.jpg',
      title: 'Stranger Things: Worlds Turned Upside Down',
      author: 'Ross Duffer',
      description: """THE NEW YORK TIMES BESTSELLER
Welcome to Hawkins, Indiana.
The official behind-the-scenes companion guide to the first two seasons of Stranger Things and beyond, brought to life with exclusive photos and stunning concept art.
Stranger things have happened. . . . 
When the first season of Stranger Things debuted on Netflix in the summer of 2016, the show struck a nerve with millions of""",
      comments: _comments,
      tags: _tags,
      stars: 4,
    ),
    Book(
      imageUrl:
          'https://www.penguin.co.uk/content/dam/prh/books/312/312971/9780241387566.jpg.transform/PRHDesktopWide_small/image.jpg',
      description: """THE SUNDAY TIMES BESTSELLER AND BOOK OF THE YEAR
'Enticing, inviting and delicious. Vegan and vegetarian dishes that are hard to resist (and why should you?' YOTAM OTTOLENGHI
________________________________
Modern, vibrant, easy-to-make food. East is a must-have whether you're vegan, vegetarian, or simply want to eat more delicious meat-free food.
Drawing from her 'New Vegan' Guardian column, Meera Sodha's collection features brand-new recipes inspired by """,
      title: 'East',
      author: 'Meera Sodha',
      comments: _comments,
      tags: _tags,
      stars: 4,
    ),
  ];

class Book {
  final String description;
  final String imageUrl;
  final String title;
  final String author;
  final int stars;
  final List<String> tags;
  final List<Comment> comments;

  const Book({
    @required this.stars,
    this.tags,
    this.description,
    this.imageUrl,
    this.title,
    this.author,
    this.comments,
  });
}

class Comment {
  final String imageUrl;
  final String message;
  final String name;

  const Comment({this.imageUrl, this.message, this.name});
}
