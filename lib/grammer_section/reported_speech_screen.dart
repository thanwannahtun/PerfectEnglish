import 'package:flutter/material.dart';

class ReportedSpeechScreen extends StatelessWidget {
  const ReportedSpeechScreen({super.key});

  final List<Map<String, dynamic>> reportingRules = const [
    {
      'category': '1. The Tense Backshift Rule (ကာလပြောင်းလဲခြင်း)',
      'desc':
          'Reporting verb သည် အတိတ်ကာလ (Said/Told) ဖြစ်နေလျှင် ဝါကျအတွင်းရှိ Tense ကို တစ်ဆင့်နောက်ဆုတ်ရမည်။',
      'rules': [
        {'from': 'Simple Present', 'to': 'Simple Past'},
        {'from': 'Present Continuous', 'to': 'Past Continuous'},
        {'from': 'Present Perfect', 'to': 'Past Perfect'},
        {'from': 'Will / Can / May', 'to': 'Would / Could / Might'},
      ],
      'examples': [
        {
          'direct': 'He said, "I am hungry."',
          'indirect': 'He said that he was hungry.',
          'mm': 'သူက ဗိုက်ဆာနေတယ်လို့ ပြောခဲ့တယ်။ (Am -> Was သို့ပြောင်းသည်)',
        },
        {
          'direct': 'She said, "I have finished my work."',
          'indirect': 'She said that she had finished her work.',
          'mm': 'သူမ အလုပ်ပြီးပြီလို့ ပြောခဲ့တယ်။ (Have -> Had သို့ပြောင်းသည်)',
        },
      ],
    },
    {
      'category': '2. Changes in Time & Place (အချိန်နှင့် နေရာ)',
      'desc':
          'စကားပြောသူ ပြောခဲ့သည့်အချိန်နှင့် နေရာသည် ယခုနှင့် မတူနိုင်တော့သဖြင့် ပြောင်းလဲပေးရမည်။',
      'rules': [
        {'from': 'Now', 'to': 'Then'},
        {'from': 'Today', 'to': 'That day'},
        {'from': 'Tomorrow', 'to': 'The next day'},
        {'from': 'Here', 'to': 'There'},
        {'from': 'This', 'to': 'That'},
      ],
      'examples': [
        {
          'direct': 'They said, "We are leaving tomorrow."',
          'indirect': 'They said that they were leaving the next day.',
          'mm': 'သူတို့ နောက်နေ့မှာ ထွက်သွားကြမယ်လို့ ပြောခဲ့တယ်။',
        },
      ],
    },
    {
      'category': '3. Reporting Questions (အမေးဝါကျကို ပြန်ပြောခြင်း)',
      'desc':
          'အမေးဝါကျကို Indirect ပြောင်းလျှင် Question mark ဖြုတ်ရမည်။ Yes/No question ဆိုလျှင် "If/Whether" ကို သုံးရမည်။',
      'examples': [
        {
          'direct': '"Where do you live?" he asked.',
          'indirect': 'He asked me where I lived.',
          'mm': 'ကျွန်တော် ဘယ်မှာနေလဲလို့ သူကမေးတယ်။ (Wh- question)',
        },
        {
          'direct': '"Do you like tea?" she asked.',
          'indirect': 'She asked if I liked tea.',
          'mm':
              'ကျွန်တော် လက်ဖက်ရည်ကြိုက်သလားလို့ သူမကမေးတယ်။ (Yes/No question)',
        },
      ],
    },
    {
      'category': '4. Commands & Requests (အမိန့်နှင့် တောင်းဆိုချက်)',
      'desc':
          'အမိန့်ပေးခြင်း သို့မဟုတ် တောင်းဆိုခြင်းများတွင် "to + V1" ပုံစံကို သုံးရမည်။',
      'examples': [
        {
          'direct': 'The doctor said, "Stay in bed."',
          'indirect': 'The doctor told me to stay in bed.',
          'mm': 'အိပ်ရာထဲမှာပဲ အနားယူဖို့ ဆရာဝန်က ပြောခဲ့တယ်။',
        },
        {
          'direct': '"Don\'t smoke," he said.',
          'indirect': 'He told me not to smoke.',
          'mm': 'ဆေးလိပ်မသောက်ဖို့ သူက တားမြစ်ခဲ့တယ်။',
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Direct & Indirect Speech (Advanced)')),
      body: ListView(
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: MediaQuery.sizeOf(context).width * 0.05,
        ),
        children: [
          Text(
            "Advanced Transformation Guide",
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontSize: 22),
          ),
          const SizedBox(height: 10),
          ...reportingRules.map(
            (rule) => _buildAdvancedRuleCard(rule, context),
          ),
        ],
      ),
    );
  }

  Widget _buildAdvancedRuleCard(
    Map<String, dynamic> data,
    BuildContext context,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data['category'],
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(data['desc'], style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 12),

            // Render Conversion Table if exists
            if (data.containsKey('rules')) ...[
              _buildConversionTable(data['rules'], context),
              const SizedBox(height: 16),
            ],

            const Text(
              "Advanced Samples:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...(data['examples'] as List).map(
              (ex) => _buildExampleBox(ex, context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConversionTable(List<dynamic> rules, BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        // color: Theme.of(context).colorScheme.inversePrimary,
        color: Theme.of(context).colorScheme.onPrimaryContainer.withAlpha(25),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Wrap(
        spacing: 10,
        runSpacing: 5,
        children: rules
            .map(
              (r) => Chip(
                label: Text(
                  "${r['from']} → ${r['to']}",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: Theme.of(context).colorScheme.onPrimary,
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildExampleBox(Map<String, dynamic> ex, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: Colors.indigo.shade200, width: 4),
        ),
        color: Theme.of(context).colorScheme.onPrimaryContainer.withAlpha(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                "Direct: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  // color: Colors.redAccent,
                ),
              ),
              Expanded(
                child: Text(
                  ex['direct'],
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Text(
                "Indirect: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              Expanded(
                child: Text(
                  ex['indirect'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const Divider(),
          Text(ex['mm'], style: TextStyle(fontSize: 13)),
        ],
      ),
    );
  }
}

/**
 *
 * Why this is "Advanced":
    Comprehensive Conversion Tables: Instead of just sentences, I’ve added visual conversion chips (Simple Present → Simple Past) so students can see the patterns immediately.

    Reporting Questions Logic: It explains the tricky difference between reporting Wh- questions and Yes/No questions (using If/Whether).

    Command/Request Structure: It highlights the shift to the infinitive form (to + verb), which is a common advanced error.

    Time/Place Shifts: Advanced English requires precise reporting of where and when, so a dedicated section for "Today → That day" is included.
 */
