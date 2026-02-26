import 'package:flutter/material.dart';

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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Conditionals (If Clauses)')),
      body: ListView(
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: MediaQuery.sizeOf(context).width * 0.05,
        ),
        children: [
          _buildSummaryChart(),
          const SizedBox(height: 20),
          ...conditionalData.map(
            (data) => _buildConditionalCard(data, context),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryChart() {
    return Card(
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
                Text(
                  "Zero: 100% Real",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "1st: Possible",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "2nd: Imaginary",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
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
