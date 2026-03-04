class SpokenPattern {
  final String title;
  final String burmeseMeaning;
  final String usage;
  final List<PatternExample> examples;

  const SpokenPattern({
    required this.title,
    required this.burmeseMeaning,
    required this.usage,
    required this.examples,
  });
}

class PatternExample {
  final String english;
  final String burmese;

  const PatternExample({required this.english, required this.burmese});
}

final List<SpokenPattern> spokenPatterns = [
  SpokenPattern(
    title: "I'm used to...",
    burmeseMeaning: "ကျင့်သားရနေပြီ",
    usage: "အလေ့အကျင့်ဖြစ်နေသော အရာများကို ပြောဆိုရာတွင် သုံးသည်။",
    examples: [
      PatternExample(english: "I'm used to waking up early.", burmese: "ကျွန်တော် စောစောထရတာ ကျင့်သားရနေပြီ။"),
      PatternExample(english: "I'm used to spicy food.", burmese: "ကျွန်တော် အစပ်စားရတာ ကျင့်သားရနေပြီ။"),
    ],
  ),
  SpokenPattern(
    title: "It's no use...",
    burmeseMeaning: "...လည်း အပိုပဲ / အသုံးမဝင်ဘူး",
    usage: "တစ်ခုခုလုပ်သော်လည်း အကျိုးမရှိတော့ကြောင်း ပြောဆိုရာတွင် သုံးသည်။",
    examples: [
      PatternExample(english: "It's no use crying over spilt milk.", burmese: "လွန်ပြီးတာတွေကို နောင်တရနေလည်း အပိုပဲ။"),
      PatternExample(english: "It's no use trying to convince him.", burmese: "သူ့ကို နားချဖို့ ကြိုးစားနေတာလည်း အပိုပါပဲ။"),
    ],
  ),
  SpokenPattern(
    title: "I'm about to...",
    burmeseMeaning: "...တော့မလို့ / ...တော့မယောင်",
    usage: "ချက်ချင်းလုပ်တော့မည့် အပြုအမူကို ပြောဆိုရာတွင် သုံးသည်။",
    examples: [
      PatternExample(english: "I'm about to go out.", burmese: "ကျွန်တော် အပြင်သွားတော့မလို့။"),
      PatternExample(english: "The movie is about to start.", burmese: "ရုပ်ရှင်က စတော့မယ်။"),
    ],
  ),
  SpokenPattern(
    title: "How about...?",
    burmeseMeaning: "...ရင် ဘယ်လိုလဲ? / ...မလား?",
    usage: "အကြံပြုချက် (သို့) တောင်းဆိုချက်များအတွက် သုံးသည်။",
    examples: [
      PatternExample(english: "How about going for a walk?", burmese: "လမ်းလျှောက်ထွက်ရင် ဘယ်လိုလဲ?"),
      PatternExample(english: "How about some coffee?", burmese: "ကော်ဖီသောက်မလား?"),
    ],
  ),
];