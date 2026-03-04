import 'package:flutter/material.dart';

import 'quiz_lesson_page.dart';

class ArticlesDetailScreen extends StatelessWidget {
  const ArticlesDetailScreen({super.key});

  final List<Map<String, dynamic>> articleRules = const [
    {
      'title': 'Indefinite Article: "A"',
      'usage':
          'ဗျည်းသံ (Consonant sound) ဖြင့်စသော နာမ်များရှေ့တွင် သုံးသည်။ (သတ်မှတ်မထားသော အရာတစ်ခု)',
      'formula': 'A + Consonant Sound',
      'examples': [
        {
          'word': 'A doctor',
          'sentence': 'I want to be a doctor.',
          'mm': 'ကျွန်တော် ဆရာဝန်တစ်ယောက် ဖြစ်ချင်တယ်။',
        },
        {
          'word': 'A university',
          'sentence': 'She studies at a university.',
          'mm':
              'သူမ တက္ကသိုလ်တစ်ခုမှာ ပညာသင်ကြားနေတယ်။ (U သည် ဗျည်းသံ "Y" ထွက်သဖြင့် A သုံးသည်)',
        },
      ],
    },
    {
      'title': 'Indefinite Article: "An"',
      'usage':
          'သရသံ (Vowel sound - a, e, i, o, u) ဖြင့်စသော နာမ်များရှေ့တွင် သုံးသည်။',
      'formula': 'An + Vowel Sound',
      'examples': [
        {
          'word': 'An apple',
          'sentence': 'He is eating an apple.',
          'mm': 'သူ ပန်းသီးတစ်လုံး စားနေတယ်။',
        },
        {
          'word': 'An hour',
          'sentence': 'I will wait for an hour.',
          'mm':
              'ကျွန်တော် တစ်နာရီကြာအောင် စောင့်ပါ့မယ်။ (H သည် အသံမထွက်ဘဲ Vowel သံထွက်သဖြင့် An သုံးသည်)',
        },
      ],
    },
    {
      'title': 'Definite Article: "The"',
      'usage':
          'သတ်သတ်မှတ်မှတ်ရှိသော အရာများ၊ ကမ္ဘာပေါ်တွင် တစ်ခုတည်းရှိသောအရာများရှေ့တွင် သုံးသည်။',
      'formula': 'The + Specific Noun',
      'examples': [
        {
          'word': 'The Sun',
          'sentence': 'The sun is very hot.',
          'mm': 'နေသည် အလွန်ပူပြင်းသည်။',
        },
        {
          'word': 'The book',
          'sentence': 'The book on the table is mine.',
          'mm': 'စားပွဲပေါ်က ထိုစာအုပ်က ကျွန်တော့်စာအုပ်ပါ။',
        },
      ],
    },
  ];

  final List<Map<String, dynamic>> articleQuizzes = const [
    // --- Basic Indefinite (A / An) ---
    {
      'q': 'My father is ___ honest man.',
      'a': 'an',
      'options': ['a', 'an', 'the'],
      'type': 'Vowel Sound',
      'mm':
          'ကျွန်တော့်ဖခင်ဟာ ရိုးသားတဲ့ လူတစ်ယောက်ပါ။ (H သံမထွက်ဘဲ Vowel သံထွက်သဖြင့် An သုံးသည်)',
    },
    {
      'q': 'She wants to buy ___ expensive smartphone.',
      'a': 'an',
      'options': ['a', 'an', 'the'],
      'type': 'Vowel Sound',
      'mm': 'သူမ ဈေးကြီးတဲ့ စမတ်ဖုန်းတစ်လုံး ဝယ်ချင်နေတယ်။',
    },
    {
      'q': 'It takes ___ unit of energy to complete the task.',
      'a': 'a',
      'options': ['a', 'an', 'the'],
      'type': 'Consonant Sound',
      'mm':
          'ဒီအလုပ်ပြီးဖို့ စွမ်းအင်တစ်ယူနစ် လိုအပ်ပါတယ်။ (Unit သည် "Y" ဗျည်းသံထွက်သဖြင့် A သုံးသည်)',
    },
    {
      'q': 'I saw ___ European tourist at the pagoda.',
      'a': 'a',
      'options': ['a', 'an', 'the'],
      'type': 'Consonant Sound',
      'mm':
          'ဘုရားမှာ ဥရောပတိုက်သား ကမ္ဘာလှည့်ခရီးသည်တစ်ဦးကို ကျွန်တော်တွေ့ခဲ့တယ်။',
    },
    {
      'q': 'Could you give me ___ umbrella? It’s raining.',
      'a': 'an',
      'options': ['a', 'an', 'the'],
      'type': 'Vowel Sound',
      'mm': 'ကျွန်တော့်ကို ထီးတစ်လက်လောက် ပေးလို့ရမလား။ မိုးရွာနေလို့ပါ။',
    },

    // --- Specific vs. General (The vs. A/An) ---
    {
      'q': 'I bought a shirt and a hat. ___ hat is blue.',
      'a': 'The',
      'options': ['A', 'An', 'The'],
      'type': 'Specific Reference',
      'mm':
          'ကျွန်တော် အင်္ကျီတစ်ထည်နဲ့ ဦးထုပ်တစ်လုံး ဝယ်ခဲ့တယ်။ အဲ့ဒီဦးထုပ်က အပြာရောင်ပါ။',
    },
    {
      'q': 'Look at ___ moon! It is so bright tonight.',
      'a': 'the',
      'options': ['a', 'an', 'the'],
      'type': 'Unique Object',
      'mm': 'လကို ကြည့်လိုက်ဦး။ ဒီည လက အရမ်းသာနေတယ်။',
    },
    {
      'q': 'Who is ___ best student in your class?',
      'a': 'the',
      'options': ['a', 'an', 'the'],
      'type': 'Superlative',
      'mm': 'မင်းအတန်းထဲမှာ အတော်ဆုံးကျောင်းသားက ဘယ်သူလဲ။',
    },
    {
      'q': 'I have ___ uncle who lives in New York.',
      'a': 'an',
      'options': ['a', 'an', 'the'],
      'type': 'General Reference',
      'mm': 'ကျွန်တော့်မှာ New York မှာနေတဲ့ ဦးလေးတစ်ယောက်ရှိတယ်။',
    },
    {
      'q': 'Can you pass me ___ salt, please?',
      'a': 'the',
      'options': ['a', 'an', 'the'],
      'type': 'Specific Context',
      'mm': 'ဆား (စားပွဲပေါ်ရှိသတ်မှတ်ထားသောဆား) လောက် ပေးလို့ရမလား။',
    },

    // --- Advanced (Geographic & Special Rules) ---
    {
      'q': '___ Nile is the longest river in the world.',
      'a': 'The',
      'options': ['A', 'An', 'The'],
      'type': 'Geographic',
      'mm':
          'နိုင်းမြစ်ဟာ ကမ္ဘာ့အရှည်ဆုံးမြစ်ဖြစ်ပါတယ်။ (မြစ်အမည်များရှေ့တွင် The သုံးသည်)',
    },
    {
      'q': 'He plays ___ guitar very well.',
      'a': 'the',
      'options': ['a', 'an', 'the'],
      'type': 'Musical Instrument',
      'mm': 'သူ ဂစ်တာကို အရမ်းကောင်းကောင်း တီးတတ်တယ်။',
    },
    {
      'q': 'I am going to ___ United Kingdom next summer.',
      'a': 'the',
      'options': ['a', 'an', 'the'],
      'type': 'Country Name',
      'mm':
          'လာမယ့်နွေရာသီမှာ ကျွန်တော် ယူကေကို သွားမယ်။ (နိုင်ငံအမည်တွင် United ပါလျှင် The သုံးသည်)',
    },
    {
      'q': 'Mount Everest is ___ highest mountain in the world.',
      'a': 'the',
      'options': ['a', 'an', 'the'],
      'type': 'Superlative',
      'mm': 'ဧဝရက်တောင်ဟာ ကမ္ဘာ့အမြင့်ဆုံးတောင် ဖြစ်ပါတယ်။',
    },
    {
      'q': 'We had ___ lunch at a small cafe.',
      'a': 'no article',
      'options': ['a', 'the', 'no article'],
      'type': 'Meals',
      'mm':
          'ကျွန်တော်တို့ ကဖေးအသေးလေးတစ်ခုမှာ နေ့လယ်စာ စားခဲ့ကြတယ်။ (အစားအစာများရှေ့တွင် ပုံမှန်အားဖြင့် article မသုံးပါ)',
    },

    // --- Tricky / Expert Level ---
    {
      'q': 'My brother is ___ MBA student.',
      'a': 'an',
      'options': ['a', 'an', 'the'],
      'type': 'Abbreviation',
      'mm':
          'ကျွန်တော့်အစ်ကိုက MBA ကျောင်းသားတစ်ယောက်ပါ။ (M သည် "Em" ဟု အသံထွက်သဖြင့် Vowel သံဖြစ်သည်)',
    },
    {
      'q': '___ Himalayas are located in Asia.',
      'a': 'The',
      'options': ['A', 'An', 'The'],
      'type': 'Mountain Ranges',
      'mm':
          'ဟိမဝန္တာတောင်တန်းတွေက အာရှမှာ တည်ရှိပါတယ်။ (တောင်တန်းများရှေ့တွင် The သုံးသည်)',
    },
    {
      'q': 'Do you have ___ one-dollar bill?',
      'a': 'a',
      'options': ['a', 'an', 'the'],
      'type': 'Consonant Sound',
      'mm':
          'မင်းဆီမှာ တစ်ဒေါ်လာတန် တစ်ရွက် ရှိသလား။ (One သည် "W" သံထွက်သဖြင့် A သုံးသည်)',
    },
    {
      'q': 'I love listening to ___ music.',
      'a': 'no article',
      'options': ['a', 'an', 'no article'],
      'type': 'Abstract Noun',
      'mm': 'ကျွန်တော် သီချင်းနားထောင်ရတာ ဝါသနာပါတယ်။',
    },
    {
      'q': '___ Earth moves around the Sun.',
      'a': 'The',
      'options': ['A', 'An', 'The'],
      'type': 'Unique Object',
      'mm': 'ကမ္ဘာကြီးက နေကို ပတ်ပြီး လည်ပတ်နေပါတယ်။',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Articles (A, An, The)')),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: "articles-tag",
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizLessonPage(
              quizData: articleQuizzes,
              tenseTitle: 'Articles (A, An, The, ...)',
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
        itemCount: articleRules.length,
        itemBuilder: (context, index) {
          final rule = articleRules[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            color: Theme.of(context).colorScheme.onPrimary,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    rule['title'],
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: _getColor(colorScheme, index),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    rule['usage'],
                    style: textTheme.bodyMedium?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.onPrimaryContainer.withAlpha(25),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      rule['formula'],
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'monospace',
                        color: colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...(rule['examples'] as List).map(
                    (ex) => Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ex['word'],
                            style: textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.secondary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          _buildHighlightedExample(
                            context,
                            ex['sentence'],
                            ex['word'].split(' ')[0],
                          ),
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

  Color _getColor(ColorScheme colorScheme, int index) {
    final List<Color> colors = [
      colorScheme.primary,
      colorScheme.secondary,
      colorScheme.tertiary,
    ];
    return colors[index % colors.length];
  }

  Widget _buildHighlightedExample(
    BuildContext context,
    String sentence,
    String article,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    List<String> words = sentence.split(' ');
    return RichText(
      text: TextSpan(
        style: textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurface,
          fontSize: 15,
        ),
        children: words.map((word) {
          bool isArticle = word.toLowerCase() == article.toLowerCase();
          return TextSpan(
            text: '$word ',
            style: TextStyle(
              fontWeight: isArticle ? FontWeight.bold : FontWeight.normal,
              color: isArticle ? colorScheme.error : colorScheme.secondary,
              backgroundColor: isArticle
                  ? colorScheme.errorContainer.withAlpha(40)
                  : Colors.transparent,
            ),
          );
        }).toList(),
      ),
    );
  }
}
