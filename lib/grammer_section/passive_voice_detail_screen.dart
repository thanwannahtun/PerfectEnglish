import 'package:flutter/material.dart';

class PassiveVoiceDetailScreen extends StatelessWidget {
  const PassiveVoiceDetailScreen({super.key});

  final List<Map<String, dynamic>> passiveRules = const [
    {
      'tense': 'Simple Present',
      'active': 'am/is/are + V3',
      'usage':
          'ယေဘုယျအမှန်တရားများ သို့မဟုတ် ပုံမှန်လုပ်ဆောင်ချက်များကို Passive အနေဖြင့်ဖော်ပြသည်။',
      'examples': [
        {
          'active': 'The chef prepares the food.',
          'passive': 'The food is prepared by the chef.',
          'mm': 'အစားအစာကို စားဖိုမှူးမှ ပြင်ဆင်သည်။',
        },
      ],
    },
    {
      'tense': 'Simple Past',
      'active': 'was/were + V3',
      'usage':
          'အတိတ်က ပြီးဆုံးခဲ့သော လုပ်ဆောင်ချက်ကို ခံရသူဘက်မှ အဓိကထားဖော်ပြသည်။',
      'examples': [
        {
          'active': 'He wrote the letter.',
          'passive': 'The letter was written by him.',
          'mm': 'စာကို သူ့ဖက်မှ ရေးသားခဲ့သည်။',
        },
      ],
    },
    {
      'tense': 'Present Continuous',
      'active': 'am/is/are + being + V3',
      'usage': 'လက်ရှိတွင် လုပ်ဆောင်ခံနေရဆဲ အရာများကို ဖော်ပြသည်။',
      'examples': [
        {
          'active': 'They are building the house.',
          'passive': 'The house is being built by them.',
          'mm': 'အိမ်ကို သူတို့မှ ဆောက်လုပ်နေကြသည်။',
        },
      ],
    },
    {
      'tense': 'Present Perfect',
      'active': 'have/has + been + V3',
      'usage': 'လုပ်ဆောင်ပြီးစီးသွားသော ခံရသူဘက်မှ အခြေအနေကို ဖော်ပြသည်။',
      'examples': [
        {
          'active': 'She has cleaned the room.',
          'passive': 'The room has been cleaned by her.',
          'mm': 'အခန်းကို သူမမှ သန့်ရှင်းရေးလုပ်ပြီးသွားပြီ။',
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Passive Voice')),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: MediaQuery.sizeOf(context).width * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'How to change to Passive Voice?',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            _buildTransformationGuide(context),
            const SizedBox(height: 25),
            Text(
              'Tense-wise Passive Rules',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            ...passiveRules.map((rule) => _buildPassiveCard(rule)),
          ],
        ),
      ),
    );
  }

  Widget _buildTransformationGuide(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimaryContainer.withAlpha(25),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.green.shade800),
      ),
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Active: Subject + Verb + Object",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Icon(Icons.swap_vert, size: 30, color: Colors.green),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Passive: Object + be + V3 + (by Subject)",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPassiveCard(Map<String, dynamic> rule) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              rule['tense'],
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Text(
              "Formula: ${rule['active']}",
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              rule['usage'],
              style: const TextStyle(fontSize: 13, fontStyle: FontStyle.italic),
            ),
            const Divider(),
            ...(rule['examples'] as List).map(
              (ex) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "A: ${ex['active']}",
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.black, fontSize: 15),
                      children: [
                        const TextSpan(
                          text: "P: ",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: ex['passive'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    ex['mm'],
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
