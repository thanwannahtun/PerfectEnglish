import 'package:flutter/material.dart';

class SubjectVerbAgreementScreen extends StatelessWidget {
  const SubjectVerbAgreementScreen({super.key});

  final List<Map<String, dynamic>> rulesData = const [
    {
      'rule': 'Rule 1: Singular Subject',
      'desc':
          'Subject က တစ်ဦးတစ်ယောက်တည်း (Singular) ဖြစ်လျှင် Verb တွင် s သို့မဟုတ် es ပေါင်းရမည်။',
      'formula': 'Singular Subject + Verb(s/es)',
      'examples': [
        {
          's': 'He',
          'v': 'plays',
          'rest': 'football.',
          'mm': 'သူ ဘောလုံးကစားသည်။',
        },
        {
          's': 'The cat',
          'v': 'runs',
          'rest': 'fast.',
          'mm': 'ကြောင်က မြန်မြန်ပြေးသည်။',
        },
        {
          's': 'She',
          'v': 'cooks',
          'rest': 'delicious food.',
          'mm': 'သူမ ဟင်းကောင်းကောင်းချက်တတ်သည်။',
        },
      ],
    },
    {
      'rule': 'Rule 2: Plural Subject',
      'desc':
          'Subject က အများ (Plural) ဖြစ်လျှင် Verb တွင် s/es ပေါင်းရန်မလိုပါ။ (I နှင့် You လည်းပါဝင်သည်)',
      'formula': 'Plural Subject + Verb(Base)',
      'examples': [
        {
          's': 'They',
          'v': 'play',
          'rest': 'football.',
          'mm': 'သူတို့ ဘောလုံးကစားကြသည်။',
        },
        {
          's': 'We',
          'v': 'eat',
          'rest': 'lunch together.',
          'mm': 'ကျွန်ုပ်တို့ နေ့လယ်စာ အတူစားကြသည်။',
        },
        {
          's': 'I',
          'v': 'write',
          'rest': 'a letter.',
          'mm': 'ကျွန်တော် စာတစ်စောင်ရေးသည်။',
        },
      ],
    },
    {
      'rule': 'Rule 3: Compound Subjects (And)',
      'desc':
          'Subject နှစ်ခုကို "And" ဖြင့်ဆက်ထားလျှင် အများကိန်း (Plural) အဖြစ်သတ်မှတ်သည်။',
      'formula': 'S1 + and + S2 + Verb(Base)',
      'examples': [
        {
          's': 'Kyaw Kyaw and Su Su',
          'v': 'work',
          'rest': 'in the same office.',
          'mm': 'ကျော်ကျော်နှင့် စုစုတို့က ရုံးတစ်ခုတည်းမှာ အလုပ်လုပ်ကြသည်။',
        },
      ],
    },
    {
      'rule': 'Rule 4: Collective Nouns',
      'desc':
          'အဖွဲ့အစည်း (Team, Family, Group) များကို အစုအဖွဲ့တစ်ခုတည်းအဖြစ်ယူဆကာ အနည်းကိန်း (Singular) သုံးလေ့ရှိသည်။',
      'formula': 'Collective Noun + Verb(s/es)',
      'examples': [
        {
          's': 'The team',
          'v': 'wins',
          'rest': 'every match.',
          'mm': 'ထိုအသင်းသည် ပွဲတိုင်းနိုင်လေ့ရှိသည်။',
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Subject-Verb Agreement')),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: MediaQuery.sizeOf(context).width * 0.05,
        ),
        itemCount: rulesData.length,
        itemBuilder: (context, index) {
          final item = rulesData[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['rule'],
                    style:Theme.of(context).textTheme.titleMedium
                  ),
                  const SizedBox(height: 8),
                  Text(item['desc']),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      // color: Theme.of(
                      //   context,
                      // ).colorScheme.inversePrimary,
                        color: Theme.of(
                          context,
                        ).colorScheme.onPrimaryContainer.withAlpha(25),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      item['formula'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimaryContainer
                      ),
                      // style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  const Divider(height: 30),
                  ...(item['examples'] as List).map(
                    (ex) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(
                                  text: ex['s'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.indigo,
                                  ),
                                ),
                                const TextSpan(text: ' '),
                                TextSpan(
                                  text: ex['v'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.redAccent,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                const TextSpan(text: ' '),
                                TextSpan(
                                  text: ex['rest'],
                                  style: const TextStyle(color: Colors.green),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            ex['mm'],
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
                              fontStyle: FontStyle.italic,
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
        },
      ),
    );
  }
}

// Strategic Tip for Learners:
// In the app, you could add a small note: "Remember, if the Noun has an 's' (plural), the Verb usually doesn't. If the Noun doesn't have an 's' (singular), the Verb usually needs one!"
//
// perhaps create a specific practice exercise for Subject-Verb Agreement?
