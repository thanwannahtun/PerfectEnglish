import 'package:flutter/material.dart';

class NayaGroup extends StatelessWidget {
  const NayaGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: RichText(
        text: TextSpan(
          text: 'Powered by ',
          style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
          children: [
            TextSpan(
              text: 'NaYa Group',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
