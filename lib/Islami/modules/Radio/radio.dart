import 'package:flutter/material.dart';

class RadioView extends StatelessWidget {
  const RadioView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/radio.png"),
        const SizedBox(
          height: 50,
        ),
        Text("إذاعة القرآن الكريم", style: theme.textTheme.bodyMedium),
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.skip_previous_rounded,
              size: 40,
              color: theme.colorScheme.onPrimary,
            ),
            Icon(
              Icons.play_arrow,
              size: 70,
              color: theme.colorScheme.onPrimary,
            ),
            Icon(
              Icons.skip_next,
              size: 40,
              color: theme.colorScheme.onPrimary,
            ),
          ],
        ),
      ],
    );
  }
}
