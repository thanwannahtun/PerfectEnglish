import 'package:flutter/material.dart';

class PatternDetailScreen extends StatelessWidget {
  final Map<String, dynamic> pattern;

  const PatternDetailScreen({super.key, required this.pattern});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${pattern['title']} ${pattern['burmeseMeaning']}"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: MediaQuery.sizeOf(context).width * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "အသုံးပြုပုံ (Usage)",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(
                  context,
                ).colorScheme.onPrimaryContainer.withAlpha(25),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                pattern["usage"],
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(height: 40),
            Text(
              "နမူနာများ (Examples)",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 16),
            ...pattern["examples"].map((ex) => _buildExampleCard(ex, context)),
          ],
        ),
      ),
    );
  }

  Widget _buildExampleCard(Map<String, String> ex, BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.onPrimary,
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ex["english"] ?? "",
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 6),
            Text(
              ex["burmese"] ?? "",
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ],
        ),
      ),
    );
  }
}
