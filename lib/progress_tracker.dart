

import 'package:flutter/material.dart';
import 'dart:math';

// Global State for Progress Tracking
class ProgressData {
  static Map<String, int> correctCounts = {};
  static Map<String, int> totalAttempts = {};

  static double getMastery(String category) {
    int attempts = totalAttempts[category] ?? 0;
    if (attempts == 0) return 0.0;
    return (correctCounts[category] ?? 0) / attempts;
  }
}

// Data Source (Same as before but used for tracking)
final List<Map<String, dynamic>> partsOfSpeech = const [
  {
    'title': 'နာမ် (Noun)',
    'definition': 'လူ၊ တိရစ္ဆာန်၊ အရာဝတ္ထု၊ နေရာဌာန အမည်များကို နာမ်ဟုခေါ်သည်။',
    'examples': [
      {'en': 'Kyaw Kyaw', 'mm': 'ကျော်ကျော်'},
      {'en': 'Teacher', 'mm': 'ဆရာ'},
      {'en': 'Cat', 'mm': 'ကြောင်'},
      {'en': 'Yangon', 'mm': 'ရန်ကုန်'},
      {'en': 'Book', 'mm': 'စာအုပ်'},
      {'en': 'Water', 'mm': 'ရေ'},
      {'en': 'Happiness', 'mm': 'ပျော်ရွှင်မှု'},
      {'en': 'Apple', 'mm': 'ပန်းသီး'},
      {'en': 'School', 'mm': 'ကျောင်း'},
      {'en': 'Gold', 'mm': 'ရွှေ'},
    ],
  },
  {
    'title': 'နာမ်စား (Pronoun)',
    'definition': 'နာမ်အစား အသုံးပြုသော စကားလုံးကို နာမ်စားဟုခေါ်သည်။',
    'examples': [
      {'en': 'I', 'mm': 'ကျွန်တော်/ကျွန်မ'},
      {'en': 'You', 'mm': 'သင်/မင်း'},
      {'en': 'He', 'mm': 'သူ (ကျား)'},
      {'en': 'She', 'mm': 'သူမ (မ)'},
      {'en': 'It', 'mm': '၎င်း/၎င်းအရာ'},
      {'en': 'We', 'mm': 'ကျွန်ုပ်တို့'},
      {'en': 'They', 'mm': 'သူတို့'},
      {'en': 'Me', 'mm': 'ကျွန်တော့်ကို'},
      {'en': 'This', 'mm': 'ဤအရာ'},
      {'en': 'Who', 'mm': 'ဘယ်သူလဲ'},
    ],
  },
  {
    'title': 'ကြိယာ (Verb)',
    'definition':
    'လုပ်ဆောင်ခြင်း သို့မဟုတ် အခြေအနေကို ဖော်ပြသောစကားလုံးဖြစ်သည်။',
    'examples': [
      {'en': 'Eat', 'mm': 'စားသည်'},
      {'en': 'Go', 'mm': 'သွားသည်'},
      {'en': 'Sleep', 'mm': 'အိပ်သည်'},
      {'en': 'Run', 'mm': 'ပြေးသည်'},
      {'en': 'Speak', 'mm': 'စကားပြောသည်'},
      {'en': 'Think', 'mm': 'စဉ်းစားသည်'},
      {'en': 'Love', 'mm': 'ချစ်သည်'},
      {'en': 'Buy', 'mm': 'ဝယ်သည်'},
      {'en': 'Write', 'mm': 'စာရေးသည်'},
      {'en': 'Play', 'mm': 'ကစားသည်'},
    ],
  },
  {
    'title': 'နာမဝိသေသန (Adjective)',
    'definition':
    'နာမ် သို့မဟုတ် နာမ်စား၏ အရည်အသွေးကို ထူးခြားအောင် ဖော်ပြသောစကားလုံးဖြစ်သည်။',
    'examples': [
      {'en': 'Beautiful', 'mm': 'လှပသော'},
      {'en': 'Big', 'mm': 'ကြီးသော'},
      {'en': 'Smart', 'mm': 'ထက်မြက်သော'},
      {'en': 'Red', 'mm': 'နီသော'},
      {'en': 'Tall', 'mm': 'ရှည်သော'},
      {'en': 'Happy', 'mm': 'ပျော်ရွှင်သော'},
      {'en': 'Cold', 'mm': 'အေးသော'},
      {'en': 'Expensive', 'mm': 'ဈေးကြီးသော'},
      {'en': 'Fast', 'mm': 'မြန်သော'},
      {'en': 'Small', 'mm': 'သေးငယ်သော'},
    ],
  },
  {
    'title': 'ကြိယာဝိသေသန (Adverb)',
    'definition':
    'ကြိယာ၊ နာမဝိသေသန သို့မဟုတ် အခြားသော ကြိယာဝိသေသနတစ်ခုကို အထူးပြုသောစကားလုံးဖြစ်သည်။',
    'examples': [
      {'en': 'Slowly', 'mm': 'နှေးကွေးစွာ'},
      {'en': 'Quickly', 'mm': 'မြန်ဆန်စွာ'},
      {'en': 'Easily', 'mm': 'လွယ်ကူစွာ'},
      {'en': 'Very', 'mm': 'အလွန်'},
      {'en': 'Always', 'mm': 'အမြဲတမ်း'},
      {'en': 'Never', 'mm': 'ဘယ်တော့မှ'},
      {'en': 'Today', 'mm': 'ယနေ့'},
      {'en': 'Here', 'mm': 'ဤနေရာမှာ'},
      {'en': 'Well', 'mm': 'ကောင်းမွန်စွာ'},
      {'en': 'Quietly', 'mm': 'တိတ်ဆိတ်စွာ'},
    ],
  },
  {
    'title': 'ဝိဘတ် (Preposition)',
    'definition':
    'နာမ် သို့မဟုတ် နာမ်စားတစ်ခုနှင့် အခြားစကားလုံးတို့၏ ဆက်သွယ်မှုကို ပြသောစကားလုံးဖြစ်သည်။',
    'examples': [
      {'en': 'In', 'mm': 'အတွင်း၌'},
      {'en': 'On', 'mm': 'အပေါ်၌'},
      {'en': 'At', 'mm': 'နေရာတစ်ခုခုတွင်'},
      {'en': 'Under', 'mm': 'အောက်၌'},
      {'en': 'With', 'mm': 'နှင့်အတူ'},
      {'en': 'By', 'mm': 'ဖြင့်/နားမှာ'},
      {'en': 'From', 'mm': 'မှ/ထံမှ'},
      {'en': 'To', 'mm': 'သို့'},
      {'en': 'Between', 'mm': 'ကြားတွင်'},
      {'en': 'For', 'mm': 'အတွက်'},
    ],
  },
  {
    'title': 'စကားဆက် (Conjunction)',
    'definition':
    'စကားလုံး သို့မဟုတ် ဝါကျများကို ဆက်သွယ်ပေးသော စကားလုံးဖြစ်သည်။',
    'examples': [
      {'en': 'And', 'mm': 'နှင့်/ပြီးတော့'},
      {'en': 'But', 'mm': 'သို့သော်'},
      {'en': 'Or', 'mm': 'သို့မဟုတ်'},
      {'en': 'So', 'mm': 'ထို့ကြောင့်'},
      {'en': 'Because', 'mm': 'ဘာကြောင့်လဲဆိုတော့'},
      {'en': 'If', 'mm': 'အကယ်၍'},
      {'en': 'Although', 'mm': 'သော်လည်း'},
      {'en': 'While', 'mm': 'နေစဉ်အတွင်း'},
      {'en': 'Since', 'mm': 'ကတည်းက'},
      {'en': 'Unless', 'mm': 'မ...လျှင်'},
    ],
  },
  {
    'title': 'အာမေဍိတ် (Interjection)',
    'definition': 'စိတ်လှုပ်ရှားမှုကို ရုတ်တရက် ဖော်ပြသောစကားလုံးဖြစ်သည်။',
    'examples': [
      {'en': 'Oh!', 'mm': 'အို!'},
      {'en': 'Wow!', 'mm': 'ဝါး! (အံ့ဩခြင်း)'},
      {'en': 'Alas!', 'mm': 'ဖြစ်ရလေခြင်း!'},
      {'en': 'Ouch!', 'mm': 'အား! (နာကျင်ခြင်း)'},
      {'en': 'Hello!', 'mm': 'ဟယ်လို! (နှုတ်ဆက်ခြင်း)'},
      {'en': 'Hey!', 'mm': 'ဟေး!'},
      {'en': 'Oops!', 'mm': 'အာဗြဲ! (အမှားတစ်ခုလုပ်မိခြင်း)'},
      {'en': 'Bravo!', 'mm': 'သာဓု/တော်လေစွ!'},
      {'en': 'Hooray!', 'mm': 'ဟေးဟေး! (အောင်ပွဲခံခြင်း)'},
      {'en': 'Ah!', 'mm': 'အာ!'},
    ],
  },
];


class ProgressTracker extends StatefulWidget {
  const ProgressTracker({super.key});
  @override
  State<ProgressTracker> createState() => _ProgressTrackerState();
}

class _ProgressTrackerState extends State<ProgressTracker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfect English'), centerTitle: true),
      body: Column(
        children: [
          // Summary Header
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.indigo.withOpacity(0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("သင့်သင်ယူမှုအခြေအနေ (Learning Progress)", style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: _calculateOverallProgress(),
                    minHeight: 12,
                    backgroundColor: Colors.grey[300],
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: partsOfSpeech.length,
              itemBuilder: (context, index) {
                final item = partsOfSpeech[index];

                String title = partsOfSpeech[index]['title'];
                double mastery = ProgressData.getMastery(title);
                return ListTile(
                  title: Text(title),
                  subtitle: Text("${(mastery * 100).toInt()}% Mastery"),
                  trailing: Icon(Icons.circle, color: _getColorForMastery(mastery), size: 12),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>DetailPage(
                    title: item['title'],
                    definition: item['definition'],
                    examples: List<Map<String, String>>.from(
                      item['examples'],
                    ),
                  ),)),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.push(context, MaterialPageRoute(builder: (context) => const QuizPage()));
          setState(() {}); // Refresh progress after quiz
        },
        label: const Text("Start Quiz"),
        icon: const Icon(Icons.bolt),
      ),
    );
  }

  double _calculateOverallProgress() {
    if (ProgressData.totalAttempts.isEmpty) return 0.0;
    double total = 0;
    for (var cat in partsOfSpeech) {
      total += ProgressData.getMastery(cat['title']);
    }
    return total / partsOfSpeech.length;
  }

  Color _getColorForMastery(double m) {
    if (m > 0.8) return Colors.green;
    if (m > 0.4) return Colors.orange;
    return Colors.red;
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late String word, correctCat;
  List<String> options = [];

  void next() {
    final random = Random();
    var cat = partsOfSpeech[random.nextInt(partsOfSpeech.length)];
    var examples = cat['examples'] as List;
    setState(() {
      word = examples[random.nextInt(examples.length)]['en'];
      correctCat = cat['title'];
      options = [correctCat];
      while (options.length < 4) {
        String opt = partsOfSpeech[random.nextInt(partsOfSpeech.length)]['title'];
        if (!options.contains(opt)) options.add(opt);
      }
      options.shuffle();
    });
  }

  @override
  void initState() { super.initState(); next(); }

  void submit(String selected) {
    bool isCorrect = selected == correctCat;
    ProgressData.totalAttempts[correctCat] = (ProgressData.totalAttempts[correctCat] ?? 0) + 1;
    if (isCorrect) ProgressData.correctCounts[correctCat] = (ProgressData.correctCounts[correctCat] ?? 0) + 1;

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(isCorrect ? "Excellent! +1 Mastery" : "Oops! It's actually $correctCat"),
      backgroundColor: isCorrect ? Colors.green : Colors.red,
      duration: const Duration(milliseconds: 600),
    ));
    next();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quick Quiz")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(word, style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            ...options.map((o) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
                onPressed: () => submit(o), child: Text(o),
              ),
            )),
          ],
        ),
      ),
    );
  }
}


class DetailPage extends StatelessWidget {
  final String title;
  final String definition;
  final List<Map<String, String>> examples;

  const DetailPage({
    super.key,
    required this.title,
    required this.definition,
    required this.examples,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'အဓိပ္ပာယ်သတ်မှတ်ချက် (Definition)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            Text(definition, style: const TextStyle(fontSize: 16)),
            const Divider(height: 32),
            const Text(
              'ဥပမာများ (Examples)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                itemCount: examples.length,
                separatorBuilder: (context, index) =>
                const Divider(color: Colors.black12),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(child: Text('${index + 1}')),
                    title: Text(
                      examples[index]['en']!,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(examples[index]['mm']!),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
