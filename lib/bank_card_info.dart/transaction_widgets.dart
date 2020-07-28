import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_challenge_gallery/bank_card_info.dart/data.dart';
import 'package:ui_challenge_gallery/utils/ui_utils.dart';

class AllTransactions extends StatelessWidget {
  final List<Transaction> transactions;

  const AllTransactions({Key key, @required this.transactions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Transaction> transactionForPreview;
    if (transactions.length > 10) {
      transactionForPreview = transactions.sublist(0, 10);
    } else {
      transactionForPreview = transactions;
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: transactionForPreview
          .map<Widget>(
            (transaction) => Padding(
              padding: const EdgeInsets.only(bottom: 13),
              child: TransactionInfoCard(
                transaction: transaction,
              ),
            ),
          )
          .toList(),
    );
  }
}

class TransactionInfoCard extends StatelessWidget {
  final Transaction transaction;

  const TransactionInfoCard({Key key, @required this.transaction}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomCard(
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: AspectRatio(
            aspectRatio: 1,
            child: CachedNetworkImage(
              imageUrl: transaction.logoUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          transaction.name,
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(transaction.type),
        trailing: Column(
          children: [
            Spacer(flex: 2),
            Text(
              '${transaction.increase ? '+' : '-'} \$${transaction.sum}',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                letterSpacing: -0.5,
                color: transaction.increase ? Colors.green : Colors.red,
              ),
            ),
            Spacer(),
            Text(
              TimeOfDay.fromDateTime(transaction.time).format(context),
              style: theme.textTheme.caption.copyWith(fontSize: 14),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
