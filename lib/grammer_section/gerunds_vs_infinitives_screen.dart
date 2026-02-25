

// This is one of the most challenging areas for advanced learners because
// there isn't always a simple "mathematical" rule.
// It often depends on the specific verb that comes before.
// In Burmese, both often translate to "ခြင်း" or "ရန်", but in English,
// using the wrong one can make a sentence sound unnatural.

import 'package:flutter/material.dart';

// Why this is "Advanced":
// Meaning Change Section: This is the hallmark of advanced English.
// Teaching the difference between Stop to smoke vs Stop smoking prevents major communication errors.
//
// Keyword Chips: Instead of just sentences, I’ve extracted the "Trigger Verbs" into visual chips.
// Advanced students often need to memorize these verb patterns.
//
// Concept-Based Logic:
// The "Quick Memory Tip" at the top gives a deeper linguistic insight: Gerunds = Reality/Past, Infinitives = Future/Goal.

class GerundsVsInfinitivesScreen extends StatelessWidget {
  const GerundsVsInfinitivesScreen({super.key});

  final List<Map<String, dynamic>> grammarData = const [
    {
      'type': '1. The Gerund (-ing form)',
      'desc': 'ကြိယာကို နာမ်ကဲ့သို့ အသုံးပြုခြင်းဖြစ်သည်။ အောက်ပါကြိယာများနောက်တွင် Gerund လိုက်ရမည်။',
      'keywords': ['Enjoy', 'Finish', 'Avoid', 'Mind', 'Suggest', 'Keep', 'Practice'],
      'examples': [
        {
          'en': 'I enjoy swimming in the ocean.',
          'mm': 'ကျွန်တော် ပင်လယ်ထဲမှာ ရေကူးရတာကို ပျော်မွေ့ပါတယ်။',
          'note': 'Enjoy + V-ing'
        },
        {
          'en': 'Would you mind closing the window?',
          'mm': 'ပြတင်းပေါက်လေး ပိတ်ပေးလို့ ရမလားခင်ဗျာ။',
          'note': 'Mind + V-ing'
        }
      ]
    },
    {
      'type': '2. The Infinitive (to + verb)',
      'desc': 'ရည်ရွယ်ချက် သို့မဟုတ် အနာဂတ်လုပ်ဆောင်ချက်များအတွက် သုံးသည်။ အောက်ပါကြိယာများနောက်တွင် Infinitive လိုက်ရမည်။',
      'keywords': ['Want', 'Need', 'Decide', 'Hope', 'Promise', 'Plan', 'Agree'],
      'examples': [
        {
          'en': 'I decided to move to a new city.',
          'mm': 'မြို့အသစ်ကို ပြောင်းဖို့ ကျွန်တော် ဆုံးဖြတ်လိုက်တယ်။',
          'note': 'Decide + to V1'
        },
        {
          'en': 'She promised to help me.',
          'mm': 'သူမ ကျွန်တော့်ကို ကူညီမယ်လို့ ကတိပေးခဲ့တယ်။',
          'note': 'Promise + to V1'
        }
      ]
    },
    {
      'type': '3. Meaning Change (အဓိပ္ပာယ်ပြောင်းလဲမှု)',
      'desc': 'အချို့ကြိယာများသည် Gerund သို့မဟုတ် Infinitive သုံးပုံပေါ်မူတည်၍ အဓိပ္ပာယ်ကွဲပြားသွားတတ်သည်။ (အဆင့်မြင့် ကျောင်းသားများအတွက် အလွန်အရေးကြီးသည်)',
      'examples': [
        {
          'en': 'I stopped smoking.',
          'mm': 'ကျွန်တော် ဆေးလိပ်သောက်တာကို လုံးဝဖြတ်လိုက်ပြီ။',
          'note': 'Stop + Gerund = လုပ်လက်စအလုပ်ကို ရပ်တန့်ခြင်း'
        },
        {
          'en': 'I stopped to smoke.',
          'mm': 'ကျွန်တော် ဆေးလိပ်သောက်ဖို့ (လမ်းဘေးမှာ) ခဏရပ်လိုက်တယ်။',
          'note': 'Stop + Infinitive = အခြားအလုပ်တစ်ခုလုပ်ရန် ရပ်တန့်ခြင်း'
        },
        {
          'en': 'I forgot meeting him.',
          'mm': 'သူ့ကိုတွေ့ခဲ့တာကို ကျွန်တော် မေ့သွားတယ်။',
          'note': 'Forgot + Gerund = လုပ်ခဲ့ပြီးသား အတိတ်ကိုမေ့ခြင်း'
        },
        {
          'en': 'I forgot to meet him.',
          'mm': 'သူ့ကိုတွေ့ဖို့ (ချိန်းထားတာကို) ကျွန်တော် မေ့သွားတယ်။',
          'note': 'Forgot + Infinitive = လုပ်ရန်ကျန်ရှိသည်ကို မေ့ခြင်း'
        }
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gerunds vs Infinitives')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildComparisonHeader(),
          const SizedBox(height: 20),
          ...grammarData.map((data) => _buildGrammarCard(data)),
        ],
      ),
    );
  }

  Widget _buildComparisonHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.blue.shade800, Colors.blue.shade500]),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        children: [
          Text("Quick Memory Tip", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
          SizedBox(height: 8),
          Text(
            "Gerunds are often about 'Real/Past' experiences.\nInfinitives are often about 'Future/Potential' actions.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _buildGrammarCard(Map<String, dynamic> data) {
    return Card(
      margin: const EdgeInsets.only(bottom: 24),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data['type'], style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
            const SizedBox(height: 8),
            Text(data['desc'], style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 12),
            if (data.containsKey('keywords'))
              Wrap(
                spacing: 8,
                children: (data['keywords'] as List<String>).map((word) => Chip(
                  label: Text(word, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                  backgroundColor: Colors.blue.shade50,
                )).toList(),
              ),
            const Divider(height: 30),
            ... (data['examples'] as List).map((ex) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(ex['en'], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
                  const SizedBox(height: 4),
                  Text(ex['mm'], style: const TextStyle(fontSize: 14, color: Colors.black54)),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(color: Colors.orange.shade100, borderRadius: BorderRadius.circular(4)),
                    child: Text("💡 ${ex['note']}", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.orange)),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}