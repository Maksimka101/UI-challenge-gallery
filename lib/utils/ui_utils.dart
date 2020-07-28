import 'package:flutter/material.dart';

void onNoFeature(BuildContext context) => Scaffold.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 1),
        content: Text("Feature doesn't exist"),
      ),
    );

class CustomCard extends StatelessWidget {
  final Widget child;
  final double blurRadius;
  final Offset offset;
  final Color shadowColor;
  final double borderRadius;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Color cardColor;

  const CustomCard({
    Key key,
    this.padding = const EdgeInsets.all(0),
    this.margin = const EdgeInsets.symmetric(vertical: 2, horizontal: 1.5),
    this.blurRadius = 6,
    this.offset = const Offset(0, 3),
    this.shadowColor,
    this.cardColor,
    this.borderRadius = 10,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final _shadowColor = shadowColor ?? Colors.black.withOpacity(0.1);
    return Padding(
      padding: margin,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: cardColor ?? theme.cardColor,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color: _shadowColor,
              blurRadius: blurRadius,
              offset: offset,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
