import 'package:flutter/material.dart';
import 'package:perfect_english/grammer_section/passive_voice_detail_screen.dart';
import 'package:perfect_english/grammer_section/subject_verb_agreement_screen.dart';
import 'package:perfect_english/grammer_section/tenses_category_screen.dart';

import 'articles_detail_screen.dart';
import 'conditionals_screen.dart' show ConditionalsScreen;
import 'gerunds_vs_infinitives_screen.dart' show GerundsVsInfinitivesScreen;
import 'inversion_detail_screen.dart' show InversionDetailScreen;
import 'relative_clauses_screen.dart';
import 'reported_speech_screen.dart';

class GrammarHubScreen extends StatelessWidget {
  const GrammarHubScreen({super.key});

  final List<Map<String, dynamic>> grammarCategories = const [
    {
      'level': 'Basic (အခြေခံ)',
      'icon': Icons.child_care,
      'topics': [
        {
          'title': 'Tenses (ကာလများ)',
          'desc': 'Present, Past, Future basics',
          'detailScreen': TenseCategoryScreen(),
        },
        {
          'title': 'Articles (A, An, The)',
          'desc': 'How to use articles correctly',
          'detailScreen': ArticlesDetailScreen(),
        },
        {
          'title': 'Subject-Verb Agreement',
          'desc': 'Matching subjects with verbs',
          'detailScreen': SubjectVerbAgreementScreen(),
        },
      ],
    },
    {
      'level': 'Intermediate (အလယ်အလတ်)',
      'icon': Icons.trending_up,
      'topics': [
        {
          'title': 'Passive Voice',
          'desc': 'Changing focus from doer to receiver',
          'detailScreen': PassiveVoiceDetailScreen(),
        },
        {
          'title': 'Relative Clauses',
          'desc': 'Using who, which, that, whose',
          'detailScreen': RelativeClausesScreen(),
        },
        {
          'title': 'Conditionals (If Clauses)',
          'desc': 'Zero, First, and Second conditionals',
          'detailScreen': ConditionalsScreen(),
        },
      ],
    },
    {
      'level': 'Advanced (အဆင့်မြင့်)',
      'icon': Icons.school,
      'topics': [
        {
          'title': 'Direct & Indirect Speech',
          'desc': 'Reporting what others said',
          'detailScreen': ReportedSpeechScreen(),
        },
        {
          'title': 'Gerunds vs Infinitives',
          'desc': 'Using -ing vs to-verb',
          'detailScreen': GerundsVsInfinitivesScreen(),
        },
        {
          'title': 'Inversion',
          'desc': 'Formal emphasis in sentences',
          'detailScreen': InversionDetailScreen(),
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('English Grammar Hub')),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: MediaQuery.sizeOf(context).width * 0.05,
        ),
        itemCount: grammarCategories.length,
        itemBuilder: (context, index) {
          final category = grammarCategories[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      category['icon'] as IconData,
                      color: Colors.blueAccent,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      category['level'],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ...((category['topics'] as List).map(
                (topic) => Card(
                  elevation: 0.0,
                  color: Theme.of(context).colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.grey.shade800),
                  ),
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    title: Text(
                      topic['title'],
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(topic['desc']),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                    onTap: () {
                      if (topic["detailScreen"] == null) {
                        return;
                      }
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => topic["detailScreen"],
                        ),
                      );
                      // Navigate to specific grammar detail page
                    },
                  ),
                ),
              )),
              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}
