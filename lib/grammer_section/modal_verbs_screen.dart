

import 'package:flutter/material.dart';

class ModalVerb {
  final String verb;
  final String burmeseMeaning;
  final String usage;
  final List<ModalExample> examples;

  const ModalVerb({
    required this.verb,
    required this.burmeseMeaning,
    required this.usage,
    required this.examples,
  });
}

class ModalExample {
  final String sentenceEn;
  final String sentenceMm;
  final String context; // e.g., "Permission", "Ability"

  const ModalExample({
    required this.sentenceEn,
    required this.sentenceMm,
    required this.context,
  });
}
final List<ModalVerb> modalVerbsList = [
  ModalVerb(
    verb: "Can / Could",
    burmeseMeaning: "...နိုင်သည် / ...နိုင်ခဲ့သည်",
    usage: "စွမ်းဆောင်ရည် (Ability)၊ ခွင့်ပြုချက် (Permission) နှင့် ဖြစ်နိုင်ခြေများကို ဖော်ပြရာတွင် သုံးသည်။",
    examples: [
      ModalExample(sentenceEn: "I can speak English.", sentenceMm: "ကျွန်တော် အင်္ဂလိပ်စကား ပြောနိုင်သည်။", context: "Ability"),
      ModalExample(sentenceEn: "Could you help me?", sentenceMm: "ကျွန်တော့်ကို ကူညီနိုင်မလားခင်ဗျာ။", context: "Polite Request"),
    ],
  ),
  ModalVerb(
    verb: "Must",
    burmeseMeaning: "...ရမည် (မဖြစ်မနေ)",
    usage: "တာဝန်ဝတ္တရား (Obligation) နှင့် ခိုင်မာသော အကြံပေးချက်များတွင် သုံးသည်။",
    examples: [
      ModalExample(sentenceEn: "You must wear a helmet.", sentenceMm: "မင်း ဆိုင်ကယ်ဦးထုပ် မဖြစ်မနေ ဆောင်းရမည်။", context: "Obligation"),
      ModalExample(sentenceEn: "I must go now.", sentenceMm: "ကျွန်တော် အခုသွားမှ ဖြစ်တော့မည်။", context: "Necessity"),
    ],
  ),
  ModalVerb(
    verb: "May / Might",
    burmeseMeaning: "...ကောင်း...နိုင်သည် (ဖြစ်နိုင်ခြေ)",
    usage: "ဖြစ်နိုင်ခြေ (Possibility) နှင့် ယဉ်ကျေးစွာ ခွင့်တောင်းခြင်းများတွင် သုံးသည်။",
    examples: [
      ModalExample(sentenceEn: "It may rain today.", sentenceMm: "ဒီနေ့ မိုးရွာနိုင်ချေရှိသည်။", context: "Possibility"),
      ModalExample(sentenceEn: "May I come in?", sentenceMm: "ကျွန်တော် ဝင်ခွင့်ပြုမလားခင်ဗျာ။", context: "Permission"),
    ],
  ),
  ModalVerb(
    verb: "Should",
    burmeseMeaning: "...သင့်သည်",
    usage: "အကြံပေးခြင်း (Advice) နှင့် သင့်တော်လျောက်ပတ်မှုများကို ဖော်ပြရာတွင် သုံးသည်။",
    examples: [
      ModalExample(sentenceEn: "You should see a doctor.", sentenceMm: "မင်း ဆရာဝန်နဲ့ ပြသင့်တယ်။", context: "Advice"),
      ModalExample(sentenceEn: "We should be kind to animals.", sentenceMm: "ကျွန်ုပ်တို့ တိရစ္ဆာန်တွေအပေါ် ကြင်နာသင့်သည်။", context: "Opinion"),
    ],
  ),
];



class ModalVerbsScreen extends StatelessWidget {
  const ModalVerbsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Modal Verbs (အကူကြိယာများ)')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: modalVerbsList.length,
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final modal = modalVerbsList[index];
          return ListTile(
            tileColor: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Text(modal.verb, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
            subtitle: Text(modal.burmeseMeaning),
            trailing: const Icon(Icons.arrow_right_alt),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ModalDetailScreen(modal: modal)),
            ),
          );
        },
      ),
    );
  }
}


class ModalDetailScreen extends StatelessWidget {
  final ModalVerb modal;
  const ModalDetailScreen({super.key, required this.modal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${modal.verb} Usage")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildInfoBox(context),
          const SizedBox(height: 25),
          const Text("Example Sentences", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          ...modal.examples.map((ex) => _buildModernExampleTile(ex, context)).toList(),
        ],
      ),
    );
  }

  Widget _buildInfoBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Usage Guide", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(modal.usage, style: const TextStyle(height: 1.5)),
        ],
      ),
    );
  }

  Widget _buildModernExampleTile(ModalExample ex, BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Chip(
                label: Text(ex.context, style: const TextStyle(fontSize: 10)),
                visualDensity: VisualDensity.compact,
              ),
            ),
            Text(ex.sentenceEn, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 5),
            Text(ex.sentenceMm, style: TextStyle(color: Colors.grey.shade600)),
          ],
        ),
      ),
    );
  }
}