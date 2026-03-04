class SpokenPattern {
  final String title;
  final String burmeseMeaning;
  final String usage;
  final List<Map<String, String>> examples;

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

class SpokenPatternCategory {
  final String title;
  final List<SpokenPattern> patterns;

  const SpokenPatternCategory({required this.title, required this.patterns});
}

final List<SpokenPatternCategory> spokenCategories = [
  SpokenPatternCategory(
    title: "General Patterns",
    patterns: [
      SpokenPattern(
        title: "I'm used to...",
        burmeseMeaning: "ကျင့်သားရနေပြီ",
        usage:
            "အတိတ်ကနေ အခုထိ ထပ်တလဲလဲလုပ်လာခဲ့လို့ အသားကျနေပြီဖြစ်တဲ့ အခြေအနေမျိုးမှာ သုံးပါတယ်။ (Be used to + Noun/V-ing)",
        examples: [
          // --- Original 2 ---
          {
            "english": "I'm used to waking up early.",
            "burmese": "ကျွန်တော် စောစောထရတာ ကျင့်သားရနေပြီ။",
          },
          {
            "english": "I'm used to spicy food.",
            "burmese": "ကျွန်တော် အစပ်စားရတာ ကျင့်သားရနေပြီ။",
          },

          // --- 15 New Examples ---
          {
            "english": "I'm used to driving in heavy traffic.",
            "burmese":
                "ယာဉ်ကြောပိတ်ဆို့မှုထဲ ကားမောင်းရတာ ကျွန်တော် ကျင့်သားရနေပြီ။",
          },
          {
            "english": "I'm used to the cold weather here.",
            "burmese": "ဒီက အေးတဲ့ရာသီဥတုကို ကျွန်တော် အသားကျနေပါပြီ။",
          },
          {
            "english": "I'm used to working late at night.",
            "burmese": "ညဥ့်နက်ထိ အလုပ်လုပ်ရတာ ကျွန်တော် ကျင့်သားရနေပြီ။",
          },
          {
            "english": "I'm used to living alone.",
            "burmese": "တစ်ယောက်ထဲ နေရတာ ကျွန်တော် ကျင့်သားရနေပြီ။",
          },
          {
            "english": "I'm used to his bad temper.",
            "burmese": "သူ့ရဲ့ စိတ်တိုတတ်တဲ့ အကျင့်ကို ကျွန်တော် အသားကျနေပြီ။",
          },
          {
            "english": "I'm used to speaking in front of many people.",
            "burmese": "လူအများရှေ့မှာ စကားပြောရတာ ကျွန်တော် ကျင့်သားရနေပြီ။",
          },
          {
            "english": "I'm used to using this software.",
            "burmese": "ဒီဆော့ဝဲလ်ကို သုံးရတာ ကျွန်တော် ကျင့်သားရနေပြီ။",
          },
          {
            "english": "I'm used to noisy environments.",
            "burmese": "ဆူညံတဲ့ ပတ်ဝန်းကျင်တွေကို ကျွန်တော် အသားကျနေပြီ။",
          },
          {
            "english": "I'm used to taking the bus to work.",
            "burmese": "အလုပ်ကို ဘတ်စ်ကားနဲ့သွားရတာ ကျွန်တော် ကျင့်သားရနေပြီ။",
          },
          {
            "english": "I'm used to eating healthy food.",
            "burmese":
                "ကျန်းမာရေးနဲ့ညီညွတ်တဲ့ အစားအစာတွေစားရတာ ကျွန်တော် အသားကျနေပြီ။",
          },

          {
            "english": "I'm used to long meetings.",
            "burmese": "ကြာရှည်တဲ့ အစည်းအဝေးတွေကို ကျွန်တော် အသားကျနေပါပြီ။",
          },
          {
            "english": "I'm used to working under pressure.",
            "burmese": "ဖိအားအောက်မှာ အလုပ်လုပ်ရတာ ကျွန်တော် ကျင့်သားရနေပြီ။",
          },
          {
            "english": "I'm used to sleeping on the floor.",
            "burmese": "ကြမ်းပြင်ပေါ်မှာ အိပ်ရတာ ကျွန်တော် ကျင့်သားရနေပြီ။",
          },
          {
            "english": "I'm used to the smell of this factory.",
            "burmese": "ဒီစက်ရုံက အနံ့ကို ကျွန်တော် အသားကျနေပြီ။",
          },
          {
            "english": "I'm used to hard work.",
            "burmese":
                "ပင်ပင်ပန်းပန်း အလုပ်လုပ်ရတာကို ကျွန်တော် ကျင့်သားရနေပြီ။",
          },
        ],
      ),
      SpokenPattern(
        title: "It's no use...",
        burmeseMeaning: "...လည်း အပိုပဲ / အသုံးမဝင်ဘူး",
        usage:
            "တစ်ခုခုလုပ်သော်လည်း အကျိုးမရှိတော့ကြောင်း (သို့) အရာမထင်တော့ကြောင်း ဖော်ပြရာတွင် သုံးသည်။ (It's no use + V-ing)",
        examples: [
          // --- Original 2 ---
          {
            "english": "It's no use crying over spilt milk.",
            "burmese": "လွန်ပြီးတာတွေကို နောင်တရနေလည်း အပိုပဲ။",
          },
          {
            "english": "It's no use trying to convince him.",
            "burmese": "သူ့ကို နားချဖို့ ကြိုးစားနေတာလည်း အပိုပါပဲ။",
          },

          // --- 15 New Examples ---
          {
            "english": "It's no use complaining about the weather.",
            "burmese": "ရာသီဥတုအကြောင်း ညည်းတွားနေလည်း အပိုပါပဲ။",
          },
          {
            "english": "It's no use waiting for him any longer.",
            "burmese": "သူ့ကို ဆက်စောင့်နေလည်း အကျိုးမရှိတော့ပါဘူး။",
          },
          {
            "english": "It's no use worrying about things you can't change.",
            "burmese":
                "ကိုယ်မပြောင်းလဲနိုင်တဲ့ အရာတွေအတွက် စိတ်ပူနေလည်း အပိုပဲ။",
          },
          {
            "english": "It's no use arguing with her when she's angry.",
            "burmese": "သူစိတ်တိုနေချိန်မှာ ငြင်းခုံနေတာ အလကားပါပဲ။",
          },
          {
            "english": "It's no use calling him; his phone is off.",
            "burmese": "သူ့ဖုန်းပိတ်ထားတာမို့လို့ ဖုန်းခေါ်နေလည်း အပိုပါပဲ။",
          },
          {
            "english": "It's no use pretending that everything is okay.",
            "burmese": "အားလုံးအဆင်ပြေပါတယ်လို့ ဟန်ဆောင်နေလည်း အပိုပဲ။",
          },
          {
            "english": "It's no use asking for a refund now.",
            "burmese": "အခုချိန်မှာ ပိုက်ဆံပြန်တောင်းနေလည်း အသုံးမဝင်တော့ဘူး။",
          },
          {
            "english": "It's no use running; we already missed the bus.",
            "burmese": "ဘတ်စ်ကားလွတ်သွားပြီမို့လို့ ပြေးနေလည်း အပိုပါပဲ။",
          },
          {
            "english": "It's no use keeping old clothes you never wear.",
            "burmese":
                "ဘယ်တော့မှမဝတ်တဲ့ အဝတ်ဟောင်းတွေကို သိမ်းထားတာ အကျိုးမရှိပါဘူး။",
          },
          {
            "english": "It's no use hiding the truth from your parents.",
            "burmese": "မိဘတွေကို အမှန်တရား ဖုံးကွယ်ထားလည်း အပိုပါပဲ။",
          },
          {
            "english": "It's no use buying a new car if you can't drive.",
            "burmese": "ကားမမောင်းတတ်ရင် ကားအသစ်ဝယ်တာ အပိုပဲ။",
          },
          {
            "english": "It's no use trying to fix this old computer.",
            "burmese": "ဒီကွန်ပျူတာအဟောင်းကို ပြင်ဖို့ ကြိုးစားနေတာ အလကားပါပဲ။",
          },
          {
            "english": "It's no use getting upset over small mistakes.",
            "burmese": "အမှားသေးသေးလေးတွေအတွက် စိတ်တိုနေတာ အပိုပဲ။",
          },
          {
            "english": "It's no use explaining it to someone who won't listen.",
            "burmese": "နားမထောင်ချင်တဲ့လူကို ရှင်းပြနေတာ အသုံးမဝင်ပါဘူး။",
          },
          {
            "english": "It's no use regretful of the past.",
            "burmese": "အတိတ်ကို နောင်တရနေလည်း အပိုပါပဲ။",
          },
        ],
      ),
      SpokenPattern(
        title: "I'm about to...",
        burmeseMeaning: "...တော့မလို့ / ...တော့မယောင်",
        usage:
            "အခုချက်ချင်း (သို့မဟုတ်) ခဏနေရင် ဖြစ်ပျက်တော့မယ့် အခြေအနေမျိုးမှာ သုံးပါတယ်။ (Be about to + Verb)",
        examples: [
          // --- Original 2 ---
          {
            "english": "I'm about to go out.",
            "burmese": "ကျွန်တော် အပြင်သွားတော့မလို့။",
          },
          {
            "english": "The movie is about to start.",
            "burmese": "ရုပ်ရှင်က စတော့မယ်။",
          },

          // --- 15 New Examples ---
          {
            "english": "I'm about to eat lunch.",
            "burmese": "ကျွန်တော် နေ့လည်စာ စားတော့မလို့။",
          },
          {
            "english": "I'm about to call you.",
            "burmese": "ကျွန်တော် ခင်ဗျားကို ဖုန်းခေါ်တော့မလို့ပဲ ရှိသေးတယ်။",
          },
          {
            "english": "The shop is about to close.",
            "burmese": "ဆိုင်က ပိတ်တော့မယ်။",
          },
          {
            "english": "I'm about to leave the office.",
            "burmese": "ကျွန်တော် ရုံးကနေ ထွက်တော့မလို့။",
          },
          {
            "english": "It looks like it's about to rain.",
            "burmese": "မိုးရွာတော့မယ့်ပုံပဲ။",
          },
          {
            "english": "I'm about to send the email.",
            "burmese": "ကျွန်တော် အီးမေးလ် ပို့တော့မလို့။",
          },
          {
            "english": "The train is about to arrive.",
            "burmese": "ရထား ဆိုက်တော့မယ်။",
          },
          {
            "english": "I'm about to go to bed.",
            "burmese": "ကျွန်တော် အိပ်တော့မလို့။",
          },
          {
            "english": "They are about to sign the contract.",
            "burmese": "သူတို့ စာချုပ် လက်မှတ်ထိုးတော့မယ်။",
          },
          {
            "english": "I'm about to finish my homework.",
            "burmese": "ကျွန်တော် အိမ်စာ ပြီးတော့မယ်။",
          },
          {
            "english": "The meeting is about to end.",
            "burmese": "အစည်းအဝေး ပြီးတော့မယ်။",
          },
          {
            "english": "I was about to say the same thing.",
            "burmese": "ကျွန်တော်လည်း အဲ့ဒါပဲ ပြောတော့မလို့။",
          },
          {
            "english": "Wait! The water is about to boil.",
            "burmese": "နေဦး! ရေက ပွက်တော့မယ်။",
          },
          {
            "english": "I'm about to start my presentation.",
            "burmese": "ကျွန်တော် စာတမ်းဖတ်ပွဲ စတော့မလို့။",
          },
          {
            "english": "The baby is about to cry.",
            "burmese": "ကလေးက ငိုတော့မယ်။",
          },
        ],
      ),
      SpokenPattern(
        title: "How about...?",
        burmeseMeaning: "...ရင် ဘယ်လိုလဲ? / ...မလား?",
        usage:
            "အကြံပြုချက်ပေးခြင်း (Suggestion)၊ ကမ်းလှမ်းခြင်း (Offer) နဲ့ တခြားလူရဲ့ သဘောထားကို မေးမြန်းတဲ့အခါ သုံးပါတယ်။ (How about + V-ing/Noun)",
        examples: [
          // --- Original 2 ---
          {
            "english": "How about going for a walk?",
            "burmese": "လမ်းလျှောက်ထွက်ရင် ဘယ်လိုလဲ?",
          },
          {"english": "How about some coffee?", "burmese": "ကော်ဖီသောက်မလား?"},

          // --- 15 New Examples ---
          {
            "english": "How about watching a movie tonight?",
            "burmese": "ဒီည ရုပ်ရှင်ကြည့်ရင် ဘယ်လိုလဲ?",
          },
          {
            "english": "How about this red shirt?",
            "burmese": "ဒီအင်္ကျီအနီလေးဆိုရင် ဘယ်လိုလဲ? (သဘောကျလား?)",
          },
          {
            "english": "How about meeting at 5 PM?",
            "burmese": "ညနေ ၅ နာရီမှာ ဆုံကြရင် ဘယ်လိုလဲ?",
          },
          {
            "english": "How about going to Bagan for our holiday?",
            "burmese": "အားလပ်ရက်မှာ ပုဂံသွားရင် ဘယ်လိုလဲ?",
          },
          {
            "english": "How about a pizza for dinner?",
            "burmese": "ညစာအတွက် ပီဇာစားမလား?",
          },
          {
            "english": "How about trying a different restaurant?",
            "burmese": "တခြားစားသောက်ဆိုင်တစ်ခုမှာ စားကြည့်ရင် ဘယ်လိုလဲ?",
          },
          {
            "english": "How about staying at home today?",
            "burmese": "ဒီနေ့ အိမ်မှာပဲ နားရင် ဘယ်လိုလဲ?",
          },
          {
            "english": "How about asking the teacher for help?",
            "burmese": "ဆရာ့ကို အကူအညီတောင်းကြည့်ရင် ဘယ်လိုလဲ?",
          },
          {
            "english": "How about a game of chess?",
            "burmese": "ချက်စ် (Chess) ကစားမလား?",
          },
          {
            "english": "How about changing the plan?",
            "burmese": "အစီအစဉ်ကို ပြောင်းလိုက်ရင် ဘယ်လိုလဲ?",
          },
          {
            "english": "How about taking a taxi instead of the bus?",
            "burmese": "ဘတ်စ်ကားအစား တက္ကစီစီးရင် ဘယ်လိုလဲ?",
          },
          {
            "english": "How about buying a gift for her birthday?",
            "burmese": "သူမရဲ့ မွေးနေ့အတွက် လက်ဆောင်ဝယ်ပေးရင် ဘယ်လိုလဲ?",
          },
          {
            "english": "How about reading a book before bed?",
            "burmese": "မအိပ်ခင် စာဖတ်ရင် ဘယ်လိုလဲ?",
          },
          {
            "english": "How about we share the bill?",
            "burmese": "ဘေလ် (Bill) ကို ခွဲရှင်းရင် ဘယ်လိုလဲ?",
          },
          {
            "english": "How about a little more sugar in your tea?",
            "burmese": "လက်ဖက်ရည်ထဲ သကြားနည်းနည်း ထပ်ထည့်မလား?",
          },
        ],
      ),
    ],
  ),
  SpokenPatternCategory(
    title: "1. Professional & Business",
    patterns: [
      SpokenPattern(
        title: "I'm looking forward to...",
        burmeseMeaning: "...ဖို့ မျှော်လင့်နေပါတယ် / စောင့်စားနေပါတယ်",
        usage:
            "နောင်ဖြစ်လာမယ့် အရာတစ်ခုကို ဝမ်းမြောက်ဝမ်းသာ စောင့်ဆိုင်းနေကြောင်း ဖော်ပြရာတွင် သုံးသည်။ (Be looking forward to + V-ing/Noun)",
        examples: [
          {
            "english": "I'm looking forward to meeting you.",
            "burmese": "ခင်ဗျားနဲ့ ဆုံရဖို့ မျှော်လင့်နေပါတယ်။",
          },
          {
            "english": "I'm looking forward to the weekend.",
            "burmese": "ပိတ်ရက်ကို စောင့်မျှော်နေပါတယ်။",
          },
          {
            "english": "We are looking forward to your reply.",
            "burmese": "ခင်ဗျားရဲ့ အကြောင်းပြန်ချက်ကို စောင့်စားနေပါတယ်။",
          },
          {
            "english": "I'm looking forward to starting my new job.",
            "burmese": "အလုပ်သစ်စရမှာကို စိတ်လှုပ်ရှားစွာ စောင့်မျှော်နေပါတယ်။",
          },
          {
            "english": "She's looking forward to visiting Bagan.",
            "burmese": "သူမ ပုဂံကို သွားလည်ဖို့ မျှော်လင့်နေတယ်။",
          },
          {
            "english": "I'm looking forward to the concert tonight.",
            "burmese": "ဒီည ဖျော်ဖြေပွဲကို အရမ်းကြည့်ချင်နေပြီ။",
          },
          {
            "english": "We're looking forward to working with you.",
            "burmese": "ခင်ဗျားနဲ့ လက်တွဲလုပ်ကိုင်ဖို့ မျှော်လင့်နေပါတယ်။",
          },
          {
            "english": "I'm looking forward to graduation.",
            "burmese": "ဘွဲ့နှင်းသဘင် အခမ်းအနားကို စောင့်မျှော်နေပါတယ်။",
          },
          {
            "english": "They are looking forward to the holidays.",
            "burmese": "သူတို့ အားလပ်ရက်ကို စောင့်မျှော်နေကြတယ်။",
          },
          {
            "english": "I'm looking forward to seeing my family.",
            "burmese": "မိသားစုနဲ့ ပြန်ဆုံဖို့ မျှော်လင့်နေပါတယ်။",
          },
          {
            "english": "I'm looking forward to hearing from you soon.",
            "burmese": "ခင်ဗျားဆီက သတင်းစကားကြားရဖို့ မျှော်လင့်နေပါတယ်။",
          },
          {
            "english": "He's looking forward to his birthday party.",
            "burmese": "သူ့မွေးနေ့ပွဲအတွက် သူစိတ်လှုပ်ရှားနေတယ်။",
          },
          {
            "english": "I'm looking forward to a relaxing evening.",
            "burmese": "အေးအေးဆေးဆေး နားရမယ့် ညနေခင်းကို စောင့်မျှော်နေပါတယ်။",
          },
          {
            "english": "We are looking forward to the grand opening.",
            "burmese": "ဖွင့်ပွဲအခမ်းအနားကို မျှော်လင့်စောင့်စားနေပါတယ်။",
          },
          {
            "english": "I'm looking forward to trying this new recipe.",
            "burmese":
                "ဒီဟင်းချက်နည်းအသစ်ကို စမ်းချက်ကြည့်ဖို့ စိတ်စောနေပါတယ်။",
          },
        ],
      ),
      SpokenPattern(
        title: "I was wondering if...",
        burmeseMeaning: "...မလားလို့ စဉ်းစားနေမိတယ် / ...ပေးနိုင်မလားလို့ပါ",
        usage:
            "ယဉ်ကျေးစွာ အကူအညီတောင်းခံခြင်း သို့မဟုတ် အကြံပြုခြင်းများတွင် အလွန်သုံးဝင်သည်။",
        examples: [
          {
            "english": "I was wondering if you could help me.",
            "burmese": "ကျွန်တော့်ကို ကူညီပေးနိုင်မလားလို့ စဉ်းစားနေမိလို့ပါ။",
          },
          {
            "english": "I was wondering if you are free tonight.",
            "burmese": "ဒီည ခင်ဗျား အားမလားလို့ သိချင်လို့ပါ။",
          },
          {
            "english": "I was wondering if I could borrow your pen.",
            "burmese": "ခင်ဗျားရဲ့ ဖောင်တိန်လေး ခဏငှားလို့ရမလားလို့ပါ။",
          },
          {
            "english": "I was wondering if we could reschedule the meeting.",
            "burmese":
                "အစည်းအဝေးအချိန် ပြောင်းလို့ရမလားလို့ စဉ်းစားနေမိလို့ပါ။",
          },
          {
            "english": "I was wondering if you'd like to join us for dinner.",
            "burmese":
                "ကျွန်တော်တို့နဲ့အတူ ညစာစားဖို့ လိုက်မလားလို့ မေးကြည့်တာပါ။",
          },
          {
            "english": "I was wondering if there are any vacancies.",
            "burmese": "ဒီမှာ အလုပ်နေရာလွတ် ရှိမလားလို့ သိချင်လို့ပါ။",
          },
          {
            "english": "I was wondering if I should bring anything.",
            "burmese": "ကျွန်တော် ဘာမဆို ယူလာပေးရမလားလို့ စဉ်းစားနေတာပါ။",
          },
          {
            "english": "I was wondering if you've seen my keys.",
            "burmese":
                "ကျွန်တော့်သော့တွေကို ခင်ဗျားတွေ့မိလားလို့ မေးကြည့်တာပါ။",
          },
          {
            "english": "I was wondering if you could explain this to me.",
            "burmese": "ဒါလေးကို ကျွန်တော့်ကို ရှင်းပြပေးနိုင်မလားလို့ပါ။",
          },
          {
            "english": "I was wondering if it's okay to park here.",
            "burmese": "ဒီမှာ ကားရပ်လို့ အဆင်ပြေပါ့မလားလို့ သိချင်လို့ပါ။",
          },
          {
            "english": "I was wondering if you had a moment to talk.",
            "burmese": "စကားခဏပြောဖို့ အချိန်ရမလားလို့ စဉ်းစားနေမိလို့ပါ။",
          },
          {
            "english": "I was wondering if you knew a good doctor.",
            "burmese": "ဆရာဝန်ကောင်းကောင်း သိမလားလို့ မေးကြည့်တာပါ။",
          },
          {
            "english": "I was wondering if the price is negotiable.",
            "burmese": "ဈေးနှုန်းကို ညှိနှိုင်းလို့ရမလားလို့ သိချင်လို့ပါ။",
          },
          {
            "english": "I was wondering if I could leave a message.",
            "burmese": "စကားပါးခဲ့လို့ ရမလားလို့ စဉ်းစားနေမိလို့ပါ။",
          },
          {
            "english": "I was wondering if you'd like to go for a coffee.",
            "burmese": "ကော်ဖီသောက်ဖို့ လိုက်မလားလို့ မေးကြည့်တာပါ။",
          },
        ],
      ),
      SpokenPattern(
        title: "I'll get back to you on...",
        burmeseMeaning:
            "...နဲ့ပတ်သက်ပြီး (အဖြေ/အကြောင်းပြန်ချက်) ပြန်ပြောပေးပါ့မယ်",
        usage:
            "ချက်ချင်းအဖြေမပေးနိုင်သေးတဲ့ကိစ္စကို နောက်မှပြန်ပြောမယ်လို့ ယဉ်ကျေးစွာကတိပေးတဲ့အခါ သုံးပါတယ်။",
        examples: [
          {
            "english": "I'll get back to you on that as soon as possible.",
            "burmese":
                "အဲ့ဒီကိစ္စနဲ့ ပတ်သက်ပြီး အမြန်ဆုံး အကြောင်းပြန်ပေးပါ့မယ်။",
          },
          {
            "english": "I'll get back to you on the final price tomorrow.",
            "burmese": "နောက်ဆုံးဈေးနှုန်းကို မနက်ဖြန်ကျရင် ပြန်ပြောပေးပါ့မယ်။",
          },
          {
            "english": "I'll get back to you on the meeting details later.",
            "burmese": "အစည်းအဝေး အသေးစိတ်ကို နောက်မှ ပြန်ပြောပေးပါ့မယ်။",
          },
          {
            "english":
                "Let me check my schedule, and I'll get back to you on that.",
            "burmese":
                "ကျွန်တော့် အချိန်ဇယားကို စစ်ကြည့်ပြီးမှ ပြန်ပြောပေးပါ့မယ်။",
          },
          {
            "english": "I'll get back to you on your request by Monday.",
            "burmese":
                "ခင်ဗျားရဲ့ တောင်းဆိုချက်ကို တနင်္လာနေ့ကျမှ အကြောင်းပြန်ပေးပါ့မယ်။",
          },
          {
            "english": "I'll get back to you on the availability of the rooms.",
            "burmese": "အခန်းလွတ်ရှိမရှိကို ကျွန်တော် ပြန်ပြောပေးပါ့မယ်။",
          },
          {
            "english": "I'll get back to you on the technical issues shortly.",
            "burmese":
                "နည်းပညာပိုင်းဆိုင်ရာ ပြဿနာတွေကို ခဏနေရင် ပြန်ပြောပေးပါ့မယ်။",
          },
          {
            "english": "I'll get back to you on his contact information.",
            "burmese":
                "သူ့ရဲ့ ဆက်သွယ်ရန်လိပ်စာကို ကျွန်တော် ပြန်ပြောပေးပါ့မယ်။",
          },
          {
            "english":
                "I'll get back to you on whether I can attend the party.",
            "burmese": "ပွဲတက်နိုင်မတက်နိုင်ကို ကျွန်တော် ပြန်ပြောပေးပါ့မယ်။",
          },
          {
            "english": "I'll get back to you on the shipment status.",
            "burmese": "ပစ္စည်းပို့ဆောင်မှု အခြေအနေကို ပြန်ပြောပေးပါ့မယ်။",
          },
          {
            "english": "I'll get back to you on the design changes.",
            "burmese":
                "ဒီဇိုင်းအပြောင်းအလဲတွေနဲ့ ပတ်သက်ပြီး ပြန်ပြောပေးပါ့မယ်။",
          },
          {
            "english":
                "I'll get back to you on the interview results next week.",
            "burmese":
                "အင်တာဗျူးရလဒ်တွေကို နောက်အပတ်မှာ အကြောင်းပြန်ပေးပါ့မယ်။",
          },
          {
            "english": "I'll get back to you on the venue for the wedding.",
            "burmese": "မင်္ဂလာဆောင်ကျင်းပမယ့် နေရာကို ပြန်ပြောပေးပါ့မယ်။",
          },
          {
            "english": "I'll get back to you on the cost estimate.",
            "burmese": "ကုန်ကျစရိတ် ခန့်မှန်းခြေကို ပြန်ပြောပေးပါ့မယ်။",
          },
          {
            "english": "I'll get back to you on the progress of the project.",
            "burmese": "စီမံကိန်းရဲ့ တိုးတက်မှုအခြေအနေကို ပြန်ပြောပေးပါ့မယ်။",
          },
        ],
      ),
      SpokenPattern(
        title: "Could you walk me through...?",
        burmeseMeaning: "...ကို တစ်ဆင့်ချင်း (သေချာလေး) ရှင်းပြပေးလို့ရမလား?",
        usage:
            "လုပ်ငန်းစဉ်တစ်ခုခု ဒါမှမဟုတ် အစီအစဉ်တစ်ခုကို အသေးစိတ်နားလည်ချင်တဲ့အခါ Native တွေအသုံးများတဲ့ ပုံစံပါ။",
        examples: [
          {
            "english": "Could you walk me through the new project plan?",
            "burmese":
                "စီမံကိန်းအသစ်ရဲ့ အစီအစဉ်ကို တစ်ဆင့်ချင်း ရှင်းပြပေးလို့ရမလား?",
          },
          {
            "english": "Could you walk me through the registration process?",
            "burmese":
                "စာရင်းသွင်းတဲ့ လုပ်ငန်းစဉ်ကို သေချာလေး ရှင်းပြပေးလို့ရမလား?",
          },
          {
            "english": "Could you walk me through how to use this app?",
            "burmese":
                "ဒီအက်ပ်ကို ဘယ်လိုသုံးရမလဲဆိုတာ တစ်ဆင့်ချင်း ပြပေးလို့ရမလား?",
          },
          {
            "english":
                "Could you walk me through your decision-making process?",
            "burmese":
                "ခင်ဗျား ဘယ်လိုမျိုး ဆုံးဖြတ်ချက်ချခဲ့လဲဆိုတာ အသေးစိတ် ရှင်းပြပေးလို့ရမလား?",
          },
          {
            "english": "Could you walk me through the contract details?",
            "burmese":
                "စာချုပ်ပါ အချက်အလက်တွေကို တစ်ခုချင်း ရှင်းပြပေးလို့ရမလား?",
          },
          {
            "english":
                "Could you walk me through the steps for troubleshooting?",
            "burmese":
                "ပြဿနာဖြေရှင်းဖို့ လုပ်ဆောင်ရမယ့် အဆင့်တွေကို တစ်ဆင့်ချင်း ပြောပြပေးလို့ရမလား?",
          },
          {
            "english": "Could you walk me through the design concept?",
            "burmese": "ဒီဇိုင်းရဲ့ အယူအဆကို သေချာလေး ရှင်းပြပေးလို့ရမလား?",
          },
          {
            "english":
                "Could you walk me through the historical background of this place?",
            "burmese":
                "ဒီနေရာရဲ့ သမိုင်းကြောင်း နောက်ခံကို အသေးစိတ် ရှင်းပြပေးလို့ရမလား?",
          },
          {
            "english": "Could you walk me through the budget report?",
            "burmese": "ဘတ်ဂျက်အစီရင်ခံစာကို တစ်ချက်ချင်း ရှင်းပြပေးလို့ရမလား?",
          },
          {
            "english": "Could you walk me through the software installation?",
            "burmese":
                "ဆော့ဝဲလ် ထည့်သွင်းပုံ အဆင့်ဆင့်ကို သေချာလေး ပြပေးလို့ရမလား?",
          },
          {
            "english": "Could you walk me through what happened yesterday?",
            "burmese":
                "မနေ့က ဘာတွေဖြစ်ခဲ့လဲဆိုတာ တစ်ဆင့်ချင်း ပြန်ပြောပြပေးလို့ရမလား?",
          },
          {
            "english": "Could you walk me through the safety procedures?",
            "burmese":
                "ဘေးကင်းလုံခြုံရေး လုပ်ထုံးလုပ်နည်းတွေကို သေချာလေး ရှင်းပြပေးလို့ရမလား?",
          },
          {
            "english": "Could you walk me through the marketing strategy?",
            "burmese":
                "ဈေးကွက်ရှာဖွေရေး ဗျူဟာကို တစ်ဆင့်ချင်း ရှင်းပြပေးလို့ရမလား?",
          },
          {
            "english":
                "Could you walk me through the logical steps of your argument?",
            "burmese":
                "ခင်ဗျားရဲ့ တင်ပြချက်ထဲက ယုတ္တိတန်တဲ့ အဆင့်တွေကို သေချာလေး ရှင်းပြပေးလို့ရမလား?",
          },
          {
            "english":
                "Could you walk me through the workflow of your department?",
            "burmese":
                "ခင်ဗျားတို့ ဌာနရဲ့ လုပ်ငန်းခွင် လုပ်ဆောင်ပုံ အဆင့်ဆင့်ကို ရှင်းပြပေးလို့ရမလား?",
          },
        ],
      ),
      SpokenPattern(
        title: "To be honest with you...",
        burmeseMeaning: "ပွင့်ပွင့်လင်းလင်း ပြောရရင်တော့...",
        usage:
            "ကိုယ့်ရဲ့ တကယ့်အမြင် ဒါမှမဟုတ် သိပ်သဘောမကျတဲ့အရာကို အားမနာတမ်း ပြောတော့မယ့်အခါ အစပျိုးတဲ့စကားပါ။",
        examples: [
          {
            "english":
                "To be honest with you, I don't think this is a good idea.",
            "burmese":
                "ပွင့်ပွင့်လင်းလင်း ပြောရရင်တော့ ဒါဟာ ကောင်းတဲ့ စိတ်ကူးလို့ ကျွန်တော် မထင်ဘူး။",
          },
          {
            "english":
                "To be honest with you, I haven't finished the report yet.",
            "burmese":
                "အမှန်အတိုင်း ပြောရရင် ကျွန်တော် အစီရင်ခံစာ မပြီးသေးဘူးခင်ဗျ။",
          },
          {
            "english":
                "To be honest with you, I'm a bit nervous about the presentation.",
            "burmese":
                "ပွင့်ပွင့်လင်းလင်း ပြောရရင် စာတမ်းဖတ်ပွဲအတွက် ကျွန်တော် နည်းနည်း စိတ်လှုပ်ရှားနေတယ်။",
          },
          {
            "english":
                "To be honest with you, I didn't really enjoy the movie.",
            "burmese":
                "ပွင့်ပွင့်လင်းလင်း ပြောရရင်တော့ အဲ့ဒီရုပ်ရှင်ကို ကျွန်တော် သိပ်သဘောမကျဘူး။",
          },
          {
            "english":
                "To be honest with you, the price is a little too high for us.",
            "burmese":
                "အမှန်အတိုင်း ပြောရရင် ဒီဈေးနှုန်းက ကျွန်တော်တို့အတွက် နည်းနည်း များနေတယ်။",
          },
          {
            "english":
                "To be honest with you, I'm not sure if I can make it to the party.",
            "burmese":
                "ပွင့်ပွင့်လင်းလင်း ပြောရရင် ပွဲကို လာနိုင်မလားဆိုတာ ကျွန်တော် သေချာမသိသေးဘူး။",
          },
          {
            "english":
                "To be honest with you, I've never heard of this brand before.",
            "burmese":
                "အမှန်အတိုင်း ပြောရရင် ဒီတံဆိပ်ကို ကျွန်တော် တစ်ခါမှ မကြားဖူးဘူး။",
          },
          {
            "english": "To be honest with you, I found the book quite boring.",
            "burmese":
                "ပွင့်ပွင့်လင်းလင်း ပြောရရင်တော့ အဲ့ဒီစာအုပ်က ကျွန်တော့်အတွက် တော်တော် ပျင်းစရာကောင်းတယ်။",
          },
          {
            "english": "To be honest with you, I don't really like spicy food.",
            "burmese": "အမှန်အတိုင်း ပြောရရင် ကျွန်တော် အစပ် သိပ်မစားနိုင်ဘူး။",
          },
          {
            "english":
                "To be honest with you, I need more time to think about it.",
            "burmese":
                "ပွင့်ပွင့်လင်းလင်း ပြောရရင် အဲ့ဒါကို စဉ်းစားဖို့ ကျွန်တော် အချိန် ထပ်လိုသေးတယ်။",
          },
          {
            "english":
                "To be honest with you, I'm not very satisfied with the results.",
            "burmese":
                "အမှန်အတိုင်း ပြောရရင် ရလဒ်တွေအပေါ် ကျွန်တော် သိပ်အားမရဘူး။",
          },
          {
            "english":
                "To be honest with you, I think we should cancel the trip.",
            "burmese":
                "ပွင့်ပွင့်လင်းလင်း ပြောရရင်တော့ ခရီးစဉ်ကို ဖျက်လိုက်သင့်တယ်လို့ ကျွန်တော် ထင်တယ်။",
          },
          {
            "english":
                "To be honest with you, I've been feeling quite tired lately.",
            "burmese":
                "အမှန်အတိုင်း ပြောရရင် ဒီရက်ပိုင်း ကျွန်တော် တော်တော် ပင်ပန်းနေတယ်။",
          },
          {
            "english":
                "To be honest with you, I'm not a big fan of jazz music.",
            "burmese":
                "ပွင့်ပွင့်လင်းလင်း ပြောရရင် ကျွန်တော် ဂျက်ဇ်ဂီတကို သိပ်မကြိုက်ဘူး။",
          },
          {
            "english":
                "To be honest with you, I was quite surprised by your decision.",
            "burmese":
                "အမှန်အတိုင်း ပြောရရင် ခင်ဗျားရဲ့ ဆုံးဖြတ်ချက်ကြောင့် ကျွန်တော် တော်တော် အံ့သြသွားတယ်။",
          },
        ],
      ),
    ],
  ),
  SpokenPatternCategory(
    title: "2. Personal Thoughts & Regrets",
    patterns: [
      SpokenPattern(
        title: "I should have...",
        burmeseMeaning: "...ခဲ့သင့်တယ် (ဒါပေမယ့် မလုပ်ခဲ့မိဘူး)",
        usage:
            "အတိတ်က မလုပ်ခဲ့မိတဲ့ အရာတစ်ခုခုအတွက် နောင်တရတာကို ဖော်ပြတဲ့အခါ သုံးပါတယ်။ (Should have + V3)",
        examples: [
          {
            "english": "I should have studied harder for the exam.",
            "burmese": "စာမေးပွဲအတွက် စာကို ပိုကြိုးစားခဲ့သင့်တာ။",
          },
          {
            "english": "I should have listened to your advice.",
            "burmese": "မင်းရဲ့ အကြံဉာဏ်ကို ငါနားထောင်ခဲ့သင့်တာပါ။",
          },
          {
            "english": "I should have told her the truth.",
            "burmese": "သူ့ကို အမှန်အတိုင်း ပြောပြခဲ့သင့်တယ်။",
          },
          {
            "english": "I should have woken up earlier this morning.",
            "burmese": "ဒီမနက် စောစော ထခဲ့သင့်တာ။",
          },
          {
            "english": "I should have brought an umbrella.",
            "burmese": "ထီးယူလာခဲ့သင့်တာ။",
          },
          {
            "english": "I should have checked the weather forecast.",
            "burmese": "မိုးလေဝသခန့်မှန်းချက်ကို စစ်ခဲ့သင့်တာပါ။",
          },
          {
            "english": "I should have saved more money last year.",
            "burmese": "မနှစ်က ပိုက်ဆံ ပိုစုခဲ့သင့်တာ။",
          },
          {
            "english": "I should have called you sooner.",
            "burmese": "မင်းကို စောစောကတည်းက ဖုန်းဆက်ခဲ့သင့်တာ။",
          },
          {
            "english": "I should have double-checked the address.",
            "burmese": "လိပ်စာကို သေချာ ပြန်စစ်ခဲ့သင့်တာ။",
          },
          {
            "english": "I should have asked for help earlier.",
            "burmese": "အကူအညီကို စောစောကတည်းက တောင်းခဲ့သင့်တာပါ။",
          },
          {
            "english": "I should have gone to the doctor last week.",
            "burmese": "မနှစ်ကတည်းက ဆရာဝန်ဆီ သွားခဲ့သင့်တာ။",
          },
          {
            "english": "I should have apologized to him immediately.",
            "burmese": "သူ့ကို ချက်ချင်း တောင်းပန်ခဲ့သင့်တာပါ။",
          },
          {
            "english": "I should have taken that job offer.",
            "burmese": "အဲ့ဒီအလုပ်ကမ်းလှမ်းမှုကို လက်ခံခဲ့သင့်တာ။",
          },
          {
            "english": "I should have invited them to the party.",
            "burmese": "သူတို့ကို ပွဲဖိတ်ခဲ့သင့်တာ။",
          },
          {
            "english": "I should have been more careful.",
            "burmese": "ဒီထက် ပိုသတိထားခဲ့သင့်တာပါ။",
          },
        ],
      ),
      SpokenPattern(
        title: "I'm thinking of...",
        burmeseMeaning: "...ဖို့ စိတ်ကူးနေတယ် / ...ဖို့ စဉ်းစားနေတယ်",
        usage:
            "အစီအစဉ်တစ်ခုခုကို ပြုလုပ်ဖို့ စိတ်ကူးရှိနေတဲ့အခါ သုံးပါတယ်။ (Thinking of + V-ing)",
        examples: [
          {
            "english": "I'm thinking of buying a new car.",
            "burmese": "ကားအသစ်တစ်စီး ဝယ်ဖို့ စဉ်းစားနေတယ်။",
          },
          {
            "english": "I'm thinking of moving to another city.",
            "burmese": "တခြားမြို့ကို ပြောင်းဖို့ စိတ်ကူးနေပါတယ်။",
          },
          {
            "english": "I'm thinking of learning a third language.",
            "burmese": "တတိယဘာသာစကားတစ်ခု သင်ဖို့ စိတ်ကူးရှိတယ်။",
          },
          {
            "english": "I'm thinking of starting my own business.",
            "burmese": "ကိုယ်ပိုင်လုပ်ငန်းစဖို့ စဉ်းစားနေမိတယ်။",
          },
          {
            "english": "I'm thinking of taking a long vacation.",
            "burmese": "ခရီးရှည်တစ်ခု ထွက်ဖို့ စိတ်ကူးနေတာ။",
          },
          {
            "english": "I'm thinking of joining a gym.",
            "burmese": "ဂျင်မ် (Gym) ဆော့ဖို့ စဉ်းစားနေတယ်။",
          },
          {
            "english": "I'm thinking of changing my career path.",
            "burmese": "အလုပ်လမ်းကြောင်း ပြောင်းဖို့ စိတ်ကူးနေမိတယ်။",
          },
          {
            "english": "I'm thinking of visiting Japan next year.",
            "burmese": "နောက်နှစ် ဂျပန်ကို သွားလည်ဖို့ စဉ်းစားနေတယ်။",
          },
          {
            "english": "I'm thinking of selling my old laptop.",
            "burmese": "Laptop အဟောင်းကို ရောင်းဖို့ စိတ်ကူးနေတာ။",
          },
          {
            "english": "I'm thinking of painting my room blue.",
            "burmese": "အခန်းကို အပြာရောင် သုတ်ဖို့ စဉ်းစားနေတယ်။",
          },
          {
            "english": "I'm thinking of quitting smoking.",
            "burmese": "ဆေးလိပ်ဖြတ်ဖို့ စဉ်းစားနေတာပါ။",
          },
          {
            "english": "I'm thinking of inviting him for lunch.",
            "burmese": "သူ့ကို နေ့လည်စာ ဖိတ်ကျွေးဖို့ စိတ်ကူးရှိတယ်။",
          },
          {
            "english": "I'm thinking of applying for that scholarship.",
            "burmese": "အဲ့ဒီ ပညာသင်ဆုကို လျှောက်ဖို့ စဉ်းစားနေတယ်။",
          },
          {
            "english": "I'm thinking of adopting a cat.",
            "burmese": "ကြောင်လေးတစ်ကောင် မွေးဖို့ စိတ်ကူးနေတာ။",
          },
          {
            "english": "I'm thinking of going back to school.",
            "burmese": "ကျောင်းပြန်တက်ဖို့ စဉ်းစားနေမိတယ်။",
          },
        ],
      ),
      SpokenPattern(
        title: "I didn't mean to...",
        burmeseMeaning: "...ဖို့ ရည်ရွယ်ခဲ့တာ မဟုတ်ပါဘူး (မတော်တဆဖြစ်သွားတာပါ)",
        usage:
            "အမှားတစ်ခုခုလုပ်မိတဲ့အခါ ဒါမှမဟုတ် စကားမှားသွားတဲ့အခါ ကိုယ့်မှာ ရည်ရွယ်ချက်ဆိုးမရှိကြောင်း ရှင်းပြရာမှာ သုံးပါတယ်။",
        examples: [
          {
            "english": "I didn't mean to hurt your feelings.",
            "burmese":
                "မင်းရဲ့ စိတ်ကို ထိခိုက်အောင် လုပ်ဖို့ ရည်ရွယ်ခဲ့တာ မဟုတ်ပါဘူး။",
          },
          {
            "english": "I didn't mean to break the vase.",
            "burmese": "ပန်းအိုးကို တမင် ခွဲလိုက်တာ မဟုတ်ပါဘူး။",
          },
          {
            "english": "I didn't mean to keep you waiting.",
            "burmese":
                "မင်းကို စောင့်ခိုင်းထားဖို့ ရည်ရွယ်ခဲ့တာ မဟုတ်ပါဘူး။ (တောင်းပန်ပါတယ်)",
          },
          {
            "english": "I didn't mean to wake you up.",
            "burmese": "မင်းကို နိုးအောင် တမင် လုပ်ခဲ့တာ မဟုတ်ဘူး။",
          },
          {
            "english": "I didn't mean to interrupt your conversation.",
            "burmese":
                "မင်းတို့ စကားပြောနေတာကို ကြားဖြတ်နှောင့်ယှက်ဖို့ ရည်ရွယ်ခဲ့တာ မဟုတ်ပါဘူး။",
          },
          {
            "english": "I didn't mean to scare you.",
            "burmese": "မင်းကို လန့်အောင် လုပ်ဖို့ ရည်ရွယ်ခဲ့တာ မဟုတ်ဘူးနော်။",
          },
          {
            "english": "I didn't mean to offend anyone.",
            "burmese":
                "ဘယ်သူ့ကိုမှ စိတ်အနှောင့်အယှက်ဖြစ်အောင် လုပ်ဖို့ ရည်ရွယ်ခဲ့တာ မဟုတ်ပါဘူး။",
          },
          {
            "english": "I didn't mean to spill the coffee.",
            "burmese": "ကော်ဖီကို တမင် မှောက်ခဲ့တာ မဟုတ်ပါဘူး။",
          },
          {
            "english": "I didn't mean to lose your keys.",
            "burmese": "မင်းသော့တွေကို တမင် ပျောက်အောင် လုပ်ခဲ့တာ မဟုတ်ပါဘူး။",
          },
          {
            "english": "I didn't mean to be late for the meeting.",
            "burmese": "အစည်းအဝေးကို တမင် နောက်ကျခဲ့တာ မဟုတ်ပါဘူး။",
          },
          {
            "english": "I didn't mean to give you the wrong information.",
            "burmese":
                "မင်းကို အချက်အလက်အမှားတွေ ပေးဖို့ ရည်ရွယ်ခဲ့တာ မဟုတ်ပါဘူး။",
          },
          {
            "english": "I didn't mean to make you cry.",
            "burmese": "မင်းကို ငိုအောင် တမင် လုပ်ခဲ့တာ မဟုတ်ပါဘူး။",
          },
          {
            "english": "I didn't mean to delete that file.",
            "burmese": "အဲ့ဒီဖိုင်ကို တမင် ဖျက်ခဲ့တာ မဟုတ်ပါဘူး။",
          },
          {
            "english": "I didn't mean to cause any trouble.",
            "burmese": "ပြဿနာဖြစ်အောင် လုပ်ဖို့ ရည်ရွယ်ခဲ့တာ လုံးဝ မဟုတ်ပါဘူး။",
          },
          {
            "english": "I didn't mean to ignore your message.",
            "burmese": "မင်းမက်ဆေ့ကို တမင် မဖတ်ဘဲ နေခဲ့တာ မဟုတ်ပါဘူး။",
          },
        ],
      ),
      SpokenPattern(
        title: "I'm torn between...",
        burmeseMeaning: "...နှစ်ခုကြားမှာ ဘယ်ဟာရွေးရမှန်းမသိ ဝေခွဲမရဖြစ်နေတယ်",
        usage:
            "ရွေးချယ်စရာ နှစ်ခုကြားမှာ ဆုံးဖြတ်ရခက်နေတဲ့ အခြေအနေကို ဖော်ပြပါတယ်။",
        examples: [
          {
            "english": "I'm torn between these two dresses.",
            "burmese": "ဒီဝတ်စုံနှစ်ခုထဲက ဘယ်ဟာရွေးရမလဲ ဝေခွဲမရဖြစ်နေတယ်။",
          },
          {
            "english": "I'm torn between staying or leaving.",
            "burmese": "နေခဲ့ရမလား၊ ထွက်သွားရမလားဆိုတာ ဝေခွဲမရ ဖြစ်နေတယ်။",
          },
          {
            "english": "I'm torn between two job offers.",
            "burmese":
                "အလုပ်ကမ်းလှမ်းမှု နှစ်ခုကြားမှာ ဘယ်ဟာရွေးရမလဲ ခေါင်းစားနေတယ်။",
          },
          {
            "english": "I'm torn between going to the beach or the mountains.",
            "burmese":
                "ကမ်းခြေသွားရမလား၊ တောင်ပေါ်သွားရမလား ဝေခွဲမရ ဖြစ်နေတယ်။",
          },
          {
            "english": "I'm torn between buying a phone or a laptop.",
            "burmese": "ဖုန်းဝယ်ရမလား၊ Laptop ဝယ်ရမလား ဆုံးဖြတ်ရခက်နေတယ်။",
          },
          {
            "english":
                "I'm torn between the chocolate cake and the cheesecake.",
            "burmese":
                "ချောကလက်ကိတ်နဲ့ Cheesecake ကြားမှာ ဘယ်ဟာစားရမှန်း မသိတော့ဘူး။",
          },
          {
            "english": "I'm torn between studying law or medicine.",
            "burmese": "ဥပဒေသင်ရမလား၊ ဆေးပညာသင်ရမလားဆိုတာ ဝေခွဲမရဖြစ်နေတယ်။",
          },
          {
            "english":
                "I'm torn between tell him the truth or keeping it a secret.",
            "burmese":
                "သူ့ကို အမှန်အတိုင်း ပြောပြရမလား၊ လျှို့ဝှက်ထားရမလား ဝေခွဲမရ ဖြစ်နေတယ်။",
          },
          {
            "english":
                "I'm torn between renting an apartment or buying a house.",
            "burmese":
                "တိုက်ခန်းငှားနေရမလား၊ အိမ်ဝယ်လိုက်ရမလား စဉ်းစားရခက်နေတယ်။",
          },
          {
            "english": "I'm torn between saving money or traveling.",
            "burmese": "ပိုက်ဆံစုရမလား၊ ခရီးသွားရမလားဆိုတာ ဝေခွဲမရဖြစ်နေတယ်။",
          },
          {
            "english": "I'm torn between watching a movie or reading a book.",
            "burmese": "ရုပ်ရှင်ကြည့်ရမလား၊ စာဖတ်ရမလား ဝေခွဲမရ ဖြစ်နေတယ်။",
          },
          {
            "english": "I'm torn between working late or going to the gym.",
            "burmese":
                "အလုပ်နောက်ကျထိ လုပ်ရမလား၊ ဂျင်မ်သွားရမလားဆိုတာ ဆုံးဖြတ်ရခက်နေတယ်။",
          },
          {
            "english": "I'm torn between keeping the car or selling it.",
            "burmese":
                "ကားကို ဆက်ထားရမလား၊ ရောင်းလိုက်ရမလား ဝေခွဲမရ ဖြစ်နေတယ်။",
          },
          {
            "english": "I'm torn between the red one and the blue one.",
            "burmese":
                "အနီရောင်နဲ့ အပြာရောင်ကြားမှာ ဘယ်ဟာယူရမလဲ ဝေခွဲမရဖြစ်နေတယ်။",
          },
          {
            "english": "I'm torn between these two candidate for the job.",
            "burmese":
                "ဒီအလုပ်အတွက် လျှောက်ထားသူ နှစ်ယောက်ထဲက ဘယ်သူ့ကို ရွေးရမလဲ ခေါင်းစားနေတယ်။",
          },
        ],
      ),
      SpokenPattern(
        title: "If I were you, I would...",
        burmeseMeaning: "ငါသာ မင်းနေရာမှာဆိုရင်တော့ ... လိုက်မှာ",
        usage:
            "သူငယ်ချင်း အချင်းချင်း ဒါမှမဟုတ် ရင်းနှီးသူကို အကြံပေးတဲ့အခါ အသုံးအများဆုံး ပုံစံဖြစ်ပါတယ်။",
        examples: [
          {
            "english": "If I were you, I would take that opportunity.",
            "burmese":
                "ငါသာ မင်းနေရာမှာဆိုရင်တော့ အဲ့ဒီအခွင့်အရေးကို ယူလိုက်မှာ။",
          },
          {
            "english": "If I were you, I would talk to him first.",
            "burmese":
                "ငါသာ မင်းနေရာမှာဆိုရင်တော့ သူ့ကို အရင် စကားပြောကြည့်မှာ။",
          },
          {
            "english": "If I were you, I would go to the doctor.",
            "burmese": "ငါသာ မင်းနေရာမှာဆိုရင်တော့ ဆရာဝန်ဆီ သွားပြလိုက်မှာ။",
          },
          {
            "english": "If I were you, I would buy the smaller house.",
            "burmese": "ငါသာ မင်းနေရာမှာဆိုရင် အိမ်အသေးလေးကိုပဲ ဝယ်လိုက်မှာ။",
          },
          {
            "english": "If I were you, I would quit that job.",
            "burmese": "ငါသာ မင်းနေရာမှာဆိုရင် အဲ့ဒီအလုပ်ကနေ ထွက်လိုက်မှာ။",
          },
          {
            "english": "If I were you, I would tell her how I feel.",
            "burmese":
                "ငါသာ မင်းနေရာမှာဆိုရင် ငါ့ခံစားချက်တွေကို သူ့ကို ပြောပြလိုက်မှာ။",
          },
          {
            "english": "If I were you, I would wait for a better offer.",
            "burmese":
                "ငါသာ မင်းနေရာမှာဆိုရင် ပိုကောင်းတဲ့ ကမ်းလှမ်းမှုကို စောင့်လိုက်မှာ။",
          },
          {
            "english": "If I were you, I would study harder.",
            "burmese": "ငါသာ မင်းနေရာမှာဆိုရင် စာကို ဒီထက် ပိုကြိုးစားမှာ။",
          },
          {
            "english": "If I were you, I would apologize to them.",
            "burmese": "ငါသာ မင်းနေရာမှာဆိုရင် သူတို့ကို တောင်းပန်လိုက်မှာ။",
          },
          {
            "english": "If I were you, I would ask for a raise.",
            "burmese": "ငါသာ မင်းနေရာမှာဆိုရင် လစာတိုးတောင်းလိုက်မှာ။",
          },
          {
            "english": "If I were you, I would start saving money now.",
            "burmese": "ငါသာ မင်းနေရာမှာဆိုရင် အခုကတည်းက ပိုက်ဆံစုတော့မှာ။",
          },
          {
            "english": "If I were you, I would ignore those comments.",
            "burmese":
                "ငါသာ မင်းနေရာမှာဆိုရင် အဲ့ဒီစကားတွေကို လျစ်လျူရှုလိုက်မှာ။",
          },
          {
            "english": "If I were you, I would choose the red one.",
            "burmese": "ငါသာ မင်းနေရာမှာဆိုရင် အနီရောင်ကိုပဲ ရွေးမှာ။",
          },
          {
            "english": "If I were you, I would check the contract again.",
            "burmese":
                "ငါသာ မင်းနေရာမှာဆိုရင် စာချုပ်ကို နောက်တစ်ခေါက် ပြန်စစ်မှာ။",
          },
          {
            "english": "If I were you, I would take a few days off.",
            "burmese": "ငါသာ မင်းနေရာမှာဆိုရင် ရက်နည်းနည်းလောက် နားလိုက်မှာ။",
          },
        ],
      ),
    ],
  ),
  SpokenPatternCategory(
    title: "3. Obligations & Needs",
    patterns: [
      SpokenPattern(
        title: "I'm supposed to...",
        burmeseMeaning: "...ဖို့ တာဝန်ရှိတယ် / ...ဖို့ လုပ်ရမှာ",
        usage:
            "စည်းကမ်းအရ (သို့) ကတိအရ လုပ်ဆောင်ရမယ့် အရာများကို ပြောဆိုရာတွင် သုံးသည်။",
        examples: [
          {
            "english": "I'm supposed to be at work by 9 AM.",
            "burmese": "ကျွန်တော် မနက် ၉ နာရီ အလုပ်ရောက်နေရမှာ။",
          },
          {
            "english": "I'm supposed to finish this report today.",
            "burmese": "ဒီအစီရင်ခံစာကို ဒီနေ့ အပြီးသတ်ရမှာ။",
          },
          {
            "english": "We're not supposed to smoke here.",
            "burmese": "ဒီမှာ ဆေးလိပ်မသောက်ရဘူးလို့ သတ်မှတ်ထားတယ်။",
          },
          {
            "english": "I'm supposed to meet him at the station.",
            "burmese": "သူ့ကို ဘူတာမှာ သွားတွေ့ဖို့ ရှိတယ်။",
          },
          {
            "english": "Wasn't it supposed to rain today?",
            "burmese": "ဒီနေ့ မိုးရွာရမှာ မဟုတ်ဘူးလား?",
          },
          {
            "english": "I'm supposed to pick up my sister from school.",
            "burmese": "ကျောင်းကနေ ညီမလေးကို သွားကြိုရမှာ။",
          },
          {
            "english": "You're supposed to wear a suit to the party.",
            "burmese": "ပွဲကို မင်း ဝတ်စုံအပြည့် ဝတ်လာရမှာနော်။",
          },
          {
            "english": "I'm supposed to be on a diet.",
            "burmese": "ကျွန်တော် ဝိတ်လျှော့နေရတာ (စားချင်တာ စားလို့မရဘူး)။",
          },
          {
            "english": "The flight was supposed to take off an hour ago.",
            "burmese": "လေယာဉ်က လွန်ခဲ့တဲ့ တစ်နာရီကတည်းက ထွက်ရမှာ။",
          },
          {
            "english": "Am I supposed to know about this?",
            "burmese": "ဒါကို ကျွန်တော် သိထားသင့်တာလား?",
          },
          {
            "english": "I'm supposed to help my mom with the chores.",
            "burmese": "အိမ်အလုပ်တွေမှာ အမေကို ကူညီပေးဖို့ ရှိတယ်။",
          },
          {
            "english": "We are supposed to keep this a secret.",
            "burmese": "ဒါကို လျှို့ဝှက်ချက်အဖြစ် ထားရမှာပါ။",
          },
          {
            "english": "It's supposed to be a surprise party.",
            "burmese": "ဒါက အံ့အားသင့်စရာပွဲလေး ဖြစ်ရမှာပါ။",
          },
          {
            "english": "I'm supposed to submit the application tomorrow.",
            "burmese": "လျှောက်လွှာကို မနက်ဖြန် တင်ရမှာ။",
          },
          {
            "english": "You're supposed to wash your hands before eating.",
            "burmese": "မစားခင် မင်း လက်ဆေးရမယ်လေ။",
          },
        ],
      ),
      SpokenPattern(
        title: "It's time to...",
        burmeseMeaning: "...ဖို့ အချိန်တန်ပြီ",
        usage:
            "တစ်ခုခုလုပ်ဆောင်ဖို့ အချိန်ကျရောက်ပြီဖြစ်ကြောင်း တိုက်တွန်းရာတွင် သုံးသည်။",
        examples: [
          {
            "english": "It's time to go to bed.",
            "burmese": "အိပ်ရာဝင်ဖို့ အချိန်တန်ပြီ။",
          },
          {
            "english": "It's time to make a decision.",
            "burmese": "ဆုံးဖြတ်ချက်ချဖို့ အချိန်တန်ပြီ။",
          },
          {
            "english": "It's time to face the truth.",
            "burmese": "အမှန်တရားကို ရင်ဆိုင်ဖို့ အချိန်တန်ပြီ။",
          },
          {
            "english": "It's time to start the meeting.",
            "burmese": "အစည်းအဝေးစဖို့ အချိန်ကျပြီ။",
          },
          {
            "english": "It's time to say goodbye.",
            "burmese": "နှုတ်ဆက်ရမယ့် အချိန်ရောက်ပြီ။",
          },
          {
            "english": "It's time to move on.",
            "burmese": "ဒါတွေကို ထားခဲ့ပြီး ရှေ့ဆက်ရမယ့် အချိန်တန်ပြီ။",
          },
          {
            "english": "It's time to take a break.",
            "burmese": "နားဖို့ အချိန်တန်ပြီ။",
          },
          {
            "english": "It's time to change our strategy.",
            "burmese": "ငါတို့ရဲ့ ဗျူဟာကို ပြောင်းရမယ့် အချိန်ရောက်ပြီ။",
          },
          {
            "english": "It's time to stand up for yourself.",
            "burmese": "ကိုယ့်ဘက်ကနေ ပြန်ပြီး ခုခံပြောဆိုဖို့ အချိန်တန်ပြီ။",
          },
          {
            "english": "It's time to upgrade your phone.",
            "burmese": "မင်းဖုန်းကို အသစ်လဲဖို့ အချိန်တန်ပြီ။",
          },
          {
            "english": "It's time to clean the house.",
            "burmese": "အိမ်သန့်ရှင်းရေးလုပ်ဖို့ အချိန်တန်ပြီ။",
          },
          {
            "english": "It's time to tell them the news.",
            "burmese": "သူတို့ကို သတင်းပြောပြဖို့ အချိန်ကျပြီ။",
          },
          {
            "english": "It's time to focus on your studies.",
            "burmese": "စာကိုပဲ အာရုံစိုက်ရမယ့် အချိန်တန်ပြီ။",
          },
          {
            "english": "It's time to think about the future.",
            "burmese": "အနာဂတ်အတွက် စဉ်းစားရမယ့် အချိန်တန်ပြီ။",
          },
          {
            "english": "It's time to go home.",
            "burmese": "အိမ်ပြန်ဖို့ အချိန်တန်ပြီ။",
          },
        ],
      ),
      SpokenPattern(
        title: "I'm dying to...",
        burmeseMeaning:
            "...ချင်လွန်းလို့ အသေအလဲပဲ / ...ဖို့ အရမ်းစောင့်မျှော်နေတာ",
        usage:
            "တစ်ခုခုကို အရမ်းလုပ်ချင်နေတာ ဒါမှမဟုတ် အရမ်းလိုချင်နေတာကို အသားပေးပြောချင်တဲ့အခါ သုံးပါတယ်။",
        examples: [
          {
            "english": "I'm dying to see you.",
            "burmese": "မင်းကို တွေ့ချင်လွန်းလို့ အသေအလဲပဲ။",
          },
          {
            "english": "I'm dying to eat some Myanmar food.",
            "burmese": "မြန်မာစာ စားချင်လွန်းလို့ သေတော့မယ်။",
          },
          {
            "english": "I'm dying to know what happened.",
            "burmese": "ဘာဖြစ်ခဲ့လဲဆိုတာ သိချင်လွန်းလို့ အားမရတော့ဘူး။",
          },
          {
            "english": "I'm dying to go on a vacation.",
            "burmese": "ခရီးသွားချင်လွန်းလို့ ယားယံနေပြီ။",
          },
          {
            "english": "I'm dying to try that new restaurant.",
            "burmese": "အဲ့ဒီဆိုင်အသစ်မှာ သွားစားကြည့်ချင်လွန်းလို့။",
          },
          {
            "english": "I'm dying to hear his new song.",
            "burmese": "သူ့သီချင်းအသစ်ကို နားထောင်ချင်လွန်းလို့ စောင့်နေတာ။",
          },
          {
            "english": "I'm dying to tell you the good news.",
            "burmese":
                "မင်းကို သတင်းကောင်းပြောပြချင်လွန်းလို့ ရင်ထဲမှာ တလှပ်လှပ်ပဲ။",
          },
          {
            "english": "I'm dying to buy that dress.",
            "burmese": "အဲ့ဒီဝတ်စုံလေး ဝယ်ချင်လွန်းလို့။",
          },
          {
            "english": "I'm dying to meet my favorite singer.",
            "burmese": "ငါအကြိုက်ဆုံး အဆိုတော်နဲ့ တွေ့ချင်လွန်းလို့ အသေအလဲပဲ။",
          },
          {
            "english": "I'm dying to get some sleep.",
            "burmese": "အိပ်ချင်လွန်းလို့ မျက်စိတောင် မဖွင့်နိုင်တော့ဘူး။",
          },
          {
            "english": "I'm dying to see the final results.",
            "burmese": "နောက်ဆုံးရလဒ်တွေကို သိချင်လွန်းလို့ စောင့်နေတာ။",
          },
          {
            "english": "I'm dying to visit London one day.",
            "burmese": "တစ်နေ့ကျရင် လန်ဒန်ကို သွားလည်ချင်လွန်းလို့။",
          },
          {
            "english": "I'm dying to quit this job.",
            "burmese": "ဒီအလုပ်ကနေ ထွက်ချင်လွန်းလို့ စိတ်ကုန်နေပြီ။",
          },
          {
            "english": "I'm dying to learn how to play the guitar.",
            "burmese": "ဂစ်တာတီး သင်ချင်လွန်းလို့။",
          },
          {
            "english": "I'm dying to watch the next episode.",
            "burmese":
                "နောက်တစ်ပိုင်းကို ကြည့်ချင်လွန်းလို့ မစောင့်နိုင်တော့ဘူး။",
          },
        ],
      ),
      SpokenPattern(
        title: "You'd better...",
        burmeseMeaning:
            "မင်း ... လိုက်တာ ပိုကောင်းမယ် (မလုပ်ရင် ပြဿနာတက်နိုင်တယ်)",
        usage:
            "Should ထက် ပိုပြင်းထန်တဲ့ သတိပေးချက် ဒါမှမဟုတ် အကြံပြုချက်အဖြစ် သုံးပါတယ်။",
        examples: [
          {
            "english": "You'd better hurry up or we'll be late.",
            "burmese":
                "မင်း မြန်မြန်လုပ်တာ ပိုကောင်းမယ်၊ မဟုတ်ရင် ငါတို့ နောက်ကျလိမ့်မယ်။",
          },
          {
            "english": "You'd better call him right now.",
            "burmese": "မင်း သူ့ကို အခုချက်ချင်း ဖုန်းဆက်လိုက်တာ ပိုကောင်းမယ်။",
          },
          {
            "english": "You'd better listen to me.",
            "burmese": "ငါပြောတာကို မင်း နားထောင်တာ ပိုကောင်းမယ်နော်။",
          },
          {
            "english": "You'd better not tell anyone about this.",
            "burmese":
                "ဒါကို ဘယ်သူ့ကိုမှ မပြောတာ ပိုကောင်းမယ် (ပြောရင် ပြဿနာတက်နိုင်တယ်)။",
          },
          {
            "english": "You'd better check your email.",
            "burmese": "မင်း အီးမေးလ်ကို စစ်ကြည့်လိုက်တာ ပိုကောင်းမယ်။",
          },
          {
            "english": "You'd better bring a jacket; it's cold outside.",
            "burmese": "အပြင်မှာ အေးတယ်၊ ဂျာကင်ယူသွားတာ ပိုကောင်းမယ်။",
          },
          {
            "english": "You'd better finish your homework before watching TV.",
            "burmese": "တီဗွီမကြည့်ခင် အိမ်စာအရင်ပြီးအောင်လုပ်တာ ပိုကောင်းမယ်။",
          },
          {
            "english": "You'd better apologize to her.",
            "burmese": "မင်း သူမကို တောင်းပန်လိုက်တာ ပိုကောင်းမယ်။",
          },
          {
            "english": "You'd better keep your voice down.",
            "burmese": "အသံလျှော့ပြောတာ ပိုကောင်းမယ်။",
          },
          {
            "english": "You'd better ask for permission first.",
            "burmese": "အရင်ဆုံး ခွင့်တောင်းလိုက်တာ ပိုကောင်းမယ်။",
          },
          {
            "english": "You'd better tell the truth.",
            "burmese": "အမှန်အတိုင်း ပြောလိုက်တာ ပိုကောင်းမယ်နော်။",
          },
          {
            "english": "You'd better be careful what you say.",
            "burmese": "မင်း ပြောမယ့်စကားကို သတိထားတာ ပိုကောင်းမယ်။",
          },
          {
            "english": "You'd better stay away from that area.",
            "burmese": "အဲ့ဒီနားကို မသွားတာ ပိုကောင်းမယ်။",
          },
          {
            "english": "You'd better save some money for the future.",
            "burmese": "အနာဂတ်အတွက် ပိုက်ဆံစုထားတာ ပိုကောင်းမယ်။",
          },
          {
            "english": "You'd better study hard for the final exam.",
            "burmese":
                "နောက်ဆုံးစာမေးပွဲအတွက် စာကို ကြိုးစားထားတာ ပိုကောင်းမယ်။",
          },
        ],
      ),
      SpokenPattern(
        title: "I can't afford to...",
        burmeseMeaning: "...ဖို့ (ငွေကြေး ဒါမှမဟုတ် အချိန်) မတတ်နိုင်ဘူး",
        usage:
            "ပိုက်ဆံမလောက်တာတင်မကဘဲ အမှားမခံနိုင်တဲ့ အခြေအနေမျိုးမှာပါ သုံးပါတယ်။",
        examples: [
          {
            "english": "I can't afford to buy a new house right now.",
            "burmese": "အခုလောလောဆယ် အိမ်အသစ်ဝယ်ဖို့ မတတ်နိုင်သေးဘူး။",
          },
          {
            "english": "I can't afford to lose this job.",
            "burmese": "ဒီအလုပ် ပြုတ်လို့ မဖြစ်ဘူး (အဆုံးရှုံးမခံနိုင်ဘူး)။",
          },
          {
            "english": "I can't afford to waste any more time.",
            "burmese": "အချိန် ထပ်မဖြုန်းနိုင်တော့ဘူး။",
          },
          {
            "english": "I can't afford to go on a luxury vacation.",
            "burmese": "ဇိမ်ခံခရီးထွက်ဖို့ ကျွန်တော် မတတ်နိုင်ပါဘူး။",
          },
          {
            "english": "I can't afford to fail this exam.",
            "burmese": "ဒီစာမေးပွဲ ကျလို့ လုံးဝမဖြစ်ဘူး။",
          },
          {
            "english": "I can't afford to miss the last bus.",
            "burmese": "နောက်ဆုံးကားကို လွတ်လို့ မဖြစ်ဘူး။",
          },
          {
            "english": "I can't afford to offend our biggest client.",
            "burmese":
                "ငါတို့ရဲ့ အကြီးဆုံးဖောက်သည်ကို စိတ်ဆိုးအောင်လုပ်လို့ မဖြစ်ဘူး။",
          },
          {
            "english": "I can't afford to make any mistakes.",
            "burmese": "အမှားတစ်ခုမှ အဖြစ်မခံနိုင်ဘူး။",
          },
          {
            "english": "I can't afford to buy that expensive car.",
            "burmese": "အဲ့ဒီ ဈေးကြီးတဲ့ကားကို ဝယ်ဖို့ မတတ်နိုင်ဘူး။",
          },
          {
            "english": "I can't afford to pay for the repairs.",
            "burmese": "ပြုပြင်ခတွေ ပေးဖို့ ကျွန်တော် မတတ်နိုင်ဘူး။",
          },
          {
            "english": "I can't afford to take a day off this week.",
            "burmese": "ဒီအပတ်ထဲမှာ တစ်ရက်တောင် နားလို့မဖြစ်ဘူး။",
          },
          {
            "english": "I can't afford to be lazy.",
            "burmese": "ပျင်းနေလို့ မဖြစ်ဘူး (အလုပ်လုပ်မှဖြစ်မယ်)။",
          },
          {
            "english": "I can't afford to let him down.",
            "burmese": "သူ့ကို စိတ်ပျက်အောင် လုပ်လို့ မဖြစ်ဘူး။",
          },
          {
            "english": "I can't afford to travel by plane.",
            "burmese": "လေယာဉ်နဲ့သွားဖို့ ကျွန်တော် မတတ်နိုင်ဘူး။",
          },
          {
            "english": "I can't afford to ignore my health anymore.",
            "burmese": "ကျန်းမာရေးကို လျစ်လျူရှုထားလို့ မဖြစ်တော့ဘူး။",
          },
        ],
      ),
    ],
  ),
  SpokenPatternCategory(
    title: "4. Feelings & Intentions",
    patterns: [
      SpokenPattern(
        title: "I feel like...",
        burmeseMeaning: "...ချင်သလိုလို ဖြစ်နေတယ် / ...ချင်စိတ်ပေါက်နေတယ်",
        usage:
            "တစ်ခုခုကို ပြုလုပ်ချင်တဲ့ ဆန္ဒ ဒါမှမဟုတ် ခံစားချက်ကို ဖော်ပြတဲ့အခါ သုံးပါတယ်။ (Feel like + V-ing)",
        examples: [
          {
            "english": "I feel like eating pizza tonight.",
            "burmese": "ဒီည ပီဇာစားချင်စိတ် ပေါက်နေတယ်။",
          },
          {
            "english": "I feel like going for a swim.",
            "burmese": "ရေသွားကူးချင်သလိုလို ဖြစ်နေတယ်။",
          },
          {
            "english": "I feel like watching a horror movie.",
            "burmese": "သရဲကားတစ်ကားလောက် ကြည့်ချင်စိတ် ပေါက်နေတယ်။",
          },
          {
            "english": "I don't feel like talking to anyone right now.",
            "burmese": "အခုလောလောဆယ် ဘယ်သူနဲ့မှ စကားမပြောချင်ဘူး။",
          },
          {
            "english": "I feel like taking a long nap.",
            "burmese": "တစ်ရေးလောက် အဝအိပ်ပစ်ချင်စိတ် ပေါက်နေတယ်။",
          },
          {
            "english": "I feel like we've met somewhere before.",
            "burmese": "ငါတို့ တစ်နေရာရာမှာ ဆုံဖူးသလိုလို ခံစားရတယ်။",
          },
          {
            "english": "I feel like having a glass of cold water.",
            "burmese": "ရေအေးအေးလေး တစ်ခွက်လောက် သောက်ချင်လိုက်တာ။",
          },
          {
            "english": "I feel like going for a drive.",
            "burmese": "ကားလေးလျှောက်မောင်းချင်စိတ် ပေါက်နေတယ်။",
          },
          {
            "english": "I feel like something is wrong.",
            "burmese": "တစ်ခုခုတော့ မှားနေသလိုပဲလို့ ခံစားနေရတယ်။",
          },
          {
            "english": "I don't feel like cooking today.",
            "burmese": "ဒီနေ့ ဟင်းမချက်ချင်တော့ဘူး။",
          },
          {
            "english": "I feel like dancing!",
            "burmese": "ကချင်သလိုလိုတောင် ဖြစ်လာပြီ။",
          },
          {
            "english": "I feel like crying for no reason.",
            "burmese": "ဘာအကြောင်းမှမရှိဘဲ ငိုချင်သလိုလို ဖြစ်နေတယ်။",
          },
          {
            "english": "I feel like staying at home all day.",
            "burmese": "တစ်နေကုန် အိမ်မှာပဲ အောင်းနေချင်စိတ် ပေါက်နေတယ်။",
          },
          {
            "english": "I feel like buying myself a present.",
            "burmese":
                "ကိုယ့်ဘာကိုယ် လက်ဆောင်တစ်ခုလောက် ဝယ်ပေးချင်စိတ် ပေါက်နေတယ်။",
          },
          {
            "english": "I feel like I'm dreaming.",
            "burmese": "အိပ်မက်မက်နေသလိုလိုတောင် ခံစားရတယ်။",
          },
        ],
      ),
      SpokenPattern(
        title: "I'm planning to...",
        burmeseMeaning: "...ဖို့ အစီအစဉ်ရှိတယ်",
        usage:
            "သေချာပေါက် လုပ်ဆောင်တော့မယ့် အစီအစဉ်တွေကို ဖော်ပြတဲ့အခါ သုံးပါတယ်။",
        examples: [
          {
            "english": "I'm planning to visit my grandparents this weekend.",
            "burmese":
                "ဒီအပတ်ပိတ်ရက်မှာ ဖိုးဖိုးဖွားဖွားတို့ဆီ သွားလည်ဖို့ အစီအစဉ်ရှိတယ်။",
          },
          {
            "english": "I'm planning to buy a new laptop soon.",
            "burmese": "မကြာခင် Laptop အသစ်တစ်လုံး ဝယ်ဖို့ စီစဉ်နေပါတယ်။",
          },
          {
            "english": "I'm planning to start a new business next year.",
            "burmese": "နောက်နှစ်မှာ လုပ်ငန်းသစ်တစ်ခုစဖို့ အစီအစဉ်ရှိတယ်။",
          },
          {
            "english": "We're planning to go abroad for our honeymoon.",
            "burmese": "ဟန်နီမွန်းအတွက် နိုင်ငံခြားသွားဖို့ စီစဉ်နေကြတယ်။",
          },
          {
            "english": "I'm planning to study abroad.",
            "burmese": "နိုင်ငံခြားမှာ ကျောင်းသွားတက်ဖို့ အစီအစဉ်ရှိတယ်။",
          },
          {
            "english": "I'm planning to learn how to cook Italian food.",
            "burmese": "အီတလီစာ ချက်တတ်အောင် သင်ဖို့ စီစဉ်နေတယ်။",
          },
          {
            "english": "I'm planning to move to a bigger house.",
            "burmese": "အိမ်အကြီးကြီးတစ်ခုထဲ ပြောင်းနေဖို့ အစီအစဉ်ရှိတယ်။",
          },
          {
            "english": "I'm planning to write a book about my life.",
            "burmese": "ကျွန်တော့်ဘဝအကြောင်း စာအုပ်တစ်အုပ်ရေးဖို့ စီစဉ်နေတယ်။",
          },
          {
            "english": "Are you planning to attend the meeting?",
            "burmese": "အစည်းအဝေး တက်ဖို့ အစီအစဉ်ရှိလား?",
          },
          {
            "english": "I'm planning to quit my job in December.",
            "burmese": "ဒီဇင်ဘာမှာ အလုပ်ကထွက်ဖို့ စီစဉ်ထားတယ်။",
          },
          {
            "english": "I'm planning to go to the gym regularly.",
            "burmese": "ဂျင်မ် (Gym) ပုံမှန်သွားဖို့ အစီအစဉ်ရှိပါတယ်။",
          },
          {
            "english": "I'm planning to host a dinner party on Saturday.",
            "burmese": "စနေနေ့မှာ ညစာစားပွဲလေးလုပ်ဖို့ စီစဉ်နေတယ်။",
          },
          {
            "english": "I'm planning to upgrade my skills.",
            "burmese":
                "ကျွန်တော့်ရဲ့ အရည်အချင်းတွေကို မြှင့်တင်ဖို့ အစီအစဉ်ရှိတယ်။",
          },
          {
            "english": "They are planning to get married in May.",
            "burmese": "သူတို့ မေလမှာ မင်္ဂလာဆောင်ဖို့ စီစဉ်နေကြတယ်။",
          },
          {
            "english": "I'm planning to take a break from social media.",
            "burmese": "ဆိုရှယ်မီဒီယာကို ခဏလောက် နားဖို့ စီစဉ်နေတယ်။",
          },
        ],
      ),
      SpokenPattern(
        title: "I'm in the mood for...",
        burmeseMeaning: "...လုပ်ဖို့ စိတ်ပါနေတယ် / ...စားချင်စိတ်ပေါက်နေတယ်",
        usage:
            "အဲ့ဒီအချိန်မှာ ဖြစ်ပေါ်နေတဲ့ ကိုယ့်ရဲ့ဆန္ဒ ဒါမှမဟုတ် စိတ်ခံစားချက်ကို ပြောတာပါ။",
        examples: [
          {
            "english": "I'm in the mood for Chinese food.",
            "burmese": "တရုတ်စာ စားချင်စိတ် ပေါက်နေတယ်။",
          },
          {
            "english": "I'm in the mood for a good laugh.",
            "burmese":
                "ဝအောင် ရယ်ချင်စိတ် ပေါက်နေတယ်။ (ဟာသတစ်ခုခု ကြည့်ချင်တာမျိုး)",
          },
          {
            "english": "I'm in the mood for a walk in the park.",
            "burmese": "ပန်းခြံထဲမှာ လမ်းလျှောက်ဖို့ စိတ်ပါနေတယ်။",
          },
          {
            "english": "I'm not in the mood for arguing.",
            "burmese": "ရန်ဖြစ်ဖို့/ငြင်းဖို့ စိတ်မပါဘူး။",
          },
          {
            "english": "I'm in the mood for some classical music.",
            "burmese": "Classic သီချင်းလေးတွေ နားထောင်ဖို့ စိတ်ပါနေတယ်။",
          },
          {
            "english": "I'm in the mood for a shopping spree.",
            "burmese": "ဈေးဝယ်ထွက်ဖို့ စိတ်ပေါက်နေတယ်။",
          },
          {
            "english": "I'm in the mood for an adventure.",
            "burmese": "စွန့်စားမှုတစ်ခုခုလုပ်ဖို့ စိတ်အားထက်သန်နေတယ်။",
          },
          {
            "english": "I'm not in the mood for jokes right now.",
            "burmese":
                "အခုချိန်မှာ နောက်ပြောင်တာတွေကို နားထောင်ဖို့ စိတ်မပါဘူး။",
          },
          {
            "english": "I'm in the mood for a cup of hot tea.",
            "burmese": "လက်ဖက်ရည်ပူပူလေး တစ်ခွက် သောက်ချင်စိတ် ပေါက်နေတယ်။",
          },
          {
            "english": "I'm in the mood for dancing tonight.",
            "burmese": "ဒီည ကဖို့ စိတ်ပါနေတယ်။",
          },
          {
            "english": "Are you in the mood for a movie?",
            "burmese": "ရုပ်ရှင်ကြည့်ဖို့ စိတ်ပါလား?",
          },
          {
            "english": "I'm in the mood for something sweet.",
            "burmese": "အချိုတစ်ခုခု စားချင်စိတ် ပေါက်နေတယ်။",
          },
          {
            "english": "I'm in the mood for a long conversation.",
            "burmese": "စကားတွေ အကြာကြီးပြောဖို့ စိတ်ပါနေတယ်။",
          },
          {
            "english": "I'm not in the mood to go out tonight.",
            "burmese": "ဒီည အပြင်သွားဖို့ စိတ်မပါဘူး။",
          },
          {
            "english": "I'm in the mood for a beach holiday.",
            "burmese": "ကမ်းခြေမှာ အားလပ်ရက်ကုန်ဆုံးဖို့ စိတ်ပေါက်နေတယ်။",
          },
        ],
      ),
      SpokenPattern(
        title: "I'm leaning towards...",
        burmeseMeaning:
            "...ဘက်ကို ပိုပြီး စိတ်ယိုင်နေတယ် / ...ကို ပိုသဘောကျနေတယ်",
        usage:
            "တစ်ခုခုကို အပြီးသတ်မဆုံးဖြတ်ရသေးပေမယ့် ပိုပြီး အားသန်နေတဲ့ဘက်ကို ပြောတဲ့အခါ သုံးပါတယ်။",
        examples: [
          {
            "english": "I'm leaning towards the blue shirt.",
            "burmese": "အပြာရောင်အင်္ကျီဘက်ကို ပိုပြီး စိတ်ယိုင်နေတယ်။",
          },
          {
            "english": "I'm leaning towards accepting the offer.",
            "burmese": "ကမ်းလှမ်းချက်ကို လက်ခံဖို့ဘက်ကို ပိုအားသန်နေတယ်။",
          },
          {
            "english": "I'm leaning towards staying home tonight.",
            "burmese": "ဒီည အိမ်မှာပဲနေဖို့ ပိုစဉ်းစားနေမိတယ်။",
          },
          {
            "english": "I'm leaning towards buying a Toyota.",
            "burmese": "တိုယိုတာ (Toyota) ဝယ်ဖို့ဘက်ကို ပိုစိတ်ယိုင်နေတယ်။",
          },
          {
            "english": "We're leaning towards choosing his design.",
            "burmese": "သူ့ရဲ့ဒီဇိုင်းကို ရွေးဖို့ ပိုပြီး စိတ်အားသန်နေကြတယ်။",
          },
          {
            "english": "I'm leaning towards the second option.",
            "burmese": "ဒုတိယရွေးချယ်မှုဘက်ကို ပိုပြီး စိတ်ယိုင်နေတယ်။",
          },
          {
            "english": "I'm leaning towards hiring her.",
            "burmese": "သူ့ကို အလုပ်ခန့်ဖို့ဘက်ကို ပိုအားသန်နေတယ်။",
          },
          {
            "english": "I'm leaning towards a career in technology.",
            "burmese":
                "နည်းပညာပိုင်းဆိုင်ရာ အသက်မွေးဝမ်းကြောင်းဘက်ကို ပိုစိတ်ယိုင်နေတယ်။",
          },
          {
            "english":
                "I'm leaning towards the red one instead of the black one.",
            "burmese": "အမည်းရောင်ထက် အနီရောင်ကို ပိုသဘောကျနေတယ်။",
          },
          {
            "english": "They are leaning towards canceling the event.",
            "burmese":
                "သူတို့က ပွဲကို ဖျက်လိုက်ဖို့ဘက်ကို ပိုပြီး အားသန်နေကြတယ်။",
          },
          {
            "english": "I'm leaning towards pizza for dinner.",
            "burmese": "ညစာအတွက် ပီဇာစားဖို့ ပိုစိတ်ပါနေတယ်။",
          },
          {
            "english": "I'm leaning towards traveling by train.",
            "burmese": "ရထားနဲ့သွားဖို့ဘက်ကို ပိုပြီး စိတ်ယိုင်နေတယ်။",
          },
          {
            "english": "I'm leaning towards voting for him.",
            "burmese": "သူ့ကို မဲပေးဖို့ဘက်ကို ပိုအားသန်နေတယ်။",
          },
          {
            "english": "I'm leaning towards starting early.",
            "burmese": "စောစောစဖို့ဘက်ကို ပိုစဉ်းစားနေမိတယ်။",
          },
          {
            "english": "I'm leaning towards the smaller apartment.",
            "burmese": "တိုက်ခန်းအသေးလေးဘက်ကို ပိုပြီး စိတ်ယိုင်နေတယ်။",
          },
        ],
      ),
      SpokenPattern(
        title: "I have no idea why...",
        burmeseMeaning: "ဘာလို့ ... ဖြစ်နေတာလဲဆိုတာ လုံးဝကို စဉ်းစားမရဘူး",
        usage:
            "အကြောင်းရင်းကို လုံးဝနားမလည်တော့တဲ့အခါ အသုံးများတဲ့ အပြောပုံစံပါ။",
        examples: [
          {
            "english": "I have no idea why he's so angry.",
            "burmese":
                "သူ ဘာလို့ ဒီလောက်တောင် စိတ်တိုနေတာလဲဆိုတာ လုံးဝ စဉ်းစားမရဘူး။",
          },
          {
            "english": "I have no idea why the internet is so slow.",
            "burmese": "အင်တာနက် ဘာလို့ ဒီလောက်နှေးနေတာလဲ လုံးဝကို မသိတော့ဘူး။",
          },
          {
            "english": "I have no idea why I'm so tired today.",
            "burmese":
                "ဒီနေ့ ဘာလို့ ဒီလောက် ပင်ပန်းနေတာလဲဆိုတာ စဉ်းစားလို့မရဘူး။",
          },
          {
            "english": "I have no idea why she left so early.",
            "burmese":
                "သူမ ဘာလို့ ဒီလောက် စောစောပြန်သွားတာလဲဆိုတာ လုံးဝ မသိဘူး။",
          },
          {
            "english": "I have no idea why this machine isn't working.",
            "burmese": "ဒီစက်က ဘာလို့ အလုပ်မလုပ်တာလဲဆိုတာ လုံးဝ စဉ်းစားမရဘူး။",
          },
          {
            "english": "I have no idea why I said that.",
            "burmese":
                "အဲ့ဒီစကားကို ငါဘာလို့ ပြောလိုက်မိလဲဆိုတာ ကိုယ့်ဘာကိုယ်တောင် မသိဘူး။",
          },
          {
            "english": "I have no idea why it's so expensive.",
            "burmese":
                "ဒါက ဘာလို့ ဒီလောက် ဈေးကြီးနေရတာလဲဆိုတာ လုံးဝ စဉ်းစားမရဘူး။",
          },
          {
            "english": "I have no idea why the store is closed today.",
            "burmese": "ဒီနေ့ ဆိုင်ဘာလို့ ပိတ်ထားတာလဲဆိုတာ လုံးဝ မသိဘူး။",
          },
          {
            "english": "I have no idea why I keep failing.",
            "burmese": "ငါဘာလို့ ခဏခဏ ကျရှုံးနေတာလဲဆိုတာ လုံးဝ စဉ်းစားမရဘူး။",
          },
          {
            "english": "I have no idea why he didn't call me.",
            "burmese": "သူ ဘာလို့ ငါ့ကို ဖုန်းမဆက်တာလဲဆိုတာ လုံးဝ မသိဘူး။",
          },
          {
            "english": "I have no idea why I feel so nervous.",
            "burmese": "ငါဘာလို့ ဒီလောက် ရင်ခုန်နေတာလဲဆိုတာ စဉ်းစားလို့မရဘူး။",
          },
          {
            "english": "I have no idea why they changed the schedule.",
            "burmese":
                "သူတို့ ဘာလို့ အချိန်ဇယား ပြောင်းလိုက်တာလဲဆိုတာ လုံးဝ မသိဘူး။",
          },
          {
            "english": "I have no idea why I'm laughing.",
            "burmese": "ငါဘာလို့ ရယ်နေတာလဲဆိုတာ ကိုယ့်ဘာကိုယ်တောင် မသိဘူး။",
          },
          {
            "english": "I have no idea why you like this movie.",
            "burmese":
                "မင်း ဒီရုပ်ရှင်ကို ဘာလို့ ကြိုက်နေတာလဲဆိုတာ ငါ လုံးဝ စဉ်းစားမရဘူး။",
          },
          {
            "english": "I have no idea why it's raining in this season.",
            "burmese":
                "ဒီရာသီမှာ ဘာလို့ မိုးရွာနေတာလဲဆိုတာ လုံးဝ စဉ်းစားမရဘူး။",
          },
        ],
      ),
    ],
  ),
  SpokenPatternCategory(
    title: "5. Questions & Social Interaction",
    patterns: [
      SpokenPattern(
        title: "Do you mind if I...?",
        burmeseMeaning:
            "ကျွန်တော် ... ရင် ခင်ဗျား အဆင်ပြေပါ့မလား? / စိတ်မရှိဘူးမလား?",
        usage: "ခွင့်တောင်းတဲ့အခါ အလွန်ယဉ်ကျေးတဲ့ စကားပြောပုံစံဖြစ်ပါတယ်။",
        examples: [
          {
            "english": "Do you mind if I sit here?",
            "burmese": "ဒီမှာ ထိုင်ရင် စိတ်မရှိဘူးမလား?",
          },
          {
            "english": "Do you mind if I open the window?",
            "burmese": "ပြတင်းပေါက် ဖွင့်လိုက်ရင် အဆင်ပြေပါ့မလား?",
          },
          {
            "english": "Do you mind if I use your phone for a second?",
            "burmese": "မင်းဖုန်း ခဏလောက် သုံးရင် စိတ်မရှိဘူးမလား?",
          },
          {
            "english": "Do you mind if I ask you a personal question?",
            "burmese":
                "ကိုယ်ရေးကိုယ်တာ မေးခွန်းတစ်ခု မေးရင် စိတ်မရှိပါနဲ့နော်။",
          },
          {
            "english": "Do you mind if I leave a bit early today?",
            "burmese": "ဒီနေ့ ကျွန်တော် နည်းနည်းစောပြန်ရင် အဆင်ပြေပါ့မလား?",
          },
          {
            "english": "Do you mind if I record this meeting?",
            "burmese": "ဒီအစည်းအဝေးကို အသံသွင်းထားရင် အဆင်ပြေမလား?",
          },
          {
            "english": "Do you mind if I bring a friend to the party?",
            "burmese": "ပွဲကို သူငယ်ချင်းတစ်ယောက် ခေါ်လာရင် စိတ်မရှိဘူးမလား?",
          },
          {
            "english": "Do you mind if I smoke outside?",
            "burmese": "အပြင်မှာ ဆေးလိပ်သွားသောက်ရင် အဆင်ပြေပါ့မလား?",
          },
          {
            "english": "Do you mind if I change the channel?",
            "burmese": "လိုင်းပြောင်းလိုက်ရင် စိတ်မရှိဘူးမလား?",
          },
          {
            "english": "Do you mind if I borrow this book?",
            "burmese": "ဒီစာအုပ် ခဏငှားသွားရင် အဆင်ပြေမလား?",
          },
          {
            "english": "Do you mind if I turn up the volume?",
            "burmese": "အသံနည်းနည်း ထပ်မြှင့်လိုက်ရင် စိတ်မရှိဘူးမလား?",
          },
          {
            "english": "Do you mind if I take a look at your report?",
            "burmese":
                "ခင်ဗျားရဲ့ အစီရင်ခံစာကို တစ်ချက်လောက် ကြည့်ရင် အဆင်ပြေမလား?",
          },
          {
            "english": "Do you mind if I join you guys for lunch?",
            "burmese":
                "နေ့လည်စာ အတူတူစားဖို့ ကျွန်တော်ပါ လိုက်ခဲ့ရင် အဆင်ပြေမလား?",
          },
          {
            "english": "Do you mind if I pay by credit card?",
            "burmese": "ကတ်နဲ့ ငွေပေးချေရင် အဆင်ပြေပါ့မလား?",
          },
          {
            "english": "Do you mind if I ask for your name again?",
            "burmese":
                "ခင်ဗျားနာမည်လေး နောက်တစ်ခေါက် ပြန်မေးရင် စိတ်မရှိပါနဲ့နော်။",
          },
        ],
      ),
      SpokenPattern(
        title: "Thank you for...",
        burmeseMeaning: "...ပေးတဲ့အတွက် ကျေးဇူးတင်ပါတယ်",
        usage:
            "ပြုလုပ်ပေးခဲ့တဲ့ အရာတစ်ခုခုအတွက် ကျေးဇူးတင်ကြောင်း ဖော်ပြရာတွင် သုံးသည်။ (Thank you for + V-ing/Noun)",
        examples: [
          {
            "english": "Thank you for your help.",
            "burmese": "ကူညီပေးတဲ့အတွက် ကျေးဇူးတင်ပါတယ်။",
          },
          {
            "english": "Thank you for coming today.",
            "burmese": "ဒီနေ့ လာပေးတဲ့အတွက် ကျေးဇူးတင်ပါတယ်။",
          },
          {
            "english": "Thank you for being so patient.",
            "burmese": "စိတ်ရှည်ပေးတဲ့အတွက် ကျေးဇူးတင်ပါတယ်။",
          },
          {
            "english": "Thank you for inviting me to the party.",
            "burmese": "ပွဲကို ဖိတ်ကြားပေးတဲ့အတွက် ကျေးဇူးတင်ပါတယ်။",
          },
          {
            "english": "Thank you for the wonderful gift.",
            "burmese": "လှပတဲ့ လက်ဆောင်လေးအတွက် ကျေးဇူးတင်ပါတယ်။",
          },
          {
            "english": "Thank you for sharing your ideas.",
            "burmese": "ခင်ဗျားရဲ့ အကြံဉာဏ်တွေကို မျှဝေပေးလို့ ကျေးဇူးပါ။",
          },
          {
            "english": "Thank you for listening to me.",
            "burmese": "ငါပြောတာတွေကို နားထောင်ပေးလို့ ကျေးဇူးတင်ပါတယ်။",
          },
          {
            "english": "Thank you for your hard work.",
            "burmese": "ပင်ပင်ပန်းပန်း ကြိုးစားပေးတဲ့အတွက် ကျေးဇူးတင်ပါတယ်။",
          },
          {
            "english": "Thank you for pointing that out.",
            "burmese": "အဲ့ဒါကို ထောက်ပြပေးတဲ့အတွက် ကျေးဇူးတင်ပါတယ်။",
          },
          {
            "english": "Thank you for taking care of my cat.",
            "burmese":
                "ကျွန်တော့်ကြောင်လေးကို ကြည့်ရှုစောင့်ရှောက်ပေးလို့ ကျေးဇူးပါ။",
          },
          {
            "english": "Thank you for the quick response.",
            "burmese": "အမြန်ဆုံး အကြောင်းပြန်ပေးတဲ့အတွက် ကျေးဇူးတင်ပါတယ်။",
          },
          {
            "english": "Thank you for your kind words.",
            "burmese": "အားပေးစကားတွေအတွက် ကျေးဇူးတင်ပါတယ်။",
          },
          {
            "english": "Thank you for keeping me updated.",
            "burmese": "သတင်းအခြေအနေတွေ အမြဲပြောပြပေးလို့ ကျေးဇူးပါ။",
          },
          {
            "english": "Thank you for everything you've done.",
            "burmese": "လုပ်ပေးခဲ့တာ အားလုံးအတွက် ကျေးဇူးတင်ပါတယ်။",
          },
          {
            "english": "Thank you for letting me know.",
            "burmese": "ကျွန်တော့်ကို အသိပေးတဲ့အတွက် ကျေးဇူးတင်ပါတယ်။",
          },
        ],
      ),
      SpokenPattern(
        title: "How did it go?",
        burmeseMeaning: "ဘယ်လိုဖြစ်သွားလဲ? (အခြေအနေ အဆင်ပြေရဲ့လား?)",
        usage:
            "သူငယ်ချင်းတစ်ယောက် ကိစ္စတစ်ခုခု (အင်တာဗျူး၊ ချိန်းတွေ့မှု) သွားလုပ်ပြီး ပြန်လာတဲ့အခါ မေးလေ့ရှိတဲ့ စကားပါ။",
        examples: [
          {
            "english": "How did your interview go?",
            "burmese": "မင်းရဲ့ အင်တာဗျူး ဘယ်လိုဖြစ်သွားလဲ? (အဆင်ပြေရဲ့လား?)",
          },
          {
            "english": "How did the meeting go today?",
            "burmese": "ဒီနေ့ အစည်းအဝေး အခြေအနေ ဘယ်လိုလဲ?",
          },
          {
            "english": "How did your exam go?",
            "burmese": "စာမေးပွဲ ဖြေနိုင်ခဲ့ရဲ့လား?",
          },
          {
            "english": "How did your first date go?",
            "burmese": "ပထမဆုံး ချိန်းတွေ့မှု အခြေအနေ ဘယ်လိုလဲ?",
          },
          {
            "english": "How did the doctor's appointment go?",
            "burmese": "ဆရာဝန်နဲ့ ပြတာ ဘာပြောလဲ? (အဆင်ပြေလား?)",
          },
          {
            "english": "How did the presentation go?",
            "burmese": "စာတမ်းဖတ်ပွဲ အဆင်ပြေရဲ့လား?",
          },
          {
            "english": "How did the negotiation go?",
            "burmese": "ညှိနှိုင်းမှု အခြေအနေ ဘယ်လိုရှိလဲ?",
          },
          {
            "english": "How did the party go last night?",
            "burmese": "မနေ့ညက ပွဲက ပျော်ဖို့ကောင်းရဲ့လား?",
          },
          {
            "english": "How did the surgery go?",
            "burmese": "ခွဲစိတ်မှု အခြေအနေ အဆင်ပြေရဲ့လား?",
          },
          {
            "english": "How did the trip to Bagan go?",
            "burmese": "ပုဂံခရီးစဉ် ဘယ်လိုလဲ? ပျော်ခဲ့လား?",
          },
          {
            "english": "How did the game go?",
            "burmese": "ပွဲစဉ်က ဘယ်လိုဖြစ်သွားလဲ? (နိုင်လား ရှုံးလား?)",
          },
          {
            "english": "How did the rehearsal go?",
            "burmese": "ဇာတ်တိုက်တာ အဆင်ပြေရဲ့လား?",
          },
          {
            "english": "How did the wedding go?",
            "burmese": "မင်္ဂလာဆောင် အခမ်းအနား အဆင်ပြေပြေ ပြီးသွားလား?",
          },
          {
            "english": "How did the audit go?",
            "burmese": "စာရင်းစစ်တာ အခြေအနေ ဘယ်လိုလဲ?",
          },
          {
            "english": "How did the trial run go?",
            "burmese": "စမ်းသပ်မောင်းနှင်မှု အဆင်ပြေရဲ့လား?",
          },
        ],
      ),
      SpokenPattern(
        title: "What do you say we...?",
        burmeseMeaning: "ငါတို့ ... ကြရင် ဘယ်လိုလဲ? (သဘောတူလား?)",
        usage:
            "How about ထက် ပိုပြီး Native ဆန်တဲ့ အကြံပြုချက်တောင်းတဲ့ အမေးပုံစံပါ။",
        examples: [
          {
            "english": "What do you say we grab some dinner?",
            "burmese": "ငါတို့ ညစာ သွားစားကြရင် ဘယ်လိုလဲ?",
          },
          {
            "english": "What do you say we take a break for ten minutes?",
            "burmese": "ဆယ်မိနစ်လောက် နားကြရင် ဘယ်လိုလဲ?",
          },
          {
            "english": "What do you say we go to the beach this weekend?",
            "burmese": "ဒီအပတ် ပိတ်ရက်မှာ ကမ်းခြေသွားကြမလား?",
          },
          {
            "english": "What do you say we skip the movie and stay home?",
            "burmese": "ရုပ်ရှင်မသွားတော့ဘဲ အိမ်မှာပဲ နေကြရင် ဘယ်လိုလဲ?",
          },
          {
            "english": "What do you say we start all over again?",
            "burmese": "အစကနေ ပြန်စကြရင် ဘယ်လိုလဲ?",
          },
          {
            "english": "What do you say we give it one more try?",
            "burmese": "နောက်တစ်ခေါက်လောက် ထပ်စမ်းကြည့်ကြရင် ဘယ်လိုလဲ?",
          },
          {
            "english": "What do you say we call it a day?",
            "burmese":
                "ဒီနေ့အတွက် ဒီမှာပဲ တော်ကြရင် ဘယ်လိုလဲ? (အလုပ်သိမ်းရအောင်)",
          },
          {
            "english": "What do you say we share the expenses?",
            "burmese": "ကုန်ကျစရိတ်ကို ခွဲရှင်းကြရင် ဘယ်လိုလဲ?",
          },
          {
            "english": "What do you say we ask for a discount?",
            "burmese": "ဈေးလျှော့ခိုင်းကြည့်ရင် ဘယ်လိုလဲ?",
          },
          {
            "english": "What do you say we move the meeting to Monday?",
            "burmese": "အစည်းအဝေးကို တနင်္လာနေ့ ရွှေ့လိုက်ရင် ဘယ်လိုလဲ?",
          },
          {
            "english": "What do you say we celebrate your promotion?",
            "burmese": "မင်း ရာထူးတိုးတာကို အောင်ပွဲခံကြရင် ဘယ်လိုလဲ?",
          },
          {
            "english": "What do you say we buy this car?",
            "burmese": "ဒီကားကို ဝယ်လိုက်ကြရင် ဘယ်လိုလဲ?",
          },
          {
            "english": "What do you say we invite them over?",
            "burmese": "သူတို့ကို အိမ်ဖိတ်လိုက်ရင် ဘယ်လိုလဲ?",
          },
          {
            "english": "What do you say we go for a walk in the park?",
            "burmese": "ပန်းခြံထဲမှာ လမ်းလျှောက်ကြရင် ဘယ်လိုလဲ?",
          },
          {
            "english": "What do you say we change the topic?",
            "burmese": "ဒီအကြောင်းအရာကို ပြောင်းပြောကြရင် ဘယ်လိုလဲ?",
          },
        ],
      ),
      SpokenPattern(
        title: "I don't mean to be rude, but...",
        burmeseMeaning: "ရိုင်းတယ်လို့တော့ မထင်စေချင်ဘူး၊ ဒါပေမယ့်...",
        usage:
            "တစ်ဖက်လူ စိတ်ဆိုးသွားနိုင်တဲ့ စကားကို မပြောခင် အနုနည်းနဲ့ အစပျိုးတာပါ။",
        examples: [
          {
            "english":
                "I don't mean to be rude, but could you lower your voice?",
            "burmese":
                "ရိုင်းတယ်လို့တော့ မထင်စေချင်ဘူး၊ ဒါပေမယ့် အသံလေး နည်းနည်းလျှော့ပေးလို့ ရမလား?",
          },
          {
            "english":
                "I don't mean to be rude, but you're standing in my way.",
            "burmese":
                "ရိုင်းတယ်လို့တော့ မထင်ပါနဲ့၊ ဒါပေမယ့် ခင်ဗျား ကျွန်တော့်လမ်းကို ပိတ်နေလို့ပါ။",
          },
          {
            "english":
                "I don't mean to be rude, but I'm actually quite busy right now.",
            "burmese":
                "ရိုင်းတယ်လို့ မထင်စေချင်ဘူး၊ ဒါပေမယ့် အခု ကျွန်တော် တကယ် အလုပ်ရှုပ်နေလို့ပါ။",
          },
          {
            "english": "I don't mean to be rude, but I think you're mistaken.",
            "burmese":
                "ရိုင်းတယ်လို့ မဟုတ်ပါဘူး၊ ဒါပေမယ့် ခင်ဗျား မှားနေတယ်လို့ ကျွန်တော် ထင်တယ်။",
          },
          {
            "english":
                "I don't mean to be rude, but this isn't what I ordered.",
            "burmese":
                "ရိုင်းတယ်လို့ မဟုတ်ပါဘူး၊ ဒါပေမယ့် ဒါ ကျွန်တော် မှာထားတဲ့ဟာ မဟုတ်ဘူး။",
          },
          {
            "english":
                "I don't mean to be rude, but you have something on your face.",
            "burmese":
                "ရိုင်းတယ်လို့ မထင်ပါနဲ့၊ ခင်ဗျားမျက်နှာမှာ တစ်ခုခု ပေနေလို့ပါ။",
          },
          {
            "english":
                "I don't mean to be rude, but I'd like to talk to the manager.",
            "burmese":
                "ရိုင်းသလို ဖြစ်သွားရင် ခွင့်လွှတ်ပါ၊ ဒါပေမယ့် ကျွန်တော် မန်နေဂျာနဲ့ စကားပြောချင်လို့ပါ။",
          },
          {
            "english": "I don't mean to be rude, but that's not your business.",
            "burmese":
                "ရိုင်းတယ်လို့တော့ မထင်စေချင်ဘူး၊ ဒါပေမယ့် ဒါ ခင်ဗျားနဲ့ မဆိုင်တဲ့ ကိစ္စပါ။",
          },
          {
            "english":
                "I don't mean to be rude, but can we talk about this later?",
            "burmese":
                "ရိုင်းတယ်လို့ မဟုတ်ပါဘူး၊ ဒါကို နောက်မှ ပြောလို့ ရမလား?",
          },
          {
            "english":
                "I don't mean to be rude, but I don't really like your tone.",
            "burmese":
                "ရိုင်းတယ်လို့ မထင်ပါနဲ့၊ ခင်ဗျား ပြောတဲ့ အပြောအဆိုကို ကျွန်တော် သိပ်မကြိုက်ဘူး။",
          },
          {
            "english": "I don't mean to be rude, but you're late again.",
            "burmese":
                "ရိုင်းတယ်လို့တော့ မဟုတ်ဘူး၊ ဒါပေမယ့် မင်း နောက်တစ်ခါ ထပ်နောက်ကျပြန်ပြီ။",
          },
          {
            "english": "I don't mean to be rude, but I have to go now.",
            "burmese":
                "ရိုင်းတယ်လို့ မထင်စေချင်ဘူး၊ ဒါပေမယ့် ကျွန်တော် အခု သွားမှ ဖြစ်တော့မယ်။",
          },
          {
            "english":
                "I don't mean to be rude, but I don't agree with you at all.",
            "burmese":
                "ရိုင်းတယ်လို့တော့ မဟုတ်ပါဘူး၊ ဒါပေမယ့် ခင်ဗျားကို ကျွန်တော် လုံးဝ သဘောမတူဘူး။",
          },
          {
            "english":
                "I don't mean to be rude, but could you please stop smoking here?",
            "burmese":
                "ရိုင်းတယ်လို့ မဟုတ်ပါဘူး၊ ဒီမှာ ဆေးလိပ်မသောက်ဖို့ တောင်းပန်ချင်လို့ပါ။",
          },
          {
            "english":
                "I don't mean to be rude, but your behavior was unacceptable.",
            "burmese":
                "ရိုင်းတယ်လို့ မထင်ပါနဲ့၊ ခင်ဗျားရဲ့ အပြုအမူက လက်ခံနိုင်စရာ မရှိဘူး။",
          },
        ],
      ),
    ],
  ),
];
