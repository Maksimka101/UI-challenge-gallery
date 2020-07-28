import 'package:flutter/material.dart';
import 'package:ui_challenge_gallery/bank_card_info.dart/data.dart';
import 'package:ui_challenge_gallery/bank_card_info.dart/transaction_widgets.dart';
import 'package:ui_challenge_gallery/utils/ui_utils.dart';
import 'package:ui_challenge_gallery/utils/extensions.dart';

import 'transactions_filter.dart';

class AllTransactionsScreen extends StatefulWidget {
  final List<Transaction> transactions;

  const AllTransactionsScreen({Key key, @required this.transactions}) : super(key: key);

  @override
  _AllTransactionsScreenState createState() => _AllTransactionsScreenState();
}

class _AllTransactionsScreenState extends State<AllTransactionsScreen> {
  var _transactionType = TransactionType.all;
  void _onFilter(TransactionType newFilter) => setState(() => _transactionType = newFilter);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 10),
          _Appbar(),
          SizedBox(height: 15),
          TransactionsFilter(
            currentFilter: _transactionType,
            onFilter: _onFilter,
          ),
          Flexible(
            child: SortedTransactions(
              transactions: allTransactions,
              filter: _transactionType,
            ),
          )
        ],
      ),
    );
  }
}

class _Appbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        BackButton(color: theme.disabledColor),
        Spacer(),
        Text(
          'Transactions',
          style: theme.textTheme.headline6,
        ),
        Spacer(),
        IconButton(
          icon: Icon(
            Icons.more_vert,
            color: theme.disabledColor,
          ),
          onPressed: () => onNoFeature(context),
        )
      ],
    );
  }
}

class SortedTransactions extends StatelessWidget {
  final List<Transaction> transactions;
  final _today = DateTime(2020, 1, 2);
  final TransactionType filter;

  SortedTransactions({
    Key key,
    @required this.transactions,
    @required this.filter,
  }) : super(key: key);

  List<MapEntry<DateTime, List<Transaction>>> _prepare() {
    if (transactions.isEmpty) {
      return [];
    }
    final data = <MapEntry<DateTime, List<Transaction>>>[];

    for (int i = 0; i < transactions.length - 1; i++) {
      if (filter == TransactionType.income && !transactions[i].increase) {
        continue;
      }
      if (filter == TransactionType.expense && transactions[i].increase) {
        continue;
      }

      if (data.isNotEmpty && data.last.key.isSameDayAs(transactions[i].time)) {
        data.last.value.add(transactions[i]);
      } else {
        data.add(MapEntry(transactions[i].time, [transactions[i]]));
      }
    }

    return data;
  }

  Widget _buildDayTitle(DateTime day, ThemeData theme) {
    String title;
    if (day.isSameDayAs(_today)) {
      title = 'Today';
    } else if (day.isSameDayAs(_today.subtract(Duration(days: 1)))) {
      title = 'Yestarday';
    } else {
      title = TimeOfDay.fromDateTime(day).toString();
    }
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10, left: 3),
      child: Text(
        title,
        style: theme.textTheme.caption.copyWith(fontSize: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: _prepare()
              .map(
                (pair) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildDayTitle(pair.key, Theme.of(context)),
                    AllTransactions(
                      transactions: pair.value,
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
