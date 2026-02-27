import 'package:flutter/material.dart';

import 'quiz_lesson_page.dart';
// Ensure this import matches your actual file path
// import 'tense_quiz_lesson_page.dart';

class SubjectVerbAgreementScreen extends StatelessWidget {
  const SubjectVerbAgreementScreen({super.key});

  // 1. Separate Lesson Rules from Quizzes
  final List<Map<String, dynamic>> rulesData = const [
    {
      'title': 'Rule 1: Singular Subject',
      'usage':
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
      'title': 'Rule 2: Plural Subject',
      'usage':
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
      'title': 'Rule 3: Compound Subjects (And)',
      'usage':
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
      'title': 'Rule 4: Collective Nouns',
      'usage':
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

  // 2. Extracted Quiz Data for cleaner navigation
  final List<Map<String, dynamic>> sivaQuizzes = const [
    {
      'q': 'The quality of these products ___ (be) very high.',
      'a': 'is',
      'options': ['is', 'are', 'be'],
      'type': 'Prepositional Phrase',
      'mm': 'ဒီထုတ်ကုန်တွေရဲ့ အရည်အသွေးက တကယ်ကို မြင့်မားပါတယ်။',
    },
    {
      'q':
          'Neither the manager nor the employees ___ (be) happy about the new schedule.',
      'a': 'are',
      'options': ['is', 'are', 'was'],
      'type': 'Neither/Nor',
      'mm': 'မန်နေဂျာရော ဝန်ထမ်းတွေပါ အချိန်ဇယားအသစ်ကို သဘောမကျကြဘူး။',
    },
    {
      'q': 'Either my sister or my brother ___ (be) coming to pick me up.',
      'a': 'is',
      'options': ['is', 'are', 'am'],
      'type': 'Either/Or',
      'mm':
          'ကျွန်တော့်အစ်မ ဒါမှမဟုတ် အစ်ကို၊ တစ်ယောက်ယောက်က ကျွန်တော့်ကို လာကြိုလိမ့်မယ်။',
    },
    {
      'q': 'The news about the economy ___ (seem) very depressing.',
      'a': 'seems',
      'options': ['seem', 'seems', 'seeming'],
      'type': 'Uncountable',
      'mm':
          'စီးပွားရေးနဲ့ပတ်သက်တဲ့ သတင်းတွေက တော်တော်လေး စိတ်ပျက်ဖို့ကောင်းပုံရတယ်။',
    },
    {
      'q': 'A number of students ___ (have) already registered for the course.',
      'a': 'have',
      'options': ['has', 'have', 'having'],
      'type': 'A Number Of',
      'mm': 'ကျောင်းသားအတော်များများ သင်တန်းအတွက် စာရင်းပေးပြီးကြပြီ။',
    },
    {
      'q': 'None of the information ___ (be) correct.',
      'a': 'is',
      'options': ['is', 'are', 'were'],
      'type': 'None',
      'mm': 'ဒီအချက်အလက်တွေထဲက ဘာမှ မမှန်ကန်ဘူး။',
    },
    {
      'q': 'None of the students ___ (have) finished their exams yet.',
      'a': 'have',
      'options': ['has', 'have', 'having'],
      'type': 'None',
      'mm': 'ကျောင်းသားတစ်ယောက်မှ သူတို့စာမေးပွဲ မပြီးသေးဘူး။',
    },
    {
      'q': 'Each of the players ___ (receive) a gold medal.',
      'a': 'receives',
      'options': ['receive', 'receives', 'receiving'],
      'type': 'Each',
      'mm': 'ကစားသမားတိုင်း ရွှေတံဆိပ် တစ်ခုစီ ရရှိကြတယ်။',
    },
    {
      'q': 'Every one of the houses ___ (be) painted white.',
      'a': 'is',
      'options': ['is', 'are', 'were'],
      'type': 'Every',
      'mm': 'အိမ်တိုင်းကို အဖြူရောင် ဆေးသုတ်ထားတယ်။',
    },
    {
      'q': 'The jury ___ (be) still debating the verdict.',
      'a': 'is',
      'options': ['is', 'are', 'am'],
      'type': 'Collective Noun',
      'mm': 'ဂျူရီအဖွဲ့က စီရင်ချက်အတွက် ဆွေးနွေးနေတုန်းပဲ။',
    },
    {
      'q':
          'Not only the students but also the teacher ___ (agree) with the plan.',
      'a': 'agrees',
      'options': ['agree', 'agrees', 'agreeing'],
      'type': 'Not Only/But Also',
      'mm': 'ကျောင်းသားတွေတင်မကဘူး၊ ဆရာကိုယ်တိုင်လည်း ဒီအစီအစဉ်ကို သဘောတူတယ်။',
    },
    {
      'q': 'The CEO, along with his assistants, ___ (be) attending the gala.',
      'a': 'is',
      'options': ['is', 'are', 'were'],
      'type': 'Intervening Phrase',
      'mm': 'CEO က သူ့ရဲ့လက်ထောက်တွေနဲ့အတူ ပွဲကို တက်ရောက်နေပါတယ်။',
    },
    {
      'q': 'Politics ___ (be) a very controversial topic.',
      'a': 'is',
      'options': ['is', 'are', 'am'],
      'type': 'Nouns ending in S',
      'mm': 'နိုင်ငံရေးက အငြင်းပွားစရာ အကြောင်းအရာတစ်ခု ဖြစ်ပါတယ်။',
    },
    {
      'q': 'Two thousand dollars ___ (be) a lot of money to lose.',
      'a': 'is',
      'options': ['is', 'are', 'am'],
      'type': 'Money/Measurement',
      'mm': 'ဒေါ်လာနှစ်ထောင်ဆိုတာ ဆုံးရှုံးဖို့အတွက် ပမာဏအများကြီးပါ။',
    },
    {
      'q': 'There ___ (be) a list of names on the desk.',
      'a': 'is',
      'options': ['is', 'are', 'am'],
      'type': 'There is/are',
      'mm': 'စားပွဲပေါ်မှာ နာမည်စာရင်းတစ်ခု ရှိနေတယ်။',
    },
    {
      'q': 'She is one of those women who ___ (know) everything.',
      'a': 'know',
      'options': ['know', 'knows', 'knowing'],
      'type': 'Relative Clause',
      'mm': 'သူမက အရာအားလုံးကို သိတယ်ဆိုတဲ့ အမျိုးသမီးတွေထဲက တစ်ယောက်ပါ။',
    },
    {
      'q': 'The scissors ___ (be) on the table.',
      'a': 'are',
      'options': ['is', 'are', 'was'],
      'type': 'Paired Nouns',
      'mm': 'ကပ်ကြေးက စားပွဲပေါ်မှာ ရှိပါတယ်။',
    },
    {
      'q': 'Neither of the options ___ (look) good to me.',
      'a': 'looks',
      'options': ['look', 'looks', 'looking'],
      'type': 'Neither (Singular)',
      'mm': 'ဒီရွေးချယ်စရာ နှစ်ခုလုံးက ကျွန်တော့်အတွက် အဆင်မပြေပုံရတယ်။',
    },
    {
      'q': 'Economics ___ (interest) many modern students.',
      'a': 'interests',
      'options': ['interest', 'interests', 'interesting'],
      'type': 'Subject Name',
      'mm':
          'စီးပွားရေးပညာက ခေတ်သစ်ကျောင်းသား အတော်များများကို စိတ်ဝင်စားစေပါတယ်။',
    },
    {
      'q': 'Ten years ___ (be) a long time to wait for someone.',
      'a': 'is',
      'options': ['is', 'are', 'am'],
      'type': 'Time Unit',
      'mm':
          'ဆယ်နှစ်ဆိုတာ တစ်စုံတစ်ယောက်ကို စောင့်ဖို့ တော်တော်ကြာတဲ့ အချိန်ပါ။',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Subject-Verb Agreement'), elevation: 0),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: "Subject-Verb-Agreement",
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizLessonPage(
              quizData: sivaQuizzes,
              tenseTitle: 'Subject-Verb Agreement',
            ),
          ),
        ),
        label: const Text("Take a Quiz"),
        icon: const Icon(Icons.play_arrow),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: MediaQuery.sizeOf(context).width * 0.05,
        ),
        itemCount: rulesData.length,
        itemBuilder: (context, index) {
          final item = rulesData[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item['title'], style: textTheme.titleMedium),
                  const SizedBox(height: 10),
                  Text(item['usage'], style: textTheme.bodyMedium),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: colorScheme.onPrimaryContainer.withAlpha(25),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: colorScheme.primary.withAlpha(30),
                      ),
                    ),
                    child: Text(
                      item['formula'],
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Divider(),
                  ),
                  // Render Examples using Theme-based styling
                  ...(item['examples'] as List).map(
                    (ex) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: textTheme.bodyLarge?.copyWith(
                                color: colorScheme.onSurface,
                              ),
                              children: [
                                TextSpan(
                                  text: ex['s'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: colorScheme.secondary,
                                  ),
                                ),
                                const TextSpan(text: ' '),
                                TextSpan(
                                  text: ex['v'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: colorScheme.error,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                const TextSpan(text: ' '),
                                TextSpan(
                                  text: ex['rest'],
                                  style: TextStyle(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            ex['mm'],
                            style: textTheme.bodySmall?.copyWith(
                              fontStyle: FontStyle.italic,
                              color: colorScheme.outline,
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
