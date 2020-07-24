import 'package:flutter/material.dart';

import 'card_transactions.dart';
import 'data.dart';

class BankCardInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        accentColor: Colors.indigo,
      ),
      child: CardsTransactions(
        cards: cards,
      ),
    );
  }
}