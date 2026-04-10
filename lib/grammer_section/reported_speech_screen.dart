import 'package:flutter/material.dart';
import 'package:perfect_english/widgets/speak_button.dart';

import 'quiz_lesson_page.dart';

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

  /// Quiz dataset: 20 questions for Direct & Indirect Speech.
  final List<Map<String, dynamic>> reportedSpeechQuizzes = const [
    // Tense Backshift (5)
    {
      'q': 'He said, "I am tired." → He said that he __ tired.',
      'a': 'was',
      'options': ['was', 'is', 'will be', 'has been'],
      'type': 'Tense Backshift',
      'mm': 'Present (am) ကို Past (was) သို့ နောက်ဆုတ်ရသည်။',
    },
    {
      'q':
          'She said, "I have finished my homework." → She said that she __ finished her homework.',
      'a': 'had',
      'options': ['have', 'has', 'had', 'having'],
      'type': 'Tense Backshift',
      'mm':
          'Present Perfect (have finished) → Past Perfect (had finished) သို့ ပြောင်းသည်။',
    },
    {
      'q':
          'They said, "We will travel next month." → They said that they __ travel the next month.',
      'a': 'would',
      'options': ['will', 'would', 'can', 'could'],
      'type': 'Tense Backshift',
      'mm': 'Will → Would သို့ နောက်ဆုတ်ရသည်။',
    },
    {
      'q':
          'He said, "I can swim very well." → He said that he __ swim very well.',
      'a': 'could',
      'options': ['can', 'could', 'will', 'would'],
      'type': 'Tense Backshift',
      'mm': 'Can → Could သို့ ပြောင်းရသည်။',
    },
    {
      'q':
          'She said, "I am reading a book." → She said that she __ reading a book.',
      'a': 'was',
      'options': ['is', 'was', 'were', 'has been'],
      'type': 'Tense Backshift',
      'mm':
          'Present Continuous (am reading) → Past Continuous (was reading) ဖြစ်ရသည်။',
    },

    // Time & Place Shift (5)
    {
      'q':
          '"We are meeting here today," he said. → He said that they were meeting __ __.',
      'a': 'there that day',
      'options': [
        'here today',
        'there that day',
        'there tomorrow',
        'here that day',
      ],
      'type': 'Time & Place',
      'mm': 'Here → There, Today → That day သို့ ပြောင်းရန်လိုသည်။',
    },
    {
      'q':
          '"I will see you tomorrow," she said. → She said that she would see me __ __.',
      'a': 'the next day',
      'options': ['tomorrow', 'the next day', 'that day', 'the previous day'],
      'type': 'Time & Place',
      'mm': 'Tomorrow → The next day သို့ ပြောင်းရသည်။',
    },
    {
      'q':
          '"I met him yesterday," he said. → He said that he had met him __ __.',
      'a': 'the day before',
      'options': ['yesterday', 'the day before', 'last day', 'the next day'],
      'type': 'Time & Place',
      'mm': 'Yesterday → The day before သို့ ပြောင်းရသည်။',
    },
    {
      'q': '"We live here," they said. → They said that they lived __.',
      'a': 'there',
      'options': ['here', 'there', 'where', 'anywhere'],
      'type': 'Time & Place',
      'mm': 'Here ကို indirect မှာ There သို့ ပြောင်းရသည်။',
    },
    {
      'q':
          '"This book is interesting," she said. → She said that __ book was interesting.',
      'a': 'that',
      'options': ['this', 'these', 'that', 'those'],
      'type': 'Time & Place',
      'mm': 'This → That သို့ ပြောင်းရသည်။',
    },

    // Reporting Questions (5)
    {
      'q': '"Where do you work?" he asked. → He asked me where I __.',
      'a': 'worked',
      'options': ['work', 'worked', 'was working', 'had worked'],
      'type': 'Reporting Questions',
      'mm':
          'Wh-question တွင် word order ကို statement ပုံစံလို ပြောင်းပြီး Tense ကို backshift လုပ်ရသည်။',
    },
    {
      'q': '"Do you like coffee?" she asked. → She asked if I __ coffee.',
      'a': 'liked',
      'options': ['like', 'liked', 'was liking', 'had liked'],
      'type': 'Reporting Questions',
      'mm':
          'Yes/No question မှာ If/Whether သုံးပြီး Present → Past သို့ ပြောင်းရသည်။',
    },
    {
      'q':
          '"Why are you late?" the teacher asked. → The teacher asked why I __ late.',
      'a': 'was',
      'options': ['am', 'was', 'were', 'had been'],
      'type': 'Reporting Questions',
      'mm': 'Are → Was သို့ နောက်ဆုတ်ရသည်။',
    },
    {
      'q': '"Can you help me?" he asked. → He asked if I __ help him.',
      'a': 'could',
      'options': ['can', 'could', 'will', 'would'],
      'type': 'Reporting Questions',
      'mm': 'Can → Could သို့ ပြောင်းရသည်။',
    },
    {
      'q': '"What are you doing?" she asked. → She asked what I __ doing.',
      'a': 'was',
      'options': ['am', 'was', 'were', 'had been'],
      'type': 'Reporting Questions',
      'mm':
          'Present Continuous ကို Past Continuous (was doing) သို့ နောက်ဆုတ်ရသည်။',
    },

    // Commands & Requests (5)
    {
      'q': '"Please open the window," she said. → She told me __ the window.',
      'a': 'to open',
      'options': ['open', 'to open', 'opening', 'to opening'],
      'type': 'Commands & Requests',
      'mm': 'Command/Request တွင် told/asked + object + to V1 သုံးရသည်။',
    },
    {
      'q': '"Don\'t be late," he said. → He told me __ late.',
      'a': 'not to be',
      'options': ['to not be', 'not be', 'not to be', 'no be'],
      'type': 'Commands & Requests',
      'mm': 'Negative command တွင် not to V1 သုံးရသည်။',
    },
    {
      'q': '"Sit down," the teacher said. → The teacher told us __ down.',
      'a': 'to sit',
      'options': ['sit', 'to sit', 'sitting', 'to sitting'],
      'type': 'Commands & Requests',
      'mm': 'Imperative ကနေ Indirect သို့ပြောင်းရာတွင် to V1 သုံးရသည်။',
    },
    {
      'q': '"Please don\'t touch that," she said. → She asked me __ that.',
      'a': 'not to touch',
      'options': ['to not touch', 'not touch', 'not to touch', 'no touch'],
      'type': 'Commands & Requests',
      'mm': 'Don\'t + V1 ကို Indirect မှာ not to V1 အဖြစ် ပြောင်းရသည်။',
    },
    {
      'q': '"Be quiet," he said. → He told us __ quiet.',
      'a': 'to be',
      'options': ['be', 'to be', 'being', 'to being'],
      'type': 'Commands & Requests',
      'mm': 'Be quiet → told us to be quiet အဖြစ်ပြောင်းရသည်။',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Direct & Indirect Speech (Advanced)')),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'reported-speech-quiz',
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizLessonPage(
              quizData: reportedSpeechQuizzes,
              tenseTitle: 'Direct & Indirect Speech',
            ),
          ),
        ),
        label: const Text('Take a Quiz'),
        icon: const Icon(Icons.play_arrow),
      ),
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
      color: Theme.of(context).colorScheme.onPrimary,
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
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: const Text(
                  "Direct: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    // color: Colors.redAccent,
                  ),
                ),
              ),
              SpeakButton(text: ex['direct']),
            ],
          ),
          Text(
            ex['direct'],
            style: const TextStyle(fontStyle: FontStyle.italic),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: const Text(
                  "Indirect: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    // color: Colors.redAccent,
                  ),
                ),
              ),
              SpeakButton(text: ex['indirect']),
            ],
          ),
          Text(
            ex['indirect'],
            style: const TextStyle(fontStyle: FontStyle.italic),
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
