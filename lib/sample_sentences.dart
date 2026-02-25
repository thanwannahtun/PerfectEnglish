import 'dart:math';
import 'package:flutter/material.dart';

// Updated Data with Sentences
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
    ],
    'sentences': [
      {
        'en': 'Kyaw Kyaw is my friend.',
        'mm': 'ကျော်ကျော်သည် ကျွန်တော့်သူငယ်ချင်းဖြစ်သည်။',
      },
      {'en': 'The teacher is kind.', 'mm': 'ဆရာသည် သဘောကောင်းသည်။'},
      {'en': 'The cat is sleeping.', 'mm': 'ကြောင်လေး အိပ်နေသည်။'},
      {'en': 'I live in Yangon.', 'mm': 'ကျွန်တော် ရန်ကုန်မှာ နေထိုင်သည်။'},
      {'en': 'This is a good book.', 'mm': 'ဒါက စာအုပ်ကောင်း တစ်အုပ်ပါ။'},
    ],
  },
  {
    'title': 'နာမ်စား (Pronoun)',
    'definition': 'နာမ်အစား အသုံးပြုသော စကားလုံးကို နာမ်စားဟုခေါ်သည်။',
    'examples': [
      {'en': 'I', 'mm': 'ကျွန်တော်'},
      {'en': 'You', 'mm': 'သင်'},
      {'en': 'He', 'mm': 'သူ'},
      {'en': 'She', 'mm': 'သူမ'},
      {'en': 'They', 'mm': 'သူတို့'},
    ],
    'sentences': [
      {'en': 'I am a student.', 'mm': 'ကျွန်တော် ကျောင်းသားတစ်ယောက်ပါ။'},
      {'en': 'You are very smart.', 'mm': 'သင်က အရမ်းတော်တာပဲ။'},
      {'en': 'He plays football.', 'mm': 'သူ ဘောလုံးကစားသည်။'},
      {'en': 'She likes apples.', 'mm': 'သူမ ပန်းသီးကြိုက်သည်။'},
      {'en': 'They are going home.', 'mm': 'သူတို့ အိမ်ပြန်နေကြသည်။'},
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
    ],
    'sentences': [
      {'en': 'I eat rice.', 'mm': 'ကျွန်တော် ထမင်းစားသည်။'},
      {'en': 'We go to school.', 'mm': 'ကျွန်ုပ်တို့ ကျောင်းသွားကြသည်။'},
      {'en': 'Babies sleep a lot.', 'mm': 'ကလေးငယ်တွေ အများကြီးအိပ်ကြသည်။'},
      {'en': 'Dogs run fast.', 'mm': 'ခွေးတွေ အပြေးမြန်သည်။'},
      {'en': 'I speak English.', 'mm': 'ကျွန်တော် အင်္ဂလိပ်စကားပြောသည်။'},
    ],
  },
  // Note: Add similar 'sentences' arrays for Adjective, Adverb, Preposition, Conjunction, and Interjection here.
];

class SampleSentencesExample extends StatelessWidget {
  const SampleSentencesExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfect English Learning')),
      body: ListView.builder(
        itemCount: partsOfSpeech.length,
        itemBuilder: (context, index) {
          final item = partsOfSpeech[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(
                item['title'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      title: item['title'],
                      definition: item['definition'],
                      examples: List<Map<String, String>>.from(
                        item['examples'],
                      ),
                      sentences: List<Map<String, String>>.from(
                        item['sentences'] ?? [],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;
  final String definition;
  final List<Map<String, String>> examples;
  final List<Map<String, String>> sentences;

  const DetailPage({
    super.key,
    required this.title,
    required this.definition,
    required this.examples,
    required this.sentences,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('အဓိပ္ပာယ်သတ်မှတ်ချက် (Definition)'),
            const SizedBox(height: 8),
            Text(definition, style: const TextStyle(fontSize: 16)),
            const Divider(height: 32),

            _buildSectionTitle('ဥပမာစကားလုံးများ (Example Words)'),
            const SizedBox(height: 10),
            // Word list Wrap for better spacing
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: examples
                  .map(
                    (ex) => Chip(
                      label: Text("${ex['en']} (${ex['mm']})"),
                      backgroundColor: Colors.blue.withOpacity(0.1),
                    ),
                  )
                  .toList(),
            ),

            const Divider(height: 32),
            _buildSectionTitle('နမူနာဝါကျများ (Sample Sentences)'),
            const SizedBox(height: 10),

            // List of sentences
            ...sentences.map(
              (sent) => Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blueAccent.withOpacity(0.3)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sent['en']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      sent['mm']!,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
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

  Widget _buildSectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.blueAccent,
      ),
    );
  }
}

// QuizPage remains the same as before...
