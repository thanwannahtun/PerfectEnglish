// This is one of the most challenging areas for advanced learners because
// there isn't always a simple "mathematical" rule.
// It often depends on the specific verb that comes before.
// In Burmese, both often translate to "ခြင်း" or "ရန်", but in English,
// using the wrong one can make a sentence sound unnatural.

import 'package:flutter/material.dart';
import 'package:perfect_english/widgets/speak_button.dart';
import 'quiz_lesson_page.dart';

// Why this is "Advanced":
// Meaning Change Section: This is the hallmark of advanced English.
// Teaching the difference between Stop to smoke vs Stop smoking prevents major communication errors.
//
// Keyword Chips: Instead of just sentences, I’ve extracted the "Trigger Verbs" into visual chips.
// Advanced students often need to memorize these verb patterns.
//
// Concept-Based Logic:
// The "Quick Memory Tip" at the top gives a deeper linguistic insight: Gerunds = Reality/Past, Infinitives = Future/Goal.

class GerundsVsInfinitivesScreen extends StatelessWidget {
  const GerundsVsInfinitivesScreen({super.key});

  final List<Map<String, dynamic>> grammarData = const [
    {
      'type': '1. The Gerund (-ing form)',
      'desc':
          'ကြိယာကို နာမ်ကဲ့သို့ အသုံးပြုခြင်းဖြစ်သည်။ အောက်ပါကြိယာများနောက်တွင် Gerund လိုက်ရမည်။',
      'keywords': [
        'Enjoy',
        'Finish',
        'Avoid',
        'Mind',
        'Suggest',
        'Keep',
        'Practice',
      ],
      'examples': [
        {
          'en': 'I enjoy swimming in the ocean.',
          'mm': 'ကျွန်တော် ပင်လယ်ထဲမှာ ရေကူးရတာကို ပျော်မွေ့ပါတယ်။',
          'note': 'Enjoy + V-ing',
        },
        {
          'en': 'Would you mind closing the window?',
          'mm': 'ပြတင်းပေါက်လေး ပိတ်ပေးလို့ ရမလားခင်ဗျာ။',
          'note': 'Mind + V-ing',
        },
      ],
    },
    {
      'type': '2. The Infinitive (to + verb)',
      'desc':
          'ရည်ရွယ်ချက် သို့မဟုတ် အနာဂတ်လုပ်ဆောင်ချက်များအတွက် သုံးသည်။ အောက်ပါကြိယာများနောက်တွင် Infinitive လိုက်ရမည်။',
      'keywords': [
        'Want',
        'Need',
        'Decide',
        'Hope',
        'Promise',
        'Plan',
        'Agree',
      ],
      'examples': [
        {
          'en': 'I decided to move to a new city.',
          'mm': 'မြို့အသစ်ကို ပြောင်းဖို့ ကျွန်တော် ဆုံးဖြတ်လိုက်တယ်။',
          'note': 'Decide + to V1',
        },
        {
          'en': 'She promised to help me.',
          'mm': 'သူမ ကျွန်တော့်ကို ကူညီမယ်လို့ ကတိပေးခဲ့တယ်။',
          'note': 'Promise + to V1',
        },
      ],
    },
    {
      'type': '3. Meaning Change (အဓိပ္ပာယ်ပြောင်းလဲမှု)',
      'desc':
          'အချို့ကြိယာများသည် Gerund သို့မဟုတ် Infinitive သုံးပုံပေါ်မူတည်၍ အဓိပ္ပာယ်ကွဲပြားသွားတတ်သည်။ (အဆင့်မြင့် ကျောင်းသားများအတွက် အလွန်အရေးကြီးသည်)',
      'examples': [
        {
          'en': 'I stopped smoking.',
          'mm': 'ကျွန်တော် ဆေးလိပ်သောက်တာကို လုံးဝဖြတ်လိုက်ပြီ။',
          'note': 'Stop + Gerund = လုပ်လက်စအလုပ်ကို ရပ်တန့်ခြင်း',
        },
        {
          'en': 'I stopped to smoke.',
          'mm': 'ကျွန်တော် ဆေးလိပ်သောက်ဖို့ (လမ်းဘေးမှာ) ခဏရပ်လိုက်တယ်။',
          'note': 'Stop + Infinitive = အခြားအလုပ်တစ်ခုလုပ်ရန် ရပ်တန့်ခြင်း',
        },
        {
          'en': 'I forgot meeting him.',
          'mm': 'သူ့ကိုတွေ့ခဲ့တာကို ကျွန်တော် မေ့သွားတယ်။',
          'note': 'Forgot + Gerund = လုပ်ခဲ့ပြီးသား အတိတ်ကိုမေ့ခြင်း',
        },
        {
          'en': 'I forgot to meet him.',
          'mm': 'သူ့ကိုတွေ့ဖို့ (ချိန်းထားတာကို) ကျွန်တော် မေ့သွားတယ်။',
          'note': 'Forgot + Infinitive = လုပ်ရန်ကျန်ရှိသည်ကို မေ့ခြင်း',
        },
      ],
    },
  ];

  /// Quiz dataset: 20 questions (4 types) for Gerunds vs Infinitives.
  final List<Map<String, dynamic>> gerundInfinitiveQuizzes = const [
    // Gerund Only (V-ing) – 5 questions
    {
      'q': 'I enjoy ___ (swim) in the sea.',
      'a': 'swimming',
      'options': ['swim', 'to swim', 'swimming', 'to swimming'],
      'type': 'Gerund Only',
      'mm': 'Enjoy နောက်မှာ V-ing သာ လိုက်ရပါသည်။',
    },
    {
      'q': 'She finished ___ (do) her homework.',
      'a': 'doing',
      'options': ['do', 'to do', 'doing', 'did'],
      'type': 'Gerund Only',
      'mm': 'Finish + V-ing ကို သုံးရပါသည်။',
    },
    {
      'q': 'They avoided ___ (talk) about the problem.',
      'a': 'talking',
      'options': ['talk', 'to talk', 'talking', 'to talking'],
      'type': 'Gerund Only',
      'mm': 'Avoid နောက်မှာ V-ing သာ သုံးရပါသည်။',
    },
    {
      'q': 'Would you mind ___ (open) the window?',
      'a': 'opening',
      'options': ['open', 'to open', 'opening', 'to opening'],
      'type': 'Gerund Only',
      'mm': 'Mind + V-ing သာ အသုံးများသည်။',
    },
    {
      'q': 'He keeps ___ (practice) English every day.',
      'a': 'practicing',
      'options': ['practice', 'to practice', 'practicing', 'practised'],
      'type': 'Gerund Only',
      'mm': 'Keep + V-ing = ဆက်လက် လုပ်နေသည်။',
    },

    // Infinitive Only (to + V1) – 5 questions
    {
      'q': 'She decided ___ (move) to another country.',
      'a': 'to move',
      'options': ['move', 'to move', 'moving', 'to moving'],
      'type': 'Infinitive Only',
      'mm': 'Decide နောက်ပိုင်း Infinitive (to + V1) သုံးရပါသည်။',
    },
    {
      'q': 'I hope ___ (see) you again soon.',
      'a': 'to see',
      'options': ['seeing', 'to see', 'see', 'to seeing'],
      'type': 'Infinitive Only',
      'mm': 'Hope + to V1 သာ သုံးရသည်။',
    },
    {
      'q': 'They agreed ___ (help) us with the project.',
      'a': 'to help',
      'options': ['help', 'to help', 'helping', 'to helping'],
      'type': 'Infinitive Only',
      'mm': 'Agree နောက်မှာ to V1 သုံးရပါတယ်။',
    },
    {
      'q': 'He promised ___ (call) me tonight.',
      'a': 'to call',
      'options': ['calling', 'to call', 'call', 'to calling'],
      'type': 'Infinitive Only',
      'mm': 'Promise + to V1 သာ သုံးသင့်သည်။',
    },
    {
      'q': 'You need ___ (study) harder for the exam.',
      'a': 'to study',
      'options': ['study', 'to study', 'studying', 'to studying'],
      'type': 'Infinitive Only',
      'mm':
          'Need နောက်မှာ to V1 သို့မဟုတ် passive V3 ဆက်နိုင်ပေမယ့် ဒီမှာ Infinitive ဖြစ်သည်။',
    },

    // Meaning Change (Stop / Remember / Forget / Try) – 5 questions
    {
      'q': 'I stopped ___ (smoke) last year.',
      'a': 'smoking',
      'options': ['smoke', 'to smoke', 'smoking', 'to smoking'],
      'type': 'Meaning Change',
      'mm': 'Stop + V-ing = လုပ်နေတဲ့ အလုပ်ကို ရပ်လိုက်သည်။',
    },
    {
      'q': 'I stopped ___ (smoke) on the way home.',
      'a': 'to smoke',
      'options': ['smoke', 'to smoke', 'smoking', 'to smoking'],
      'type': 'Meaning Change',
      'mm': 'Stop + to V1 = အခြား အလုပ်တစ်ခု လုပ်ရန် ရပ်လိုက်သည်။',
    },
    {
      'q': 'I remembered ___ (lock) the door before I left.',
      'a': 'to lock',
      'options': ['locking', 'to lock', 'lock', 'to locking'],
      'type': 'Meaning Change',
      'mm': 'Remember + to V1 = မလုပ်မီ မမေ့ဖို့ အကြို သတိပြုခြင်း။',
    },
    {
      'q': 'I remember ___ (meet) her at the party.',
      'a': 'meeting',
      'options': ['meet', 'to meet', 'meeting', 'to meeting'],
      'type': 'Meaning Change',
      'mm': 'Remember + V-ing = လုပ်ပြီးသား အတိတ်ကို သတိရနေခြင်း။',
    },
    {
      'q': 'He tried ___ (open) the door, but it was stuck.',
      'a': 'to open',
      'options': ['open', 'to open', 'opening', 'to opening'],
      'type': 'Meaning Change',
      'mm': 'Try + to V1 = ကြိုးစား လုပ်ကြည့်သည်။',
    },

    // Common Error Mix (Gerund vs Infinitive) – 5 questions
    {
      'q': 'She suggested ___ (go) to the cinema.',
      'a': 'going',
      'options': ['go', 'to go', 'going', 'to going'],
      'type': 'Common Error',
      'mm': 'Suggest နောက်မှာ V-ing သာ သုံးရပြီး *to go* မသုံးကြပါ။',
    },
    {
      'q': 'I\'m learning ___ (play) the guitar.',
      'a': 'to play',
      'options': ['play', 'playing', 'to play', 'to playing'],
      'type': 'Common Error',
      'mm': 'Learn နောက်မှာ to V1 သာ သုံးရသည်။',
    },
    {
      'q': 'He admitted ___ (cheat) in the exam.',
      'a': 'cheating',
      'options': ['cheat', 'to cheat', 'cheating', 'to cheating'],
      'type': 'Common Error',
      'mm': 'Admit + V-ing သာ သုံးရသည်။',
    },
    {
      'q': 'They decided ___ (not / buy) the car.',
      'a': 'not to buy',
      'options': ['to not buy', 'not to buy', 'not buying', 'no buy'],
      'type': 'Common Error',
      'mm':
          'Negative Infinitive သုံးရာမှာ *not to buy* ဟာ သတ်မှတ်ပုံစံ ဖြစ်တယ်။',
    },
    {
      'q': 'She is interested in ___ (learn) English.',
      'a': 'learning',
      'options': ['learn', 'to learn', 'learning', 'to learning'],
      'type': 'Common Error',
      'mm': 'Preposition (in) နောက်မှာ V-ing သာ လိုက်ရပါသည်။',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gerunds vs Infinitives')),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'gerunds-vs-infinitives-quiz',
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizLessonPage(
              quizData: gerundInfinitiveQuizzes,
              tenseTitle: 'Gerunds vs Infinitives',
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
          _buildComparisonHeader(context),
          const SizedBox(height: 20),
          ...grammarData.map((data) => _buildGrammarCard(data, context)),
        ],
      ),
    );
  }

  Widget _buildComparisonHeader(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.onPrimary,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Quick Memory Tip",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 8),
            Text(
              "Gerunds are often about 'Real/Past' experiences.\nInfinitives are often about 'Future/Potential' actions.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGrammarCard(Map<String, dynamic> data, BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.onPrimary,
      margin: const EdgeInsets.only(bottom: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data['type'], style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(data['desc'], style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 12),
            if (data.containsKey('keywords'))
              Wrap(
                spacing: 8,
                children: (data['keywords'] as List<String>)
                    .map(
                      (word) => Chip(
                        label: Text(
                          word,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onPrimaryContainer,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.onPrimaryContainer.withAlpha(25),
                      ),
                    )
                    .toList(),
              ),
            const Divider(height: 30),
            ...(data['examples'] as List).map(
              (ex) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            ex['en'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              // color: Colors.black87,
                            ),
                          ),
                        ),
                        SpeakButton(text: ex['en']),
                      ],
                    ),

                    const SizedBox(height: 4),
                    Text(
                      ex['mm'],
                      style: const TextStyle(
                        fontSize: 14,
                        // color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).colorScheme.onPrimaryContainer.withAlpha(25),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        "💡 ${ex['note']}",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(
                            context,
                          ).colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
