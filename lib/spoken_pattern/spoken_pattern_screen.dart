import 'package:flutter/material.dart';

import 'pattern_detail_screen.dart';
import 'spoken_pattern_data.dart';

class SpokenPatternsScreen extends StatelessWidget {
  const SpokenPatternsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('စကားပြောပုံစံများ (Spoken Patterns)'),
        elevation: 0,
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: MediaQuery.sizeOf(context).width * 0.05,
            ),
            sliver: SliverMainAxisGroup(
              slivers: spokenCategories.map((category) {
                return SliverMainAxisGroup(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.only(top: 24, bottom: 12),
                      sliver: SliverToBoxAdapter(
                        child: Text(
                          category.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final pattern = category.patterns[index];
                        return Card(
                          color: Theme.of(context).colorScheme.onPrimary,
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: const EdgeInsets.only(bottom: 12),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 4,
                            ),
                            title: Text(
                              pattern.title,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 6.0),
                              child: Text(
                                pattern.burmeseMeaning,
                                style: TextStyle(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ),
                            trailing: Icon(
                              Icons.chevron_right,
                              color: Theme.of(context).colorScheme.primary,
                            ),
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
                      }, childCount: category.patterns.length),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(bottom: 24)),
        ],
      ),
    );
  }
}
