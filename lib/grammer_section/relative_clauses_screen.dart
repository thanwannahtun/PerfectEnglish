import 'package:flutter/material.dart';

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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Relative Clauses')),
      body: ListView(
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: MediaQuery.sizeOf(context).width * 0.05,
        ),
        children: [
          _buildQuickReferenceTable(context),
          const SizedBox(height: 20),
          ...relativeData.map((data) => _buildClauseCard(data, context)),
        ],
      ),
    );
  }

  Widget _buildQuickReferenceTable(BuildContext context) {
    return Card(
      child: DataTable(
        border: TableBorder.all(borderRadius: BorderRadius.circular(5)),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(5)
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
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    textAlign: TextAlign.start,
                    data['pronoun'],
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Chip(
                      label: Text(
                        data['use_for'],
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
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
                  Text(
                    ex['en'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Structure Breakdown:",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  _highlightClause(ex['breakdown'], data['pronoun'], context),
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
          style: const TextStyle(fontSize: 14),
          children: [
            TextSpan(text: text.split('[')[0]),
            TextSpan(
              text: '[${text.split('[')[1].split(']')[0]}]',
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(text: text.split(']')[1]),
          ],
        ),
      ),
    );
  }
}
