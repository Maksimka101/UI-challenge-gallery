import 'package:flutter/material.dart';
import 'package:ui_challenge_gallery/utils/ui_utils.dart';

class TransactionsFilter extends StatelessWidget {
  final void Function(TransactionType) onFilter;
  final TransactionType currentFilter;

  const TransactionsFilter({
    Key key,
    @required this.onFilter,
    @required this.currentFilter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultTextTheme = DefaultTextStyle.of(context);
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: DefaultTextStyle(
        style: theme.textTheme.caption.copyWith(fontSize: 14),
        child: Wrap(
          spacing: 1,
          children: [
            _FilterItem(
              selected: TransactionType.all == currentFilter,
              onTap: () => onFilter(TransactionType.all),
              children: [Text('All')],
            ),
            _FilterItem(
              selected: TransactionType.income == currentFilter,
              onTap: () => onFilter(TransactionType.income),
              children: [
                CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: defaultTextTheme.style.fontSize / 2,
                  child: Icon(
                    Icons.arrow_downward,
                    color: theme.cardColor,
                    size: defaultTextTheme.style.fontSize,
                  ),
                ),
                SizedBox(width: 5),
                Text('Income'),
              ],
            ),
            _FilterItem(
              selected: TransactionType.expense == currentFilter,
              onTap: () => onFilter(TransactionType.expense),
              children: [
                CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: defaultTextTheme.style.fontSize / 2,
                  child: Icon(
                    Icons.arrow_upward,
                    color: theme.cardColor,
                    size: defaultTextTheme.style.fontSize,
                  ),
                ),
                SizedBox(width: 5),
                Text('Expense'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterItem extends StatelessWidget {
  final List<Widget> children;
  final void Function() onTap;
  final bool selected;

  const _FilterItem({
    Key key,
    @required this.children,
    @required this.onTap,
    @required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final padding = EdgeInsets.symmetric(horizontal: 20, vertical: 7);
    final defaultTextStyle = DefaultTextStyle.of(context);
    return CustomCard(
      padding: padding,
      borderRadius: 20,
      cardColor: selected ? Theme.of(context).accentColor : null,
      child: InkWell(
        onTap: onTap,
        child: DefaultTextStyle(
          style: TextStyle(color: selected ? Colors.white : defaultTextStyle.style.color),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: children,
          ),
        ),
      ),
    );
  }
}

enum TransactionType {
  all,
  income,
  expense,
}
