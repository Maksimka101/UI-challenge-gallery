import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ui_challenge_gallery/bank_card_info.dart/data.dart';

class CardsPreview extends StatelessWidget {
  final int currentPage;
  final List<BankCard> cards;
  final Function(int page) onPageChanged;
  final _controller = PageController(viewportFraction: 0.9);
  CardsPreview({
    Key key,
    @required this.cards,
    @required this.currentPage,
    @required this.onPageChanged,
  }) : super(key: key);

  Widget _addCardWidget() => AspectRatio(
        aspectRatio: 1.75,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.indigoAccent,
              boxShadow: [
                BoxShadow(
                  color: Colors.indigo[200],
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ]),
          child: InkWell(
            onTap: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  size: 40,
                  color: Colors.white,
                ),
                Text(
                  'Add new card',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AspectRatio(
          aspectRatio: 1.8,
          child: PageView(
            controller: _controller,
            onPageChanged: onPageChanged,
            children: [
              ...cards
                  .map<Widget>(
                    (card) => Padding(
                      padding: const EdgeInsets.all(10),
                      child: BankCardWidget(
                        card: card,
                      ),
                    ),
                  )
                  .toList(),
              Padding(
                padding: EdgeInsets.all(10),
                child: _addCardWidget(),
              ),
            ],
          ),
        ),
        PageViewIndicator(
          currentPage: currentPage,
          pageCount: cards.length + 1,
        ),
      ],
    );
  }
}

class PageViewIndicator extends StatelessWidget {
  final int currentPage;
  final int pageCount;

  const PageViewIndicator({
    Key key,
    @required this.currentPage,
    @required this.pageCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: Iterable.generate(pageCount)
          .map<Widget>(
            (index) => Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.6,
                    color: Colors.black,
                  ),
                  color: index == currentPage ? theme.accentColor : theme.canvasColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 10,
                width: 10,
              ),
            ),
          )
          .toList(),
    );
  }
}

class BankCardWidget extends StatefulWidget {
  final BankCard card;

  const BankCardWidget({Key key, @required this.card}) : super(key: key);

  @override
  _BankCardWidgetState createState() => _BankCardWidgetState();
}

class _BankCardWidgetState extends State<BankCardWidget> {
  var _showFullInfo = false;

  Widget _buildCardNumber() {
    final cn = widget.card.cardNumber.toString();
    if (!_showFullInfo) {
      return Row(
        children: [
          Text('****'),
          SizedBox(width: 5),
          Text('****'),
          SizedBox(width: 5),
          Text('****'),
          SizedBox(width: 5),
          Text(cn.substring(12)),
        ],
      );
    } else {
      return Row(
        children: [
          Text(cn.substring(0, 4)),
          SizedBox(width: 5),
          Text(cn.substring(4, 8)),
          SizedBox(width: 5),
          Text(cn.substring(8, 12)),
          SizedBox(width: 5),
          Text(cn.substring(12)),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTextStyle(
      style: TextStyle(
        color: Colors.white,
        fontSize: 14,
        shadows: [
          Shadow(
            color: Colors.black45,
            blurRadius: 2,
          )
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: CachedNetworkImageProvider(widget.card.backgroundImageUrl),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.indigo[200],
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.45),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          !_showFullInfo ? Icons.enhanced_encryption : Icons.no_encryption,
                          color: Colors.white,
                        ),
                        onPressed: () => setState(() => _showFullInfo = !_showFullInfo),
                      ),
                      Spacer(),
                      CachedNetworkImage(
                        imageUrl: 'https://i.ibb.co/rwcSRLp/output-onlinepngtools-2.png',
                        width: size.width / 10,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: DefaultTextStyle(
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      child: _buildCardNumber()),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                'Card holder'.toUpperCase(),
                                style: TextStyle(color: Colors.white.withOpacity(0.8)),
                              ),
                            ),
                            SizedBox(height: 2),
                            Flexible(
                              child: Text(widget.card.holderName.toUpperCase(),
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                'Expiries'.toUpperCase(),
                                style: TextStyle(color: Colors.white.withOpacity(0.8)),
                              ),
                            ),
                            SizedBox(height: 2),
                            Flexible(
                              child: RichText(
                                text: TextSpan(
                                  text: '${widget.card.expiresDate.year ~/ 100}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  children: [
                                    TextSpan(text: '/', style: TextStyle(color: Colors.white38)),
                                    TextSpan(
                                        text:
                                            "${widget.card.expiresDate.month < 10 ? '0${widget.card.expiresDate.month}' : widget.card.expiresDate.month}",
                                        style: TextStyle(fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              'CVV'.toUpperCase(),
                              style: TextStyle(color: Colors.white.withOpacity(0.8)),
                            ),
                          ),
                          SizedBox(height: 2),
                          Flexible(
                            child: Text(
                              !_showFullInfo ? '***' : widget.card.cvv.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
