import 'package:flutter/material.dart';

class ArticlesDetailScreen extends StatelessWidget {
  const ArticlesDetailScreen({super.key});

  final List<Map<String, dynamic>> articleRules = const [
    {
      'type': 'Indefinite Article: "A"',
      'usage':
          'ဗျည်းသံ (Consonant sound) ဖြင့်စသော နာမ်များရှေ့တွင် သုံးသည်။ (သတ်မှတ်မထားသော အရာတစ်ခု)',
      'formula': 'A + Consonant Sound',
      'examples': [
        {
          'word': 'A doctor',
          'sentence': 'I want to be a doctor.',
          'mm': 'ကျွန်တော် ဆရာဝန်တစ်ယောက် ဖြစ်ချင်တယ်။',
        },
        {
          'word': 'A university',
          'sentence': 'She studies at a university.',
          'mm':
              'သူမ တက္ကသိုလ်တစ်ခုမှာ ပညာသင်ကြားနေတယ်။ (U သည် ဗျည်းသံ "Y" ထွက်သဖြင့် A သုံးသည်)',
        },
      ],
    },
    {
      'type': 'Indefinite Article: "An"',
      'usage':
          'သရသံ (Vowel sound - a, e, i, o, u) ဖြင့်စသော နာမ်များရှေ့တွင် သုံးသည်။',
      'formula': 'An + Vowel Sound',
      'examples': [
        {
          'word': 'An apple',
          'sentence': 'He is eating an apple.',
          'mm': 'သူ ပန်းသီးတစ်လုံး စားနေတယ်။',
        },
        {
          'word': 'An hour',
          'sentence': 'I will wait for an hour.',
          'mm':
              'ကျွန်တော် တစ်နာရီကြာအောင် စောင့်ပါ့မယ်။ (H သည် အသံမထွက်ဘဲ Vowel သံထွက်သဖြင့် An သုံးသည်)',
        },
      ],
    },
    {
      'type': 'Definite Article: "The"',
      'usage':
          'သတ်သတ်မှတ်မှတ်ရှိသော အရာများ၊ ကမ္ဘာပေါ်တွင် တစ်ခုတည်းရှိသောအရာများရှေ့တွင် သုံးသည်။',
      'formula': 'The + Specific Noun',
      'examples': [
        {
          'word': 'The Sun',
          'sentence': 'The sun is very hot.',
          'mm': 'နေသည် အလွန်ပူပြင်းသည်။',
        },
        {
          'word': 'The book',
          'sentence': 'The book on the table is mine.',
          'mm': 'စားပွဲပေါ်က ထိုစာအုပ်က ကျွန်တော့်စာအုပ်ပါ။',
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Articles (A, An, The)')),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: MediaQuery.sizeOf(context).width * 0.05,
        ),
        itemCount: articleRules.length,
        itemBuilder: (context, index) {
          final rule = articleRules[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: _getColor(index), width: 5),
              ),
            ),
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  rule['type'],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: _getColor(index),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  rule['usage'],
                  style: const TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    // color: Colors.grey.shade200,
                    color: Theme.of(
                      context,
                    ).colorScheme.onPrimaryContainer.withAlpha(25),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    rule['formula'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'monospace',
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ...(rule['examples'] as List).map(
                  (ex) => Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ex['word'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.blueGrey,
                          ),
                        ),
                        const SizedBox(height: 4),
                        _buildHighlightedExample(
                          ex['sentence'],
                          ex['word'].split(' ')[0],
                        ),
                        Text(
                          ex['mm'],
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Color _getColor(int index) {
    List<Color> colors = [Colors.blue, Colors.green, Colors.purple];
    return colors[index % colors.length];
  }

  Widget _buildHighlightedExample(String sentence, String article) {
    // Logic to highlight the article in the sentence
    List<String> words = sentence.split(' ');
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.black, fontSize: 15),
        children: words.map((word) {
          bool isArticle = word.toLowerCase() == article.toLowerCase();
          return TextSpan(
            text: '$word ',
            style: TextStyle(
              fontWeight: isArticle ? FontWeight.bold : FontWeight.normal,
              color: isArticle ? Colors.red : Colors.green,
              backgroundColor: isArticle
                  ? Colors.yellow.shade100
                  : Colors.transparent,
            ),
          );
        }).toList(),
      ),
    );
  }
}
