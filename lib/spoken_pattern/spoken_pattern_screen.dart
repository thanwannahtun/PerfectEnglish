import 'package:flutter/material.dart';

import 'pattern_detail_screen.dart';
import 'spoken_pattern_data.dart';

class SpokenPatternsScreen extends StatelessWidget {
  const SpokenPatternsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('စကားပြောပုံစံများ (Spoken Patterns)')),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: MediaQuery.sizeOf(context).width * 0.05,
        ),
        itemCount: spokenPatterns.length,
        itemBuilder: (context, index) {
          final pattern = spokenPatterns[index];
          return Card(
            elevation: 0,
            color: Theme.of(context).colorScheme.onPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.grey.shade800),
            ),
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              title: Text(
                pattern.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text(pattern.burmeseMeaning),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PatternDetailScreen(
                    pattern: {
                      "title": pattern.title,
                      "burmeseMeaning": pattern.burmeseMeaning,
                      "usage": pattern.usage,
                      "examples": pattern.examples,
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
