import 'package:flutter/material.dart';

import 'quiz_lesson_page.dart';

class ConditionalsScreen extends StatelessWidget {
  const ConditionalsScreen({super.key});

  final List<Map<String, dynamic>> conditionalData = const [
    {
      'type': 'Zero Conditional',
      'usage':
          'General Truths (အမြဲတမ်းမှန်ကန်သောအရာများ)။ သိပ္ပံနည်းကျအချက်အလက်များအတွက်သုံးသည်။',
      'formula': 'If + Simple Present, ... Simple Present',
      'examples': [
        {
          'en': 'If you heat ice, it melts.',
          'mm': 'ရေခဲကို အပူပေးရင် အရည်ပျော်တယ်။',
          'note': 'အမြဲတမ်းမှန်ကန်သော အချက်ဖြစ်သည်။',
        },
      ],
    },
    {
      'type': 'First Conditional',
      'usage': 'Real Possibilities (အနာဂတ်တွင် ဖြစ်နိုင်ခြေရှိသောအရာများ)။',
      'formula': 'If + Simple Present, ... Will + V1',
      'examples': [
        {
          'en': 'If it rains, I will stay at home.',
          'mm': 'မိုးရွာရင် ကျွန်တော် အိမ်မှာပဲ နေမယ်။',
          'note':
              'မိုးရွာဖို့ ဖြစ်နိုင်ခြေရှိပြီး ဖြစ်လာရင် လုပ်မယ့်အစီအစဉ်ဖြစ်သည်။',
        },
      ],
    },
    {
      'type': 'Second Conditional',
      'usage':
          'Imaginary Situations (လက်ရှိတွင် မဖြစ်နိုင်သော စိတ်ကူးယဉ်အခြေအနေများ)။',
      'formula': 'If + Simple Past, ... Would + V1',
      'examples': [
        {
          'en': 'If I won the lottery, I would buy a car.',
          'mm': 'ကျွန်တော် ထီပေါက်ရင် ကားတစ်စီး ဝယ်လိုက်မယ်။',
          'note': 'လက်ရှိမှာ ထီမပေါက်သေးဘဲ စိတ်ကူးယဉ်နေခြင်းဖြစ်သည်။',
        },
        {
          'en': 'If I were you, I would go.',
          'mm': 'ငါသာ မင်းနေရာမှာဆိုရင် သွားလိုက်မယ်။',
          'note': 'မဖြစ်နိုင်သော အခြေအနေ (I were သုံးသည်ကို သတိပြုရန်)။',
        },
      ],
    },
    {
      'type': 'Third Conditional',
      'usage':
          'Unreal Past (အတိတ်တွင် မဖြစ်သွားခဲ့သော အခြေအနေများကို စိတ်ကူးယဉ် အသုံးပြုရန်)။',
      'formula': 'If + Past Perfect, ... Would have + V3',
      'examples': [
        {
          'en': 'If I had studied harder, I would have passed the exam.',
          'mm': 'ကျွန်တော် ပိုလေ့ကျင့်ခဲ့ရင် စာမေးပွဲကို ဖြေနိုင်ပါလိမ့်မယ်။',
          'note':
              'အတိတ်မှာ မလေ့ကျင့်သလိုဖြစ်ပြီး၊ အခုတော့ ရလဒ်ကို ပြန်စဉ်းစားဖော်ပြခြင်းဖြစ်သည်။',
        },
        {
          'en': 'If it had not rained, we would have gone to the beach.',
          'mm': 'မိုးမရွာခဲ့ရင် ကျွန်တော်တို့ ကမ်းခြေသွားမယ် ပဲရှိမယ်။',
          'note':
              'အတိတ်မှာ မိုးရွာသဖြင့် မသွားနိုင်ခဲ့သလို အခုတော့ စိတ်ကူးယဉ်ပြန်ဆုံခြင်းဖြစ်သည်။',
        },
      ],
    },
  ];

  /// Quiz dataset: 20 questions (Zero, First, Second, Third Conditionals).
  final List<Map<String, dynamic>> conditionalQuizzes = const [
    // Zero Conditional – General truths (5)
    {
      'q': 'If you heat water to 100°C, it ___.',
      'a': 'boils',
      'options': ['boils', 'will boil', 'boiled', 'would boil'],
      'type': 'Zero Conditional',
      'mm':
          'ရေကို ဒီဂရီ ၁၀၀ ထိ အပူပေးရင် ဘာဖြစ်သွားသလဲ။ (အမြဲတမ်းမှန်ကန်သောအကြောင်းအရာ)',
    },
    {
      'q': 'If people don\'t sleep enough, they ___ tired.',
      'a': 'feel',
      'options': ['feel', 'will feel', 'felt', 'would feel'],
      'type': 'Zero Conditional',
      'mm': 'လူတွေ လုံလောက်အောင် မအိပ်လျှင် များသောအားဖြင့် မျက်နှာကျလာကြမလား။',
    },
    {
      'q': 'If you mix red and blue, you ___ purple.',
      'a': 'get',
      'options': ['get', 'will get', 'got', 'would get'],
      'type': 'Zero Conditional',
      'mm': 'နီနဲ့ အပြာရောသွင်းရင် ဘာအရောင် ထွက်လဲ။',
    },
    {
      'q': 'If it is cold, water ___.',
      'a': 'freezes',
      'options': ['freezes', 'froze', 'will freeze', 'would freeze'],
      'type': 'Zero Conditional',
      'mm': 'အရမ်းအေးလွန်းရင် ရေ ဘာဖြစ်သွားလေ့ ရှိလဲ။',
    },
    {
      'q': 'If students study regularly, they ___ better results.',
      'a': 'get',
      'options': ['get', 'will get', 'got', 'would get'],
      'type': 'Zero Conditional',
      'mm':
          'ကျောင်းသားတွေ မြဲမြံစွာ လေ့ကျင့်လျှင် ပိုမိုကောင်းမွန်တဲ့ ရလဒ်တွေ ရရှိလေ့ရှိတယ်။',
    },

    // First Conditional – Real future (5)
    {
      'q': 'If it rains tomorrow, we ___ at home.',
      'a': 'will stay',
      'options': ['will stay', 'stay', 'would stay', 'stayed'],
      'type': 'First Conditional',
      'mm': 'နက်ဖြန် မိုးရွာရင် အိမ်မှာပဲ နေမယ်လို့ ပြောချင်တဲ့အခါ။',
    },
    {
      'q': 'If she passes the exam, she ___ very happy.',
      'a': 'will be',
      'options': ['will be', 'is', 'would be', 'was'],
      'type': 'First Conditional',
      'mm': 'သူမ စာမေးပွဲကို ဖြတ်သန်းရင် အရမ်းပျော်မယ်။ (ဖြစ်နိုင်ခြေရှိ)',
    },
    {
      'q': 'If you hurry, you ___ the bus.',
      'a': 'will catch',
      'options': ['will catch', 'catch', 'caught', 'would catch'],
      'type': 'First Conditional',
      'mm': 'မင်း လျင်မလောက်ရင် ဘတ်စ်ကားကို မိလိမ့်မယ်။',
    },
    {
      'q': 'If they arrive late, we ___ without them.',
      'a': 'will start',
      'options': ['will start', 'start', 'would start', 'started'],
      'type': 'First Conditional',
      'mm': 'သူတို့ နောက်ကျရင် သူတို့မပါဘဲ စမယ်။',
    },
    {
      'q': 'If you don\'t wear a coat, you ___.',
      'a': 'will get cold',
      'options': ['will get cold', 'get cold', 'got cold', 'would get cold'],
      'type': 'First Conditional',
      'mm': 'အချိုကပ်မဝတ်ရင် မင်း အအေးမိလိမ့်မယ်။',
    },

    // Second Conditional – Unreal present (5)
    {
      'q': 'If I were rich, I ___ around the world.',
      'a': 'would travel',
      'options': ['would travel', 'will travel', 'travel', 'traveled'],
      'type': 'Second Conditional',
      'mm':
          'ငါ နှစ်သိန်းချီ စီးပွားရေးရှိရင် ကမ္ဘာလုံးကျော် လေ့လာမယ်လို့ စိတ်ကူးနေတယ်။',
    },
    {
      'q': 'If she had more time, she ___ another language.',
      'a': 'would learn',
      'options': ['would learn', 'will learn', 'learns', 'learned'],
      'type': 'Second Conditional',
      'mm':
          'သူမ အချိန်ပိုရင် ဘာသာပေါင်းစုံ လေ့လာမယ်။ (လက်ရှိမှာ အချိန် မလုံလောက်)',
    },
    {
      'q': 'If they lived closer, we ___ them more often.',
      'a': 'would visit',
      'options': ['would visit', 'will visit', 'visit', 'visited'],
      'type': 'Second Conditional',
      'mm': 'သူတို့ နီးနီးနားနားနေတာဆိုရင် ပိုပြီး လာလာရောက်ရောက် လုပ်မယ်။',
    },
    {
      'q': 'If you didn\'t smoke, you ___ healthier.',
      'a': 'would be',
      'options': ['would be', 'will be', 'are', 'were'],
      'type': 'Second Conditional',
      'mm': 'မင်း ဆေးလိပ် မသောက်ရင် ပိုကျန်းမာသွားမယ်။',
    },
    {
      'q': 'If I knew his number, I ___ him.',
      'a': 'would call',
      'options': ['would call', 'will call', 'call', 'called'],
      'type': 'Second Conditional',
      'mm': 'သူ့ဖုန်းနံပါတ် သိရင် ဖုန်းခေါ်မယ်။ (လက်ရှိမှာ မသိသေး)',
    },

    // Third Conditional – Unreal past (5)
    {
      'q': 'If I had left earlier, I ___ the train.',
      'a': 'would have caught',
      'options': [
        'would have caught',
        'will have caught',
        'would catch',
        'caught',
      ],
      'type': 'Third Conditional',
      'mm':
          'ငါ ပိုမို ထွက်ခဲ့ရင် ရထားကို မိနေတယ်။ (အတိတ်မှာ မထွက်ခဲ့လို့ မိမထား)',
    },
    {
      'q': 'If they had studied harder, they ___ the test.',
      'a': 'would have passed',
      'options': [
        'would have passed',
        'will have passed',
        'would pass',
        'passed',
      ],
      'type': 'Third Conditional',
      'mm': 'သူတို့ ပိုလေ့လာထားရင် စာမေးပွဲ ဖြတ်သန်းပြီးနေမယ်။',
    },
    {
      'q': 'If she had seen the message, she ___ you back.',
      'a': 'would have called',
      'options': [
        'would have called',
        'will have called',
        'would call',
        'called',
      ],
      'type': 'Third Conditional',
      'mm': 'သူမ စာကို မြင်ခဲ့ရင် နောက်ပြန် ခေါ်မယ်။ (အတိတ်မှာ မမြင်သွား)',
    },
    {
      'q': 'If it had been sunny, we ___ a picnic.',
      'a': 'would have had',
      'options': ['would have had', 'will have had', 'would have', 'had'],
      'type': 'Third Conditional',
      'mm': 'နေကောင်းပြီး နေ့လင်းနေခဲ့ရင် ကျွန်တော်တို့ picnic သွားမယ်။',
    },
    {
      'q': 'If you had told me earlier, I ___ you.',
      'a': 'would have helped',
      'options': [
        'would have helped',
        'will have helped',
        'would help',
        'helped',
      ],
      'type': 'Third Conditional',
      'mm': 'မင်း ဦးဦးစီးစီး ပြောခဲ့ရင် ကူညီပေးလိမ့်မယ်။',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Conditionals (If Clauses)')),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'conditionals-quiz',
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizLessonPage(
              quizData: conditionalQuizzes,
              tenseTitle: 'Conditionals (If Clauses)',
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
          _buildSummaryChart(context),
          const SizedBox(height: 20),
          ...conditionalData.map(
            (data) => _buildConditionalCard(data, context),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryChart(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.onPrimary,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: const Column(
          spacing: 8,
          children: [
            Text(
              "Quick Logic Map",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,

                    child: Text(
                      "Zero: 100% Real",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,

                    child: Text(
                      "1st: Possible",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "2nd: Imaginary",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConditionalCard(
    Map<String, dynamic> data,
    BuildContext context,
  ) {
    return Card(
      color: Theme.of(context).colorScheme.onPrimary,
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data['type'], style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(data['usage'], style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(
                  context,
                ).colorScheme.onPrimaryContainer.withAlpha(25),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                data['formula'],
                style: TextStyle(
                  fontFamily: 'monospace',
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
            const Divider(height: 30),
            ...(data['examples'] as List).map(
              (ex) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ex['en'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(ex['mm']),
                  Text(
                    "Note: ${ex['note']}",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
