import 'package:flutter/material.dart';
import 'package:perfect_english/widgets/speak_button.dart';

import 'quiz_lesson_page.dart';

class RelativeClausesScreen extends StatelessWidget {
  const RelativeClausesScreen({super.key});

  final List<Map<String, dynamic>> relativeData = const [
    {
      'pronoun': 'Who',
      'use_for': 'People (လူများအတွက်)',
      'desc': 'လူပုဂ္ဂိုလ်တစ်ဦးကို အထူးပြုလိုသောအခါ သုံးသည်။',
      'examples': [
        {
          'en': 'The man who lives next door is a doctor.',
          'breakdown': 'The man [who lives next door] is a doctor.',
          'mm': 'ဘေးအိမ်မှာနေတဲ့ ထိုလူက ဆရာဝန်တစ်ယောက် ဖြစ်ပါတယ်။',
        },
      ],
    },
    {
      'pronoun': 'Which / That',
      'use_for': 'Things & Animals (အရာဝတ္ထုနှင့် တိရစ္ဆာန်များ)',
      'desc': 'သက်မဲ့ပစ္စည်းများ သို့မဟုတ် တိရစ္ဆာန်များကို ဖော်ပြရန် သုံးသည်။',
      'examples': [
        {
          'en': 'This is the book which I bought yesterday.',
          'breakdown': 'This is the book [which I bought yesterday].',
          'mm': 'ဒါက မနေ့က ကျွန်တော်ဝယ်ခဲ့တဲ့ စာအုပ်ပါ။',
        },
      ],
    },
    {
      'pronoun': 'Whose',
      'use_for': 'Possession (ပိုင်ဆိုင်မှု)',
      'desc': 'ပိုင်ဆိုင်မှုကို ဖော်ပြရန် သုံးသည်။ (...၏ ဟု အဓိပ္ပာယ်ရသည်)',
      'examples': [
        {
          'en': 'I know a girl whose father is a pilot.',
          'breakdown': 'I know a girl [whose father is a pilot].',
          'mm':
              'ဖခင်ဖြစ်သူက လေယာဉ်မှူးဖြစ်တဲ့ မိန်းကလေးတစ်ယောက်ကို ကျွန်တော်သိတယ်။',
        },
      ],
    },
    {
      'pronoun': 'Whom',
      'use_for': 'Object of the Verb (လူ - ကံပုဒ်နေရာ)',
      'desc':
          'ရှေ့က လူပုဂ္ဂိုလ်သည် ဝါကျ၏ ကံပုဒ် (Object) နေရာတွင် ရှိနေလျှင် သုံးသည်။',
      'examples': [
        {
          'en': 'The lady whom you met is my aunt.',
          'breakdown': 'The lady [whom you met] is my aunt.',
          'mm': 'မင်းတွေ့ခဲ့တဲ့ ထိုအမျိုးသမီးက ငါ့ရဲ့အဒေါ်ပါ။',
        },
      ],
    },
    {
      'pronoun': 'Where',
      'use_for': 'Places (နေရာများအတွက်)',
      'desc':
          'နေရာတစ်ခုကို ဖော်ပြသော နာမ်နောက်တွင် သုံးသည်။ အဲဒီနေရာကို အပြည့်စုံရှင်းလင်းရန် အသုံးပြုသည်။',
      'examples': [
        {
          'en': 'This is the place where I was born.',
          'breakdown': 'This is the place [where I was born].',
          'mm': 'ဒီနေရာက ကျွန်တော် မွေးဖွားခဲ့သည့် နေတာရာပါ။',
        },
        {
          'en': 'The restaurant where we had dinner was very expensive.',
          'breakdown':
              'The restaurant [where we had dinner] was very expensive.',
          'mm': 'နော့်ရဲ့ ညစာစားခဲ့ကြတဲ့ အစားအသောက်ဆိုင်က အရမ်းစျေးကြီးတယ်။',
        },
      ],
    },
    {
      'pronoun': 'When',
      'use_for': 'Time (အချိန်များအတွက်)',
      'desc': 'အချိန်ကာလတစ်ခုကို အထူးပြုလိုသောအခါ သုံးသည်။',
      'examples': [
        {
          'en': 'I remember the day when we first met.',
          'breakdown': 'I remember the day [when we first met].',
          'mm': 'ငါတို့စတင်တွေ့ဆုံခဲ့တဲ့နေ့ကို ငါမှတ်မိနေတုန်းပဲ။',
        },
        {
          'en': 'Summer is the season when the weather is hot.',
          'breakdown': 'Summer is the season [when the weather is hot].',
          'mm': 'နွေရာသီဟာ ရာသီဥတုပူတဲ့ အချိန်ဖြစ်ပါတယ်။',
        },
      ],
    },
    {
      'pronoun': 'Why',
      'use_for': 'Reason (အကြောင်းပြချက်)',
      'desc':
          'အကြောင်းပြချက်ကို ရှင်းပြလိုသောအခါ သုံးသည်။ (အများအားဖြင့် "the reason" ၏နောက်တွင် သုံးသည်)',
      'examples': [
        {
          'en': 'Do you know the reason why she is crying?',
          'breakdown': 'Do you know the reason [why she is crying]?',
          'mm': 'သူမ ဘာလို့ငိုနေလဲဆိုတဲ့ အကြောင်းပြချက်ကို မင်းသိလား။',
        },
        {
          'en': 'That is the reason why I am late.',
          'breakdown': 'That is the reason [why I am late].',
          'mm': 'အဲဒါ ကျွန်တော်နောက်ကျရတဲ့ အကြောင်းပြချက်ပါပဲ။',
        },
      ],
    },
  ];

  final List<Map<String, dynamic>> thatClauseData = const [
    {
      'type': 'Relative Clause (Defining)',
      'usage':
          'Used to identify exactly which person or thing we are talking about. Can replace "Who" or "Which".',
      'desc':
          'သတ်မှတ်ချက်အတိအကျဖော်ပြလိုသော ဝါကျငယ်များတွင် Who သို့မဟုတ် Which အစား သုံးနိုင်သည်။',
      'examples': [
        {
          'en': 'The car that I bought is very fast.',
          'breakdown': 'The car [that I bought] is very fast.',
          'mm': 'ကျွန်တော်ဝယ်ခဲ့တဲ့ ကားက အရမ်းမြန်တယ်။',
        },
        {
          'en': 'Where is the girl that sells the flowers?',
          'breakdown': 'Where is the girl [that sells the flowers]?',
          'mm': 'ပန်းရောင်းတဲ့ မိန်းကလေး ဘယ်မှာလဲ။',
        },
      ],
    },
    {
      'type': 'Noun Clause (Reporting)',
      'usage':
          'Used after mental action verbs (think, know, believe, say) to report information.',
      'desc':
          'သိသည်၊ ထင်သည်၊ ပြောသည် စသည့် စိတ်ကူး/ပြောဆိုချက်များကို ဖော်ပြရာတွင် သုံးသည်။',
      'examples': [
        {
          'en': 'I think that it will rain today.',
          'breakdown': 'I think [that it will rain today].',
          'mm': 'ဒီနေ့ မိုးရွာလိမ့်မယ်လို့ ကျွန်တော်ထင်တယ်။',
        },
        {
          'en': 'She said that she was tired.',
          'breakdown': 'She said [that she was tired].',
          'mm': 'သူမ ပင်ပန်းနေတယ်လို့ ပြောခဲ့တယ်။',
        },
      ],
    },
    {
      'type': 'Adjective + That',
      'usage': 'Used after adjectives expressing feelings (happy, sad, sure).',
      'desc':
          'ခံစားချက်ပြ နာမဝိသေသနများနောက်တွင် အကြောင်းရင်းကို ဖော်ပြရန် သုံးသည်။',
      'examples': [
        {
          'en': 'I am happy that you passed the exam.',
          'breakdown': 'I am happy [that you passed the exam].',
          'mm': 'မင်း စာမေးပွဲအောင်တဲ့အတွက် ငါဝမ်းသာပါတယ်။',
        },
        {
          'en': 'Are you sure that he is coming?',
          'breakdown': 'Are you sure [that he is coming]?',
          'mm': 'သူလာမှာ သေချာလို့လား။',
        },
      ],
    },
  ];

  /// Quiz dataset: 20 different questions (4 pronoun types).
  final List<Map<String, dynamic>> relativeQuizzes = const [
    // Who – People (5)
    {
      'q': 'The boy ___ helped me is my cousin.',
      'a': 'who',
      'options': ['who', 'which', 'where', 'whose'],
      'type': 'Who – People',
      'mm': 'ကျွန်တော်ကို ကူညီပေးတဲ့ လက်စုံက အစ်ကိုသားပါ။',
    },
    {
      'q': 'The woman ___ lives upstairs is a teacher.',
      'a': 'who',
      'options': ['who', 'whom', 'where', 'which'],
      'type': 'Who – People',
      'mm': 'အပေါ်အခန်းမှာ နေလောတဲ့ မိန်းကလေးက ဆရာမပါ။',
    },
    {
      'q': 'I met a singer ___ is very famous in Myanmar.',
      'a': 'who',
      'options': ['who', 'which', 'where', 'whose'],
      'type': 'Who – People',
      'mm': 'မြန်မာမှာ အရမ်းနာမည်ကြီးတဲ့ အဆိုရှင်တစ်ယောက်ကို ငါတွေ့ခဲ့တယ်။',
    },
    {
      'q': 'The students ___ joined the club are very active.',
      'a': 'who',
      'options': ['who', 'which', 'where', 'whom'],
      'type': 'Who – People',
      'mm': 'အသင်းထဲက ပါဝင်လာတဲ့ ကျောင်းသူကျောင်းသားတွေဟာ အရမ်း တက်ကြွကြတယ်။',
    },
    {
      'q': 'The doctor ___ treated me was very kind.',
      'a': 'who',
      'options': ['who', 'whom', 'where', 'whose'],
      'type': 'Who – People',
      'mm': 'ကျွန်တော်ကို ဆေးပြုစုပေးတဲ့ ဆရာဝန်က ကြင်နာစိတ်ကြီးတယ်။',
    },

    // Which / That – Things & Animals (5)
    {
      'q': 'This is the book ___ I told you about.',
      'a': 'which',
      'options': ['which', 'who', 'where', 'whose'],
      'type': 'Which / That – Things',
      'mm': 'ဒါက မင်းကို ပြောထားတဲ့ စာအုပ်ပါ။',
    },
    {
      'q': 'The movie ___ we watched last night was exciting.',
      'a': 'which',
      'options': ['which', 'who', 'where', 'whom'],
      'type': 'Which / That – Things',
      'mm':
          'မနေ့ည ကြည့်ခဲ့တဲ့ ဇာတ်ကားက စိတ်အေးမမလောက်အောင် လှုပ်ရှားစိတ်လှုပ်ရှားစေတယ်။',
    },
    {
      'q': 'The dog ___ barks all night is my neighbor’s.',
      'a': 'that',
      'options': ['that', 'which', 'who', 'where'],
      'type': 'Which / That – Animals',
      'mm': 'ညကုန်လောက် အော်နေတဲ့ ခွေးလေးက ချိတ်နီးချိတ်နားက ခွေးပါ။',
    },
    {
      'q': 'The laptop ___ I bought is very fast.',
      'a': 'that',
      'options': ['that', 'who', 'where', 'whose'],
      'type': 'Which / That – Things',
      'mm': 'ကျွန်တော် ဝယ်ခဲ့တဲ့ laptop လေးက အရမ်းလျင်မြန်တယ်။',
    },
    {
      'q': 'This is the car ___ was stolen yesterday.',
      'a': 'that',
      'options': ['that', 'which', 'who', 'where'],
      'type': 'Which / That – Things',
      'mm': 'ဒီကားက မနေ့က ခိုးသွားခဲ့တဲ့ ကားပါ။',
    },

    // Whose – Possession (5)
    {
      'q': 'The man ___ car was stolen is my uncle.',
      'a': 'whose',
      'options': ['whose', 'who', 'which', 'whom'],
      'type': 'Whose – Possession',
      'mm': 'ကားကို ခိုးစားခံရတဲ့ လူကို ငါ့ အယ်ဒါလို့ ခေါ်တယ်။',
    },
    {
      'q': 'I have a friend ___ brother works abroad.',
      'a': 'whose',
      'options': ['whose', 'who', 'which', 'where'],
      'type': 'Whose – Possession',
      'mm': 'ကိုယ်တစ်ယောက်မှာ နိုင်ငံပြင်ပမှာ အလုပ်လုပ်နေတဲ့ အစ်ကိုရှိတယ်။',
    },
    {
      'q': 'She is the girl ___ phone you borrowed.',
      'a': 'whose',
      'options': ['whose', 'who', 'which', 'where'],
      'type': 'Whose – Possession',
      'mm': 'မင်း ခဏချေးယူခဲ့တဲ့ ဖုန်းပိုင်ရှင် မိန်းကလေးက အဲ့ဒီလူပါ။',
    },
    {
      'q': 'Do you know the teacher ___ lessons are very clear?',
      'a': 'whose',
      'options': ['whose', 'who', 'which', 'where'],
      'type': 'Whose – Possession',
      'mm': 'သင်ခန်းစာတွေကို ရှင်းလင်းပြောပြတတ်တဲ့ ဆရာကို မင်းသိလား။',
    },
    {
      'q': 'The artist ___ paintings are on the wall is my friend.',
      'a': 'whose',
      'options': ['whose', 'who', 'which', 'whom'],
      'type': 'Whose – Possession',
      'mm':
          'နံရံပေါ်ကို လှားထားတဲ့ ပန်းချီကားတွေ့ရှိမယ့် ပန်းချီဆရာက ငါ့သူငယ်ချင်းပါ။',
    },

    // Where – Places (5)
    {
      'q': 'This is the house ___ I grew up.',
      'a': 'where',
      'options': ['where', 'which', 'that', 'who'],
      'type': 'Where – Places',
      'mm': 'ဒီအိမ်က ကျွန်တော် ကြီးပြင်းခဲ့တဲ့ အိမ်ပါ။',
    },
    {
      'q': 'Is there a shop ___ I can buy this book?',
      'a': 'where',
      'options': ['where', 'which', 'that', 'who'],
      'type': 'Where – Places',
      'mm': 'ဒီစာအုပ်ကို ဝယ်လို့ရမယ့် ဆိုင် တစ်ခု ရှိသလား။',
    },
    {
      'q': 'The park ___ we usually meet is near my house.',
      'a': 'where',
      'options': ['where', 'which', 'that', 'whom'],
      'type': 'Where – Places',
      'mm': 'ပုံမှန်တွေ့ဆုံကြတဲ့ ပန်းခြံက ငါ့အိမ်နီးနီးမှာ ရှိတယ်။',
    },
    {
      'q': 'Do you remember the restaurant ___ we first met?',
      'a': 'where',
      'options': ['where', 'which', 'that', 'who'],
      'type': 'Where – Places',
      'mm':
          'နောက်ဆုံးအကြ lần က ပထမဆုံး တွေ့ဆုံခဲ့တဲ့ စားသောက်ဆိုင်ကို မင်း သတိရလား။',
    },
    {
      'q': 'The city ___ I was born is very far from here.',
      'a': 'where',
      'options': ['where', 'which', 'that', 'who'],
      'type': 'Where – Places',
      'mm': 'ကျွန်တော် မွေးဖွားခွင့်ရတဲ့ မြို့က ဒီကနေ ဝေးလှပါတယ်။',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Relative Clauses')),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'relative-clauses-quiz',
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizLessonPage(
              quizData: relativeQuizzes,
              tenseTitle: 'Relative Clauses',
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
          _buildQuickReferenceTable(context),
          const SizedBox(height: 20),
          ...relativeData.map((data) => _buildClauseCard(data, context)),

          // --- That Clauses Section ---
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Divider(thickness: 2),
          ),
          Text(
            'Special: "That" Clauses',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          ...thatClauseData.map((data) => _buildThatClauseCard(data, context)),
          _buildHiddenThatTip(context),
        ],
      ),
    );
  }

  Widget _buildQuickReferenceTable(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.onPrimary,
      child: DataTable(
        border: TableBorder.all(borderRadius: BorderRadius.circular(5)),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(5),
        ),
        columns: const [
          DataColumn(
            label: Text(
              'Pronoun',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          DataColumn(
            label: Text(
              'Used for...',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
        rows: const [
          DataRow(cells: [DataCell(Text('Who')), DataCell(Text('People'))]),
          DataRow(
            cells: [
              DataCell(Text('Which/That')),
              DataCell(Text('Things/Animals')),
            ],
          ),
          DataRow(
            cells: [DataCell(Text('Whose')), DataCell(Text('Possession'))],
          ),
          DataRow(cells: [DataCell(Text('Where')), DataCell(Text('Places'))]),
        ],
      ),
    );
  }

  Widget _buildClauseCard(Map<String, dynamic> data, BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.onPrimary,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8,
              runSpacing: 4,
              children: [
                Text(
                  data['pronoun'],
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Chip(
                  label: Text(
                    data['use_for'],
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(data['desc'], style: const TextStyle(fontSize: 14)),
            const Divider(height: 24),
            ...(data['examples'] as List).map(
              (ex) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Full Sentence:",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          ex['en'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SpeakButton(text: ex['en'] ?? ""),
                    ],
                  ),

                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.teal.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        const Text(
                          "Structure Breakdown:",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        _highlightClause(ex['breakdown'], data['pronoun'], context),
                      ],
                    ),
                  ),

                  const SizedBox(height: 8),
                  Text(ex['mm'], style: TextStyle(fontStyle: FontStyle.italic)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _highlightClause(String text, String pronoun, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimaryContainer.withAlpha(25),
        borderRadius: BorderRadius.circular(4),
      ),
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
          children: [
            TextSpan(text: text.split('[')[0]),
            TextSpan(
              text: '[${text.split('[')[1].split(']')[0]}]',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(text: text.split(']')[1]),
          ],
        ),
      ),
    );
  }

  Widget _buildThatClauseCard(Map<String, dynamic> data, BuildContext context) {
    final accentColor = Colors.teal.shade700;

    return Card(
      color: Theme.of(context).colorScheme.onPrimary,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.layers_outlined, color: accentColor, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    data['type'],
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              data['usage'],
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            Text(
              data['desc'],
              style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
            ),
            const Divider(height: 32),
            ...(data['examples'] as List).map((ex) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
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
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ),
                        SpeakButton(text: ex['en'] ?? ""),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Breakdown Box
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.teal.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Clause Structure:",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 4),
                          _highlightClause(ex['breakdown'], 'that', context),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      ex['mm'],
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildHiddenThatTip(BuildContext context) {
    return Card(
      color: Theme
          .of(context)
          .colorScheme
          .onPrimary,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.lightbulb, color: Colors.amber.shade900),
                const SizedBox(width: 8),
                const Text(
                  "Pro Tip: Hidden 'That'",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              "In spoken English, we often remove 'that'. \nEx: 'I think (that) he is nice.'",
              style: TextStyle(fontSize: 13, height: 1.4),
            ),
          ],
        ),
      ),
    );
  }
}
