import 'package:flutter/material.dart';

class TenseCategoryScreen extends StatelessWidget {
  const TenseCategoryScreen({super.key});

  final List<Map<String, dynamic>> tensesData = const [
    {
      'group': 'Present Tenses (ပစ္စုပ္ပန်ကာလ)',
      'items': [
        {
          'title': 'Simple Present',
          'formula': 'Subject + V1 (s/es)',
          'usage':
              'အမြဲတမ်းမှန်ကန်သောအရာများ၊ အလေ့အထများကို ဖော်ပြရာတွင် သုံးသည်။',
          'examples': [
            {
              'en': 'The sun rises in the east.',
              'mm': 'နေသည် အရှေ့ဘက်မှ ထွက်သည်။',
            },
            {
              'en': 'I drink coffee every morning.',
              'mm': 'ကျွန်တော် မနက်တိုင်း ကော်ဖီသောက်တယ်။',
            },
          ],
        },
        {
          'title': 'Present Continuous',
          'formula': 'Subject + am/is/are + V-ing',
          'usage':
              'လက်ရှိတွင် လုပ်ဆောင်နေဆဲ အပြုအမူများကို ဖော်ပြရာတွင် သုံးသည်။',
          'examples': [
            {
              'en': 'I am learning English now.',
              'mm': 'ကျွန်တော် အခု အင်္ဂလိပ်စာ သင်ယူနေပါတယ်။',
            },
            {'en': 'It is raining.', 'mm': 'မိုးရွာနေတယ်။'},
          ],
        },
        {
          'title': 'Present Perfect',
          'formula': 'Subject + have/has + V3',
          'usage':
              'ပြီးစီးသွားသော်လည်း အကျိုးသက်ရောက်မှု ကျန်ရှိနေသော အရာများကို ဖော်ပြသည်။',
          'examples': [
            {
              'en': 'I have eaten my lunch.',
              'mm': 'ကျွန်တော် နေ့လယ်စာ စားပြီးပြီ။',
            },
            {'en': 'She has lost her key.', 'mm': 'သူမ သော့ပျောက်သွားပြီ။'},
          ],
        },
        {
          'title': 'Present Perfect Continuous',
          'formula': 'Subject + have/has + been + V-ing',
          'usage':
              'အတိတ်မှစ၍ လက်ရှိအချိန်ထိ တောက်လျှောက် လုပ်ဆောင်နေဆဲအရာများကို ဖော်ပြသည်။',
          'examples': [
            {
              'en': 'It has been raining for two hours.',
              'mm': 'မိုးရွာနေတာ ၂ နာရီ ရှိပြီ။',
            },
            {
              'en': 'I have been waiting here since 9 AM.',
              'mm': 'မနက် ၉ နာရီကတည်းက ဒီမှာ စောင့်နေတာပါ။',
            },
          ],
        },
      ],
    },
    {
      'group': 'Past Tenses (အတိတ်ကာလ)',
      'items': [
        {
          'title': 'Simple Past',
          'formula': 'Subject + V2',
          'usage': 'အတိတ်က ပြီးဆုံးခဲ့သည့် အပြုအမူတစ်ခုကို ဖော်ပြသည်။',
          'examples': [
            {
              'en': 'I went to school yesterday.',
              'mm': 'မနေ့က ကျွန်တော် ကျောင်းသွားခဲ့တယ်။',
            },
            {'en': 'He bought a new car.', 'mm': 'သူ ကားအသစ်တစ်စီး ဝယ်ခဲ့တယ်။'},
          ],
        },
        {
          'title': 'Past Continuous',
          'formula': 'Subject + was/were + V-ing',
          'usage':
              'အတိတ်ကာလ တစ်ချိန်ချိန်မှာ လုပ်ဆောင်နေခဲ့သည့် အရာကို ဖော်ပြသည်။',
          'examples': [
            {
              'en': 'I was sleeping when you called.',
              'mm': 'မင်းဖုန်းဆက်တော့ ငါအိပ်နေခဲ့တာ။',
            },
          ],
        },
        // Note: You can expand to Past Perfect and Past Perfect Continuous following this pattern
      ],
    },
    {
      'group': 'Future Tenses (အနာဂတ်ကာလ)',
      'items': [
        {
          'title': 'Simple Future',
          'formula': 'Subject + will + V1',
          'usage': 'နောင်တွင် ဖြစ်ပျက်လာမည့် အရာများကို ဖော်ပြသည်။',
          'examples': [
            {
              'en': 'I will call you tonight.',
              'mm': 'ဒီည ငါမင်းကို ဖုန်းဆက်မယ်။',
            },
          ],
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All 12 Tenses')),
      body: ListView.builder(
        itemCount: tensesData.length,
        itemBuilder: (context, index) {
          final group = tensesData[index];
          return ExpansionTile(
            initiallyExpanded: index == 0,
            title: Text(
              group['group'],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            children: (group['items'] as List)
                .map(
                  (tense) => ListTile(
                    title: Text(tense['title']),
                    subtitle: Text(tense['formula']),
                    trailing: const Icon(Icons.arrow_right),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TenseDetailScreen(tense: tense),
                      ),
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}

class TenseDetailScreen extends StatelessWidget {
  final Map<String, dynamic> tense;

  const TenseDetailScreen({super.key, required this.tense});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tense['title'])),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Formula Section
            const Text(
              "Structure / Formula",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                tense['formula'],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),

            const SizedBox(height: 20),
            const Text(
              "Usage (အသုံးပြုပုံ)",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            Text(tense['usage'], style: const TextStyle(fontSize: 16)),

            const Divider(height: 40),
            const Text(
              "Examples with Highlighting",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 10),

            // Reusing the highlighting logic we discussed
            ...(tense['examples'] as List)
                .map(
                  (ex) => Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ex['en'],
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            ex['mm'],
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
