import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inversion (Advanced Emphasis)')),
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
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(15),
      ),
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
    );
  }

  Widget _buildAdvancedCard(Map<String, dynamic> data, BuildContext context) {
    return Card(
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
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(
                              context,
                            ).colorScheme.onPrimaryContainer,
                            fontSize: 12,
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
                    Text(
                      "Inverted: ${ex['inversion']}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
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
