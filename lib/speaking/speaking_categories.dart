import 'package:flutter/material.dart';
import 'package:perfect_english/speaking/future_tense_in_5_different_situations.dart';

class SpeakingCategories extends StatelessWidget {
  const SpeakingCategories({super.key});

  final List<Map<String, dynamic>> grammarCategories = const [
    {
      'level': 'Basic (အခြေခံ)',
      'icon': Icons.child_care,
      'topics': [
        {
          'title': 'Future Tense in English across 5 different situations',
          'desc': 'Learn how to use future tense in English across 5 different situations: plans, predictions, decisions, offers & promises.',
          'detailScreen': FutureTenseIn5DifferentSituations(),
        },
      ],
    },
    // {
    //   'level': 'Intermediate (အလယ်အလတ်)',
    //   'icon': Icons.trending_up,
    //   'topics': [
    //     {
    //       'title': 'Passive Voice',
    //       'desc': 'Changing focus from doer to receiver',
    //       'detailScreen': PassiveVoiceScreen(),
    //       // 'detailScreen': PassiveVoiceDetailScreen(),
    //     },
    //   ],
    // },
    // {
    //   'level': 'Advanced (အဆင့်မြင့်)',
    //   'icon': Icons.school,
    //   'topics': [
    //     {
    //       'title': 'Direct & Indirect Speech',
    //       'desc': 'Reporting what others said',
    //       'detailScreen': ReportedSpeechScreen(),
    //     },
    //   ],
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('မှတ်သားစရာများ (Speakings Essentials)')),
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
                      style: Theme.of(context).textTheme.titleMedium,
                      // style: const TextStyle(fontWeight: FontWeight.w600),
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
