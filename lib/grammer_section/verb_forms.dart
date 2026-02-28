import 'package:flutter/material.dart';
import 'package:perfect_english/grammer_section/quiz_lesson_page.dart';

/// Dataset: Summary table of verb examples (V1–V5) for quick comparison.
final List<Map<String, dynamic>> verbExamples = const [
  {
    'v1': 'Go',
    'v2': 'Went',
    'v3': 'Gone',
    'v4': 'Going',
    'v5': 'Goes',
    'isRegular': false,
  },
  {
    'v1': 'Eat',
    'v2': 'Ate',
    'v3': 'Eaten',
    'v4': 'Eating',
    'v5': 'Eats',
    'isRegular': false,
  },
  {
    'v1': 'Study',
    'v2': 'Studied',
    'v3': 'Studied',
    'v4': 'Studying',
    'v5': 'Studies',
    'isRegular': true,
  },
  {
    'v1': 'Take',
    'v2': 'Took',
    'v3': 'Taken',
    'v4': 'Taking',
    'v5': 'Takes',
    'isRegular': false,
  },
  {
    'v1': 'Speak',
    'v2': 'Spoke',
    'v3': 'Spoken',
    'v4': 'Speaking',
    'v5': 'Speaks',
    'isRegular': false,
  },
  {
    'v1': 'Work',
    'v2': 'Worked',
    'v3': 'Worked',
    'v4': 'Working',
    'v5': 'Works',
    'isRegular': true,
  },
  {
    'v1': 'Begin',
    'v2': 'Began',
    'v3': 'Begun',
    'v4': 'Beginning',
    'v5': 'Begins',
    'isRegular': false,
  },
  {
    'v1': 'Bring',
    'v2': 'Brought',
    'v3': 'Brought',
    'v4': 'Bringing',
    'v5': 'Brings',
    'isRegular': false,
  },
];

/// Dataset: The five verb forms – title, usage (en/mm), formula, examples.
final List<Map<String, dynamic>> fiveFormsSections = const [
  {
    'title': 'V1: Base Form (Infinitive)',
    'usage':
        'Present simple (except third person) and after modal verbs. ပစ္စုပ္ပန်ရိုးရိုး (တတိယလူတစ်ဦးတည်းမှလွဲ၍) နှင့် modal ကြိယာနောက်တွင် သုံးသည်။',
    'formula': 'V1 (no change)',
    'examples': [
      {'en': 'go', 'mm': 'သွားသည်'},
      {'en': 'speak', 'mm': 'ပြောသည်'},
      {'en': 'eat', 'mm': 'စားသည်'},
    ],
  },
  {
    'title': 'V5: Third-Person Singular Present (-s/-es)',
    'usage':
        'Add -s or -es to base for present simple (he/she/it). ပစ္စုပ္ပန်ရိုးရိုးတွင် တတိယလူတစ်ဦး (he/she/it) အတွက် base ကို -s/-es ပေါင်းသည်။',
    'formula': 'V1 + s/es',
    'examples': [
      {'en': 'goes', 'mm': 'သွားသည် (သူ)'},
      {'en': 'speaks', 'mm': 'ပြောသည် (သူ)'},
      {'en': 'studies', 'mm': 'သင်ယူသည် (သူ)'},
    ],
  },
  {
    'title': 'V2: Past Simple',
    'usage':
        'Actions completed in the past. Regular: V1 + -ed. Irregular: memorized. အတိတ်က ပြီးစီးခဲ့သော လုပ်ဆောင်ချက်။ ပုံမှန် -ed ပေါင်းသည်။ ပုံမမှန် အတိအကျ မှတ်သားရသည်။',
    'formula': 'V2 (regular: V1+ed / irregular: varies)',
    'examples': [
      {'en': 'played (regular)', 'mm': 'ကစားခဲ့သည်'},
      {'en': 'went, spoke (irregular)', 'mm': 'သွားခဲ့သည်၊ ပြောခဲ့သည်'},
    ],
  },
  {
    'title': 'V4: Present Participle / Gerund (-ing)',
    'usage':
        'Continuous tenses and as a noun (gerund). ပြုပြင်နေဆဲ ကာလများနှင့် နာမ်အဖြစ် (-ing) သုံးသည်။',
    'formula': 'V1 + ing',
    'examples': [
      {'en': 'going', 'mm': 'သွားနေသည်'},
      {'en': 'speaking', 'mm': 'ပြောနေသည်'},
      {'en': 'eating', 'mm': 'စားနေသည်'},
    ],
  },
  {
    'title': 'V3: Past Participle',
    'usage':
        'Perfect tenses and passive voice. Often -ed or irregular form. ပြီးစီးမှုကာလနှင့် ကံကြိယာ ပုံစံများတွင် သုံးသည်။ များသောအားဖြင့် -ed သို့မဟုတ် ပုံမမှန် ပုံစံ။',
    'formula': 'V3 (regular: V1+ed / irregular: varies)',
    'examples': [
      {'en': 'gone', 'mm': 'သွားပြီး'},
      {'en': 'spoken', 'mm': 'ပြောပြီး'},
      {'en': 'eaten', 'mm': 'စားပြီး'},
    ],
  },
];

/// Dataset: Regular vs Irregular explanation and examples.
final List<Map<String, dynamic>> regularVsIrregularData = const [
  {
    'title': 'Regular Verbs',
    'usage':
        'Follow a predictable pattern: V2 and V3 are the same (V1 + -ed). ပုံမှန်ပုံစံအတိုင်း V2 နှင့် V3 တူသည် (V1 + -ed)।',
    'examples': [
      {'v1': 'work', 'v2': 'worked', 'v3': 'worked'},
      {'v1': 'play', 'v2': 'played', 'v3': 'played'},
      {'v1': 'study', 'v2': 'studied', 'v3': 'studied'},
    ],
  },
  {
    'title': 'Irregular Verbs',
    'usage':
        'Do not follow standard rules; must be memorized. ပုံမှန်စည်းမျဉ်းမဟုတ်၊ မှတ်သားရသည်။',
    'examples': [
      {'v1': 'begin', 'v2': 'began', 'v3': 'begun'},
      {'v1': 'bring', 'v2': 'brought', 'v3': 'brought'},
      {'v1': 'go', 'v2': 'went', 'v3': 'gone'},
    ],
  },
];

/// Quiz dataset: 20 questions on verb forms (V1–V5, regular/irregular).
final List<Map<String, dynamic>> verbFormsQuizzes = const [
  {
    'q': 'The past simple (V2) of "go" is ___.',
    'a': 'went',
    'options': ['went', 'gone', 'going', 'goes'],
    'type': 'V2 Past',
    'mm': '"go" ရဲ့ အတိတ်ရိုးရိုး (V2) က ဘာလဲ။',
  },
  {
    'q': 'The past participle (V3) of "eat" is ___.',
    'a': 'eaten',
    'options': ['ate', 'eaten', 'eating', 'eats'],
    'type': 'V3 Past Participle',
    'mm': '"eat" ရဲ့ past participle (V3) က ဘာလဲ။',
  },
  {
    'q': 'She ___ to school every day. (V5: third person)',
    'a': 'goes',
    'options': ['go', 'goes', 'going', 'gone'],
    'type': 'V5 Third Person',
    'mm': 'သူမ နေ့တိုင်း ကျောင်းသွားသည်။ (တတိယလူတစ်ဦး V5)',
  },
  {
    'q': 'They have ___ the work. (V3)',
    'a': 'done',
    'options': ['did', 'done', 'doing', 'does'],
    'type': 'V3 Perfect',
    'mm': 'သူတို့ အလုပ်ကို ပြီးစီးပြီး။ (V3)',
  },
  {
    'q': 'The past simple (V2) of "write" is ___.',
    'a': 'wrote',
    'options': ['wrote', 'written', 'writing', 'writes'],
    'type': 'V2 Past',
    'mm': '"write" ရဲ့ အတိတ်ရိုးရိုး (V2) က ဘာလဲ။',
  },
  {
    'q': 'He is ___ a letter now. (V4: -ing)',
    'a': 'writing',
    'options': ['write', 'wrote', 'written', 'writing'],
    'type': 'V4 Present Participle',
    'mm': 'သူ စာတစ်စောင် ရေးနေသည်။ (V4 -ing)',
  },
  {
    'q': 'The past participle (V3) of "speak" is ___.',
    'a': 'spoken',
    'options': ['spoke', 'spoken', 'speaking', 'speaks'],
    'type': 'V3 Past Participle',
    'mm': '"speak" ရဲ့ past participle (V3) က ဘာလဲ။',
  },
  {
    'q': 'We ___ football yesterday. (V2)',
    'a': 'played',
    'options': ['play', 'played', 'playing', 'plays'],
    'type': 'V2 Regular',
    'mm': 'မနေ့က ကျွန်တော်တို့ ဘောလုံးကစားခဲ့သည်။',
  },
  {
    'q': 'The third person (V5) of "study" is ___.',
    'a': 'studies',
    'options': ['study', 'studied', 'studies', 'studying'],
    'type': 'V5 Third Person',
    'mm': '"study" ရဲ့ တတိယလူတစ်ဦး (V5) က ဘာလဲ။',
  },
  {
    'q': 'She has ___ her homework. (V3 of "finish")',
    'a': 'finished',
    'options': ['finish', 'finished', 'finishing', 'finishes'],
    'type': 'V3 Regular',
    'mm': 'သူမ အိမ်စာပြီးပြီ။ (ပုံမှန် V3)',
  },
  {
    'q': 'The past simple (V2) of "begin" is ___.',
    'a': 'began',
    'options': ['begin', 'began', 'begun', 'beginning'],
    'type': 'V2 Irregular',
    'mm': '"begin" ရဲ့ အတိတ်ရိုးရိုး (V2) က ဘာလဲ။',
  },
  {
    'q': 'They were ___ when I arrived. (V4 of "sleep")',
    'a': 'sleeping',
    'options': ['sleep', 'slept', 'sleeping', 'sleeps'],
    'type': 'V4 Continuous',
    'mm': 'ကျွန်တော် ရောက်တဲ့အခါ သူတို့ အိပ်နေကြတယ်။',
  },
  {
    'q': 'The past participle (V3) of "take" is ___.',
    'a': 'taken',
    'options': ['take', 'took', 'taken', 'taking'],
    'type': 'V3 Irregular',
    'mm': '"take" ရဲ့ past participle (V3) က ဘာလဲ။',
  },
  {
    'q': 'My brother ___ English at university. (V5)',
    'a': 'teaches',
    'options': ['teach', 'taught', 'teaches', 'teaching'],
    'type': 'V5 Third Person',
    'mm': 'ကျွန်တော့်အစ်ကို တက္ကသိုလ်မှာ အင်္ဂလိပ်စာသင်တယ်။',
  },
  {
    'q': 'The past simple (V2) of "bring" is ___.',
    'a': 'brought',
    'options': ['bring', 'brought', 'bringing', 'brings'],
    'type': 'V2 Irregular',
    'mm': '"bring" ရဲ့ အတိတ်ရိုးရိုး (V2) က ဘာလဲ။',
  },
  {
    'q': 'I have ___ the book. (V3 of "read")',
    'a': 'read',
    'options': ['read', 'reads', 'reading', 'readed'],
    'type': 'V3 Same Form',
    'mm': '"read" ရဲ့ V3 က V1 နဲ့ ပုံစံတူသည် (အသံထွက်ကွဲသည်)။',
  },
  {
    'q': 'She ___ to the market every morning. (V5 of "go")',
    'a': 'goes',
    'options': ['go', 'went', 'goes', 'going'],
    'type': 'V5 Third Person',
    'mm': 'သူမ မနက်တိုင်း ဈေးသွားသည်။',
  },
  {
    'q': 'The present participle (V4) of "run" is ___.',
    'a': 'running',
    'options': ['run', 'ran', 'running', 'runs'],
    'type': 'V4 -ing',
    'mm': '"run" ရဲ့ present participle (V4) က ဘာလဲ။',
  },
  {
    'q': 'They had ___ the door before we came. (V3 of "close")',
    'a': 'closed',
    'options': ['close', 'closed', 'closing', 'closes'],
    'type': 'V3 Regular',
    'mm': 'ကျွန်တော်တို့ မရောက်မီ သူတို့ ပြီးပြီး ပိတ်ထားပြီးပြီ။',
  },
  {
    'q': 'The past simple (V2) of "think" is ___.',
    'a': 'thought',
    'options': ['think', 'thought', 'thinking', 'thinks'],
    'type': 'V2 Irregular',
    'mm': '"think" ရဲ့ အတိတ်ရိုးရိုး (V2) က ဘာလဲ။',
  },
];

class VerbFormsScreen extends StatelessWidget {
  const VerbFormsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Verb Forms (ကြိယာပုံစံများ)',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'verb-forms-quiz',
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizLessonPage(
              quizData: verbFormsQuizzes,
              tenseTitle: 'Verb Forms (ကြိယာပုံစံများ)',
            ),
          ),
        ),
        label: const Text('Take A Quiz'),
        icon: const Icon(Icons.quiz),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: MediaQuery.sizeOf(context).width * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildIntroCard(context),
            const SizedBox(height: 20),
            _buildTakeQuizCard(context),
            const SizedBox(height: 20),
            _buildSectionTitle(context, 'The Five English Verb Forms'),
            const SizedBox(height: 12),
            ...fiveFormsSections.map(
              (section) => _buildFormCard(context, section),
            ),
            const SizedBox(height: 24),
            _buildSectionTitle(context, 'Regular vs Irregular Verbs'),
            const SizedBox(height: 12),
            ...regularVsIrregularData.map(
              (e) => _buildRegularIrregularCard(context, e),
            ),
            const SizedBox(height: 24),
            _buildSectionTitle(context, 'Summary Table of Examples'),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                'Quick comparison for learners. သင်ယူသူများ မြန်မြန် နှိုင်းယှဉ်ကြည့်ရန်။',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade600,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            _buildSummaryTable(context),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildIntroCard(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.onPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade800),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'English verbs have five main forms used to show tense, number, and mood: '
              'base (speak), -s/es (speaks), past tense (spoke), present participle/gerund (speaking), '
              'and past participle (spoken). These are crucial for simple present, past, continuous, and perfect tenses.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'အင်္ဂလိပ်ကြိယာများတွင် ကာလ၊ အရေအတွက်၊ အနေအထားပြရန် ပုံစံငါးမျိုး ရှိသည်။ '
              'ဤပုံစံများသည် ပစ္စုပ္ပန်/အတိတ်/ဆက်လက်/ပြီးစီးကာလ စသည်တို့အတွက် အရေးကြီးသည်။',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey.shade600,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTakeQuizCard(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Theme.of(context).colorScheme.primary),
      ),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizLessonPage(
              quizData: verbFormsQuizzes,
              tenseTitle: 'Verb Forms (ကြိယာပုံစံများ)',
            ),
          ),
        ),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Icon(
                Icons.quiz,
                size: 48,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Take A Quiz',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${verbFormsQuizzes.length} questions on V1–V5, regular & irregular verbs. ကြိယာပုံစံများ လေ့ကျင့်ခန်း ၂၀ ခု။',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildFormCard(BuildContext context, Map<String, dynamic> section) {
    final examples = section['examples'] as List<dynamic>? ?? [];
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      color: Theme.of(context).colorScheme.onPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade800),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              section['title'] as String,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 6),
            Text(
              section['usage'] as String,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 14,
                // color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Theme.of(
                    context,
                  ).colorScheme.onPrimaryContainer.withAlpha(25),
                ),
              ),
              child: Text(
                section['formula'] as String,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
            if (examples.isNotEmpty) ...[
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: examples.map<Widget>((e) {
                  final map = e as Map<String, dynamic>;
                  return Chip(
                    label: Text('${map['en']} — ${map['mm']}'),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                  );
                }).toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildRegularIrregularCard(
    BuildContext context,
    Map<String, dynamic> data,
  ) {
    final examples = data['examples'] as List<dynamic>? ?? [];
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      color: Theme.of(context).colorScheme.onPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade800),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data['title'] as String,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 6),
            Text(
              data['usage'] as String,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontSize: 14),
            ),
            if (examples.isNotEmpty) ...[
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: examples.map<Widget>((e) {
                  final map = e as Map<String, dynamic>;
                  return Chip(
                    label: Text('${map['v1']} → ${map['v2']} → ${map['v3']}'),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                  );
                }).toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryTable(BuildContext context) {
    const columnLabels = [
      'Base (V1)',
      'Past (V2)',
      'Past Part. (V3)',
      '-ing (V4)',
      '-s/es (V5)',
    ];
    const keys = ['v1', 'v2', 'v3', 'v4', 'v5'];

    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.onPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade800),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columnSpacing: 16,
            headingRowColor: WidgetStateProperty.all(
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5),
            ),
            headingTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            dataRowMinHeight: 44,
            dataRowMaxHeight: 52,
            border: TableBorder.all(color: Colors.grey.shade400),
            columns: columnLabels
                .map(
                  (label) => DataColumn(
                    label: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(label),
                    ),
                  ),
                )
                .toList(),
            rows: verbExamples.map((verb) {
              return DataRow(
                cells: keys.map((key) {
                  final value = verb[key] as String;
                  final isRegular = verb['isRegular'] as bool? ?? false;
                  final isFirstCol = key == 'v1';
                  return DataCell(
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 6,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (isFirstCol)
                            Padding(
                              padding: const EdgeInsets.only(right: 6),
                              child: Tooltip(
                                message: isRegular ? 'Regular' : 'Irregular',
                                child: Icon(
                                  isRegular
                                      ? Icons.check_circle_outline
                                      : Icons.warning_amber_rounded,
                                  size: 16,
                                  color: isRegular
                                      ? Colors.green
                                      : Colors.orange,
                                ),
                              ),
                            ),
                          Flexible(
                            child: Text(
                              value,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
