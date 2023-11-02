import 'package:flutter/material.dart';

class QuranItem extends StatelessWidget {
  const QuranItem(
      {super.key, required this.suraName, required this.suraNumber});

  final String suraName;
  final String suraNumber;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: Text(
            suraNumber,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge,
          ),
        ),
        Container(
          width: 1.2,
          height: 45,
          color: theme.colorScheme.onPrimary,
        ),
        Expanded(
          child: Text(
            suraName,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
