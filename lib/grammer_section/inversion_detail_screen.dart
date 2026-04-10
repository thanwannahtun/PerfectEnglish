import 'package:flutter/material.dart';
import 'package:perfect_english/widgets/speak_button.dart';

import 'quiz_lesson_page.dart';

// Inversion is the pinnacle of formal English grammar.
// In standard English, the structure is Subject + Verb.
// However, in Inversion, we flip the order to Auxiliary Verb + Subject,
// much like how we form questions.

class InversionDetailScreen extends StatelessWidget {
  const InversionDetailScreen({super.key});

  final List<Map<String, dynamic>> inversionData = const [
    {
      'category': '1. Negative Adverbs (အငြင်းသဘောဆောင်သော ကြိယာဝိသေသနများ)',
      'desc':
          'ဝါကျကို အလေးအနက်ပြုလိုသောအခါ "ဘယ်သောအခါမှ၊ ခဲခဲယဉ်ယဉ်" စသည့် စကားလုံးများကို ဝါကျအစတွင်ထားပါက Inversion လုပ်ရမည်။',
      'words': ['Never', 'Rarely', 'Seldom', 'Hardly', 'Scarcely'],
      'examples': [
        {
          'standard': 'I have never seen such a beautiful sight.',
          'inversion': 'Never have I seen such a beautiful sight.',
          'mm':
              'ဤမျှလှပသော မြင်ကွင်းမျိုးကို တစ်ခါဖူးမျှ ကျွန်ုပ်မမြင်ဖူးခဲ့ပါ။',
          'logic': 'Never (Adverb) + have (Auxiliary) + I (Subject)',
        },
        {
          'standard': 'He rarely goes out at night.',
          'inversion': 'Rarely does he go out at night.',
          'mm': 'သူသည် ညဘက်တွင် အပြင်ထွက်ခဲလှသည်။',
          'logic': 'Rarely + does + he',
        },
      ],
    },
    {
      'category': '2. "Only" Expressions (ကန့်သတ်ချက်များ)',
      'desc':
          '"Only" ဖြင့်စသော အသုံးအနှုန်းများသည် ဝါကျ၏ အစတွင်ရှိနေပါက ဒုတိယဝါကျပိုင်း (Main Clause) တွင် Inversion ဖြစ်ပေါ်သည်။',
      'words': ['Only then', 'Only after', 'Only when', 'Not only... but also'],
      'examples': [
        {
          'standard': 'He understood the problem only then.',
          'inversion': 'Only then did he understand the problem.',
          'mm':
              'ထိုအချိန်ရောက်မှသာလျှင် သူသည် ပြဿနာကို နားလည်သဘောပေါက်သွားတော့သည်။',
          'logic': 'Only then + did + he + understand',
        },
        {
          'standard': 'He is not only a singer but also a dancer.',
          'inversion': 'Not only is he a singer, but he is also a dancer.',
          'mm': 'သူသည် အဆိုတော်တစ်ယောက်သာမက ကချေသည်တစ်ဦးလည်း ဖြစ်ပေသည်။',
          'logic': 'Not only + is + he',
        },
      ],
    },
    {
      'category': '3. Conditional Inversion (If Clauses ဖြုတ်ခြင်း)',
      'desc':
          'အဆင့်မြင့်အရေးအသားတွင် "If" ကို ဖြုတ်ပြီး Inversion ပုံစံဖြင့် ပိုမိုခန့်ညားအောင် ရေးသားနိုင်သည်။',
      'examples': [
        {
          'standard': 'If you should need any help, call me.',
          'inversion': 'Should you need any help, call me.',
          'mm': 'သင် အကူအညီ လိုအပ်လာခဲ့ပါက ကျွန်ုပ်ကို ခေါ်လိုက်ပါ။',
          'logic': 'Should + you + need (If ကို ဖြုတ်ထားသည်)',
        },
        {
          'standard': 'If I were you, I would accept the offer.',
          'inversion': 'Were I you, I would accept the offer.',
          'mm':
              'ကျွန်ုပ်သာ သင်၏နေရာတွင်ဆိုပါက ထိုကမ်းလှမ်းချက်ကို လက်ခံလိုက်မည်။',
          'logic': 'Were + I + you',
        },
        {
          'standard': 'If they had known, they would have acted.',
          'inversion': 'Had they known, they would have acted.',
          'mm': 'သူတို့သာ သိခဲ့ကြပါလျှင် တစ်ခုခု လုပ်ဆောင်ခဲ့ကြပေလိမ့်မည်။',
          'logic': 'Had + they + known',
        },
      ],
    },
    {
      'category': '4. "Little" for Surprise (လုံးဝမထင်မှတ်ထားခြင်း)',
      'desc':
          'တစ်ခုခုကို လုံးဝမသိလိုက်ခြင်း သို့မဟုတ် မမျှော်လင့်ထားခြင်းကို ဖော်ပြရာတွင် သုံးသည်။',
      'examples': [
        {
          'standard': 'He knew little about the surprise party.',
          'inversion': 'Little did he know about the surprise party.',
          'mm':
              'ထိုအံ့ဩဖွယ်ရာ ပါတီအကြောင်းကို သူ လုံးဝ (စိုးစဉ်းမျှ) မသိခဲ့ချေ။',
          'logic': 'Little + did + he + know',
        },
      ],
    },
  ];

  /// Quiz dataset: 20 questions for Inversion (advanced emphasis).
  final List<Map<String, dynamic>> inversionQuizzes = const [
    // Negative Adverbs (Never / Rarely / Seldom / Hardly / Scarcely) – 5
    {
      'q': '___ have I seen such a beautiful view.',
      'a': 'Never',
      'options': ['Never', 'Rarely', 'Hardly', 'Scarcely'],
      'type': 'Negative Adverbs',
      'mm': 'အနက်ပြား 강조 - ဘယ်တော့မှ မမြင်ဖူးသလောက် လှပသော မြင်ကွင်း။',
    },
    {
      'q': 'Rarely ___ he go out at night.',
      'a': 'does',
      'options': ['does', 'did', 'has', 'is'],
      'type': 'Negative Adverbs',
      'mm': 'Rarely + auxiliary (does) + subject (he) + V1 ပုံစံဖြစ်ရသည်။',
    },
    {
      'q': 'Seldom ___ we get a chance to relax.',
      'a': 'do',
      'options': ['do', 'did', 'are', 'have'],
      'type': 'Negative Adverbs',
      'mm': 'Seldom နောက်မှာ do/does/did + subject သုံးရသည်။',
    },
    {
      'q': 'Hardly ___ I sat down when the phone rang.',
      'a': 'had',
      'options': ['have', 'had', 'did', 'was'],
      'type': 'Negative Adverbs',
      'mm':
          'Hardly/Scarcely ... when အတွဲမှာ Past Perfect inversion (Had I sat...) သုံးသည်။',
    },
    {
      'q': 'Scarcely had he arrived when it __ to rain.',
      'a': 'began',
      'options': ['begins', 'was beginning', 'began', 'had begun'],
      'type': 'Negative Adverbs',
      'mm': 'Scarcely had + subject + V3, when + Past Simple ပုံစံဖြစ်သည်။',
    },

    // "Only" expressions (Only then / Only after / Not only ...) – 5
    {
      'q': 'Only then ___ he understand the problem.',
      'a': 'did',
      'options': ['did', 'does', 'had', 'was'],
      'type': 'Only Expressions',
      'mm':
          'Only + adverb ဖွင့်သောအခါ did/does/had စတဲ့ auxiliary ကို subject ထက်ရှေ့သို့ ရွှေ့သည်။',
    },
    {
      'q': 'Only after the meeting ___ the truth.',
      'a': 'did they learn',
      'options': [
        'they learned',
        'did they learn',
        'had they learned',
        'they had learned',
      ],
      'type': 'Only Expressions',
      'mm':
          'Only after + noun phrase နောက်က main clause ကို Inversion (did they learn) လုပ်ရသည်။',
    },
    {
      'q': 'Only when he apologized ___ to speak to him again.',
      'a': 'did she agree',
      'options': [
        'she agreed',
        'did she agree',
        'had she agreed',
        'she had agreed',
      ],
      'type': 'Only Expressions',
      'mm':
          'Only when + clause နောက်က main clause တွင် did + subject + V1 ဖြစ်ရသည်။',
    },
    {
      'q': 'Not only ___ late, but he also forgot the document.',
      'a': 'was he',
      'options': ['he was', 'was he', 'had he been', 'he had been'],
      'type': 'Only Expressions',
      'mm':
          'Not only သုံးသော Inversion က Not only + auxiliary + subject ပုံစံဖြစ်သည်။',
    },
    {
      'q': 'Not only did she pass the exam, ___ she also got a scholarship.',
      'a': 'but',
      'options': ['and', 'but', 'so', 'or'],
      'type': 'Only Expressions',
      'mm': 'Not only ... but also စာရင်းတင်ဖွဲ့စည်းပုံကို သတိပြုရန်။',
    },

    // Conditional Inversion (Should / Were / Had) – 5
    {
      'q': '___ you need any help, please call me.',
      'a': 'Should',
      'options': ['Should', 'Had', 'Were', 'If'],
      'type': 'Conditional Inversion',
      'mm':
          'If you should need → Should you need အဖြစ် If ကို ဖြုတ်ပြီး Inversionလုပ်သည်။',
    },
    {
      'q': '___ I you, I would take that opportunity.',
      'a': 'Were',
      'options': ['Were', 'Was', 'Had', 'Should'],
      'type': 'Conditional Inversion',
      'mm': 'If I were you → Were I you အဖြစ် Inversion ပြောင်းရေးသည်။',
    },
    {
      'q': '___ they known earlier, they would have helped.',
      'a': 'Had',
      'options': ['Had', 'Have', 'Were', 'Should'],
      'type': 'Conditional Inversion',
      'mm':
          'If they had known → Had they known အဖြစ် If ကို ဖြုတ်ပြီး auxiliary ကို ရှေ့ရွှေ့သည်။',
    },
    {
      'q': 'Should you have any questions, ___ free to ask.',
      'a': 'feel',
      'options': ['feels', 'felt', 'feel', 'to feel'],
      'type': 'Conditional Inversion',
      'mm':
          'Should + subject + V1 ပုံစံနဲ့ ရေးပြီး main clause ကို အကြံပေးဝါကျတစ်ခု အဖြစ်ဆက်သည်။',
    },
    {
      'q': 'Were it not for his help, we ___ in trouble.',
      'a': 'would be',
      'options': ['will be', 'would be', 'were', 'had been'],
      'type': 'Conditional Inversion',
      'mm':
          'Were it not for ... = If it were not for ... (မရှိလျှင်) ဆိုလိုသည်။',
    },

    // Other Emphatic Inversion ("Little", etc.) – 5
    {
      'q': 'Little ___ I know about their secret plan.',
      'a': 'did',
      'options': ['do', 'did', 'had', 'was'],
      'type': 'Emphatic Inversion',
      'mm':
          'Little + did + subject + V1 ပုံစံဖြင့် လုံးဝမသိခြင်းကို ဂရုစိုက်ဖော်ပြသည်။',
    },
    {
      'q': 'Little did she realize that her words ___ him.',
      'a': 'would hurt',
      'options': ['hurt', 'would hurt', 'will hurt', 'had hurt'],
      'type': 'Emphatic Inversion',
      'mm':
          'Little did she realize (သူမ လုံးဝမထင်မှတ်ခဲ့ပါ) + would hurt (အနာဂတ်/ကိစ္စရလဒ်) ပုံစံ။',
    },
    {
      'q': 'So loudly ___ the music play that we could not sleep.',
      'a': 'did',
      'options': ['does', 'did', 'was', 'had'],
      'type': 'Emphatic Inversion',
      'mm':
          'So + adverb/adjective ဖြင့်စသော emphasis တွင် So loudly did the music play ပုံစံ သုံးသည်။',
    },
    {
      'q': 'So beautiful ___ the view that everyone stopped to take a photo.',
      'a': 'was',
      'options': ['is', 'was', 'were', 'had been'],
      'type': 'Emphatic Inversion',
      'mm':
          'So + adjective + auxiliary + subject (So beautiful was the view ...) ပုံစံဖြစ်သည်။',
    },
    {
      'q': 'Only rarely ___ such a talented writer appear.',
      'a': 'does',
      'options': ['do', 'did', 'does', 'has'],
      'type': 'Emphatic Inversion',
      'mm':
          'Rarely/Only rarely + does + subject + V1 ဖြင့် အရမ်းရှားပါးဖြစ်ကြောင်း အလေးအနက်ဖော်ပြသည်။',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inversion (Advanced Emphasis)')),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'inversion-quiz',
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizLessonPage(
              quizData: inversionQuizzes,
              tenseTitle: 'Inversion (Advanced Emphasis)',
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
          _buildInversionFormulaHeader(context),
          const SizedBox(height: 20),
          ...inversionData.map((data) => _buildAdvancedCard(data, context)),
          const SizedBox(height: 24),
          _buildWarningNote(context),
        ],
      ),
    );
  }

  Widget _buildInversionFormulaHeader(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.onPrimary,
      child: Container(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            Text(
              "The Inversion Equation",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Divider(color: Colors.white30),
            Text(
              "[Negative Word/Expression] + [Auxiliary Verb] + [Subject] + [Main Verb]",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontFamily: 'monospace',
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "ပုံမှန်ဝါကျကို အမေးဝါကျပုံစံ ပြောင်းလဲရေးသားခြင်း ဖြစ်သည်။",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                fontSize: 12,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdvancedCard(Map<String, dynamic> data, BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.onPrimary,
      margin: const EdgeInsets.only(bottom: 25),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data['category'],
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            Text(data['desc'], style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 15),
            if (data.containsKey('words'))
              Wrap(
                spacing: 8,
                children: (data['words'] as List<String>)
                    .map(
                      (w) => Chip(
                        label: Text(
                          w,

                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(
                                  context,
                                ).colorScheme.onPrimaryContainer,
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
              (ex) => Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Standard: ${ex['standard']}",
                      style: const TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey.withAlpha(15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  "Inverted:",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer
                                        .withAlpha(200),
                                  ),
                                ),
                              ),
                              SpeakButton(text: ex['inversion'] ?? ""),
                            ],
                          ),
                          Text(
                            ex['inversion'] ?? "",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      ex['mm'],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).colorScheme.onPrimaryContainer.withAlpha(25),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "Logic: ${ex['logic']}",
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(
                            context,
                          ).colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold,
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

  Widget _buildWarningNote(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onError,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(Icons.warning_amber_rounded),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              "သတိပြုရန် - Inversion ကို ပုံမှန်စကားပြောတွင် အသုံးနည်းသည်။ စာမေးပွဲအဖြေလွှာများ၊ အရေးအသားများနှင့် မိန့်ခွန်းများတွင်သာ အဓိကထား သုံးစွဲသင့်သည်။",
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).colorScheme.onErrorContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
