import 'package:flutter/material.dart';

// Full Data with Sentences and Highlighting logic
final List<Map<String, dynamic>> partsOfSpeech = const [
  {
    'title': 'နာမ် (Noun)',
    'definition': 'လူ၊ တိရစ္ဆာန်၊ အရာဝတ္ထု၊ နေရာဌာန အမည်များကို နာမ်ဟုခေါ်သည်။',
    'examples': [
      {
        'en': 'Kyaw Kyaw',
        'mm': 'ကျော်ကျော်',
        'sEn': 'Kyaw Kyaw is a good Kyaw student.Kyaw Kyaw',
        'sMm': 'ကျော်ကျော်က ကျောင်းသားကောင်းတစ်ယောက် ဖြစ်ပါတယ်။',
      },
      {
        'en': 'Cat',
        'mm': 'ကြောင်',
        'sEn': 'The cat is sleeping on the mat.',
        'sMm': 'ကြောင်က ဖျာပေါ်မှာ အိပ်နေတယ်။',
      },
      {
        'en': 'Yangon',
        'mm': 'ရန်ကုန်',
        'sEn': 'I live in Yangon.',
        'sMm': 'ကျွန်တော် ရန်ကုန်မှာ နေပါတယ်။',
      },
      {
        'en': 'Apple',
        'mm': 'ပန်းသီး',
        'sEn': 'She is eating an apple.',
        'sMm': 'သူမ ပန်းသီးစားနေပါတယ်။',
      },
      {
        'en': 'Water',
        'mm': 'ရေ',
        'sEn': 'Please give me some water.',
        'sMm': 'ကျွန်တော့်ကို ရေနည်းနည်းပေးပါ။',
      },
    ],
  },
  {
    'title': 'ကြိယာ (Verb)',
    'definition':
        'လုပ်ဆောင်ခြင်း သို့မဟုတ် အခြေအနေကို ဖော်ပြသောစကားလုံးဖြစ်သည်။',
    'examples': [
      {
        'en': 'Eat',
        'mm': 'စားသည်',
        'sEn': 'We eat breakfast every morning.',
        'sMm': 'ကျွန်ုပ်တို့ မနက်တိုင်း မနက်စာ စားကြပါတယ်။',
      },
      {
        'en': 'Go',
        'mm': 'သွားသည်',
        'sEn': 'They go to school by bus.',
        'sMm': 'သူတို့ ကျောင်းကို ဘတ်စ်ကားနဲ့ သွားကြတယ်။',
      },
      {
        'en': 'Sleep',
        'mm': 'အိပ်သည်',
        'sEn': 'The baby will sleep now.',
        'sMm': 'ကလေးက အခု အိပ်ပါတော့မယ်။',
      },
      {
        'en': 'Run',
        'mm': 'ပြေးသည်',
        'sEn': 'He can run very fast.',
        'sMm': 'သူ အလွန်မြန်မြန် ပြေးနိုင်ပါတယ်။',
      },
      {
        'en': 'Speak',
        'mm': 'စကားပြောသည်',
        'sEn': 'Can you speak English?',
        'sMm': 'မင်း အင်္ဂလိပ်စကား ပြောနိုင်လား။',
      },
    ],
  },
  {
    'title': 'နာမဝိသေသန (Adjective)',
    'definition':
        'နာမ် သို့မဟုတ် နာမ်စား၏ အရည်အသွေးကို ထူးခြားအောင် ဖော်ပြသည်။',
    'examples': [
      {
        'en': 'Beautiful',
        'mm': 'လှပသော',
        'sEn': 'This is a beautiful flower.',
        'sMm': 'ဒါက လှပတဲ့ ပန်းလေးတစ်ပွင့်ပါ။',
      },
      {
        'en': 'Big',
        'mm': 'ကြီးသော',
        'sEn': 'That is a big house.',
        'sMm': 'ဟိုဟာ အိမ်ကြီးတစ်လုံးဖြစ်ပါတယ်။',
      },
      {
        'en': 'Smart',
        'mm': 'ထက်မြက်သော',
        'sEn': 'She is a smart girl.',
        'sMm': 'သူမက ထက်မြက်တဲ့ မိန်းကလေးတစ်ယောက်ပါ။',
      },
      {
        'en': 'Red',
        'mm': 'နီသော',
        'sEn': 'I have a red car.',
        'sMm': 'ကျွန်တော့်မှာ အနီရောင် ကားတစ်စီးရှိတယ်။',
      },
      {
        'en': 'Happy',
        'mm': 'ပျော်ရွှင်သော',
        'sEn': 'They look very happy.',
        'sMm': 'သူတို့ ကြည့်ရတာ အရမ်းပျော်နေပုံရတယ်။',
      },
    ],
  },
  // Add other parts similarly following this pattern...
];

class ExamplesSentences extends StatelessWidget {
  const ExamplesSentences({super.key});

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
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    title: item['title'],
                    definition: item['definition'],
                    examples: List<Map<String, String>>.from(item['examples']),
                  ),
                ),
              ),
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

  const DetailPage({
    super.key,
    required this.title,
    required this.definition,
    required this.examples,
  });

  // Function to Highlight the target word in a sentence
  Widget _buildHighlightedSentenceV2(String sentence, String word) {
    // List<String> parts = sentence.split(RegExp('(?i)$word')); // Case-insensitive split
    List<String> parts = sentence.split(RegExp(word, caseSensitive: false));
    if (parts.length < 2) return Text(sentence);

    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.black87, fontSize: 16),
        children: [
          TextSpan(text: parts[0]),
          TextSpan(
            text: word,
            style: const TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
          TextSpan(text: parts[1]),
        ],
      ),
    );
  }

  Widget _buildHighlightedSentence(String sentence, String word) {
    final regex = RegExp(
      RegExp.escape(word), // avoid regex special chars issues
      caseSensitive: false,
    );

    final matches = regex.allMatches(sentence);

    if (matches.isEmpty) return Text(sentence);

    int lastIndex = 0;
    List<TextSpan> spans = [];

    for (final match in matches) {
      // normal text
      if (match.start > lastIndex) {
        spans.add(TextSpan(text: sentence.substring(lastIndex, match.start)));
      }

      // highlighted word
      spans.add(
        TextSpan(
          text: sentence.substring(match.start, match.end),
          style: const TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        ),
      );

      lastIndex = match.end;
    }

    // remaining text
    if (lastIndex < sentence.length) {
      spans.add(TextSpan(text: sentence.substring(lastIndex)));
    }

    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.black87, fontSize: 16),
        children: spans,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Definition',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 8),
          Text(definition, style: const TextStyle(fontSize: 16)),
          const Divider(height: 40),
          const Text(
            'Examples & Usage',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          ...examples.map(
            (ex) => Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue.withOpacity(0.2)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        ex['en']!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "(${ex['mm']!})",
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Divider(thickness: 0.5),
                  ),
                  const Text(
                    "Example Sentence:",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  _buildHighlightedSentence(ex['sEn']!, ex['en']!),
                  const SizedBox(height: 4),
                  Text(
                    ex['sMm']!,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ... Keep QuizPage from previous implementation ...
