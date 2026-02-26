import 'package:flutter/material.dart';

class NeedCustomAppScreen extends StatelessWidget {
  const NeedCustomAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController requirementController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("စိတ်ကြိုက် Application အပ်နှံရန် 💼")),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 16,
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: ListView(
            children: [
              const Text(
                "သင့်လုပ်ငန်းအတွက် စိတ်ကြိုက် Application တစ်ခု ဖန်တီးချင်ပါသလား?"
                "အောက်ပါအချက်အလက်များကို ဖြည့်စွက်ပေးပါ။ ကျွန်ုပ်တို့ဘက်မှ ပြန်လည်ဆက်သွယ်ပေးပါမည်။",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "အမည်",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "အီးမေး အကောင့်",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: requirementController,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: "သင့်လိုအပ်ချက်များကို ဖော်ပြပေးပါ",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  if (nameController.text.isNotEmpty &&
                      emailController.text.isNotEmpty &&
                      requirementController.text.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("တောင်းဆိုမှု ပေးပို့ပြီးပါပြီ။"),
                      ),
                    );
                    nameController.clear();
                    emailController.clear();
                    requirementController.clear();
                  }
                },
                icon: const Icon(Icons.send),
                label: const Text("တောင်းဆိုမှု ပေးပို့ရန်"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
