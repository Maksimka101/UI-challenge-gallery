import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_challenge_gallery/bank_card_info.dart/data.dart';
import 'package:ui_challenge_gallery/bank_card_info.dart/transaction_widgets.dart';

import 'all_transactions_screen.dart';
import 'card_widgets.dart';

class CardsTransactions extends StatelessWidget {
  final List<BankCard> cards;

  const CardsTransactions({
    Key key,
    @required this.cards,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _CardsTransactionsBody(
          cards: cards,
        ),
      ),
    );
  }
}

class _CardsTransactionsBody extends StatefulWidget {
  final List<BankCard> cards;

  const _CardsTransactionsBody({Key key, @required this.cards}) : super(key: key);
  @override
  __CardsTransactionsBodyState createState() => __CardsTransactionsBodyState();
}

class __CardsTransactionsBodyState extends State<_CardsTransactionsBody> {
  int _currentPage = 0;

  void _viewAllTapped(BuildContext context) {
    var page = _currentPage;
    if (page == widget.cards.length) {
      page--;
    }

    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (_) => Theme(
          data: Theme.of(context),
          child: AllTransactionsScreen(
            transactions: widget.cards[page].transactions,
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionsTitle() => Column(
        children: [
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                'Transactions',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Spacer(),
              TextButton(
                onPressed: () => _viewAllTapped(context),
                child: Text(
                  'See All',
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
        ],
      );

  @override
  Widget build(BuildContext context) {
    final cardForTransactions =
        widget.cards[_currentPage < widget.cards.length ? _currentPage : _currentPage - 1];
    return Column(
      children: [
        CardsPreview(
          cards: widget.cards,
          currentPage: _currentPage,
          onPageChanged: (newPage) => setState(() => _currentPage = newPage),
        ),
        FractionallySizedBox(
          widthFactor: 0.91,
          child: _buildTransactionsTitle(),
        ),
        Flexible(
          child: FractionallySizedBox(
            widthFactor: 0.9,
            child: PageTransitionSwitcher(
              transitionBuilder: (widget, animation, secondaryAnimation) {
                return FadeThroughTransition(
                  child: widget,
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                );
              },
              child: SingleChildScrollView(
                key: Key(cardForTransactions.cardNumber.toString()),
                child: AllTransactions(
                  transactions: cardForTransactions.transactions,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
