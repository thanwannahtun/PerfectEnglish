import 'package:flutter/material.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController feedbackController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("အကြံပြုချက် ✍️")),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 16,
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: Column(
            spacing: 8,
            children: [
              const Text(
                "သင့်ရဲ့ ထင်မြင်ယူဆချက်တွေကို ကြားသိရဖို့ စိတ်အားထက်သန်နေပါတယ်။ အကြံဉာဏ်သစ်တွေဖြစ်ဖြစ်၊ ကြုံတွေ့နေရတဲ့ အခက်အခဲတွေကိုဖြစ်ဖြစ် ဝေမျှပေးနိုင်ပါတယ်။",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: feedbackController,
                maxLines: 6,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "ဤနေရာတွင် အကြံပြုချက် ရေးသားပါ...",
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  if (feedbackController.text.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("အကြံပြုချက် ပေးပို့ပြီးပါပြီ။!"),
                      ),
                    );
                    feedbackController.clear();
                  }
                },
                icon: const Icon(Icons.send),
                label: const Text("အကြံပြုချက် ပေးပို့ရန်"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
