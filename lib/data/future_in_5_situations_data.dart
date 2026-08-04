// =============================================================================
//  Future Tense in 5 Different Situations – Lesson & Quiz Data
//  Based on: "How to use future tense in 5 different situations" (Myanmar English)
//
//  Compatible with FutureTenseIn5DifferentSituations screen (lesson cards)
//  and QuizLessonPage (q / a / options / type / mm)
// =============================================================================

/// Lesson data — one entry per situation.
/// Each entry has:
///   'situation'  : short label (e.g., 'Situation 1')
///   'title'      : English situation title
///   'titleMm'    : Burmese title
///   'formula'    : grammar formula string (uses [brackets] for highlighting)
///   'explanation': English explanation of when/why to use this structure
///   'desc'       : Burmese description
///   'tip'        : Extra Burmese/English tip or note
///   'examples'   : List of {en, breakdown, mm} maps
final List<Map<String, dynamic>> future5SituationsData = [
  // ─────────────────────────────────────────────────────────────────────────
  // SITUATION 1 – Future Plans (Definite / Arranged)
  // Structure: Present Continuous  (am / is / are + V-ing)
  // ─────────────────────────────────────────────────────────────────────────
  {
    'situation': 'Situation 1',
    'title': 'Future Plans (Definite Arrangements)',
    'titleMm': 'သေချာစီစဉ်ပြီးသား အနာဂတ်အစီအစဉ်တွေ',
    'formula': '[am / is / are] + [V-ing]',
    'explanation':
        'We use the Present Continuous tense (am/is/are + -ing) to talk about '
        'DEFINITE future plans — things already arranged or booked. '
        'There is usually a specific time mentioned.',
    'desc':
        'Present Continuous ကို အခုဖြစ်နေတဲ့အရာတွေကိုပဲ ပြောဖို့မဟုတ်ဘဲ၊ '
        'အနာဂတ်မှာ လုပ်ဖို့ သေချာစီစဉ်ပြီးသား အစီအစဉ်တွေကိုလည်း ပြောတဲ့အခါ သုံးလို့ရတယ်။ '
        'အများအားဖြင့် ဘယ်အချိန်မှာ လုပ်မလဲဆိုတာကိုလည်း ပြောလေ့ရှိတယ်။ '
        'ဥပမာ tomorrow, tonight, next week စတာတွေပေါ့။',
    'tip':
        '💡 ဒီလိုစကားလုံးတွေ တွေ့ရင် ဒီပုံစံကို သုံးနိုင်တယ် — '
        'tonight, tomorrow, next week, on Friday, at 3 pm\n'
        '⚠️ "I am going to Hawaii" ဆိုတာက ဒီ grammar မဟုတ်ဘူး။ '
        '"be going to" ဆိုတဲ့ grammar ပုံစံ သီးသန့်ဖြစ်တယ်။ '
        'Present Continuous ဖြစ်ဖို့ meeting, flying, having လို V-ing action verb ပါရမယ်။',
    'examples': [
      {
        'en': "I'm meeting my teacher at 9 a.m. tomorrow.",
        'breakdown': "I'm [meeting] my teacher at 9 a.m. tomorrow.",
        'mm': 'မနက်ဖြန် မနက် ၉ နာရီမှာ ဆရာနဲ့ တွေ့ဖို့ ချိန်းထားတယ်။',
      },
      {
        'en': "She's flying to Singapore this Saturday.",
        'breakdown': "She's [flying] to Singapore this Saturday.",
        'mm': 'ဒီစနေနေ့ သူ စင်ကာပူကို လေယာဉ်နဲ့ သွားဖို့ စီစဉ်ထားတယ်။',
      },
      {
        'en': "We're having a team dinner next Friday.",
        'breakdown': "We're [having] a team dinner next Friday.",
        'mm': 'လာမယ့်သောကြာနေ့မှာ အဖွဲ့လိုက် ညစာစားဖို့ စီစဉ်ထားတယ်။',
      },
      {
        'en': "They're moving to a new apartment at the end of the month.",
        'breakdown':
            "They're [moving] to a new apartment at the end of the month.",
        'mm': 'ဒီလကုန်ရင် သူတို့ အိမ်အသစ်ကို ပြောင်းဖို့ စီစဉ်ထားတယ်။',
      },
      {
        'en': "I'm eating mohinga tonight.",
        'breakdown': "I'm [eating] mohinga tonight.",
        'mm': 'ဒီည မုန့်ဟင်းခါးစားမယ်လို့ စီစဉ်ထားတယ်။',
      },
      {
        'en': "He's starting his new job on Monday.",
        'breakdown': "He's [starting] his new job on Monday.",
        'mm': 'တနင်္လာနေ့မှာ သူ့အလုပ်အသစ် စလုပ်မယ်လို့ စီစဉ်ထားတယ်။',
      },
      {
        'en': "My parents are visiting me next week.",
        'breakdown': "My parents are [visiting] me next week.",
        'mm': 'နောက်အပတ်မှာ မိဘတွေ လာလည်ဖို့ စီစဉ်ထားတယ်။',
      },
    ],
  },

  // ─────────────────────────────────────────────────────────────────────────
  // SITUATION 2 – Future Plans (Intentions / Not Definite)
  // Structure: be going to + base verb
  // ─────────────────────────────────────────────────────────────────────────
  {
    'situation': 'Situation 2',
    'title': 'Future Plans (Intentions / Not Yet Fixed)',
    'titleMm': 'ကြိုတင်စိတ်ကူးထားတဲ့ အစီအစဉ်တွေ',
    'formula': '[am / is / are] + [going to] + [base verb]',
    'explanation':
        'We use "be going to + base verb" when we talk about plans or intentions '
        'that have already been decided in our mind, but may not yet be fully arranged. '
        'There is a sense of prior intention — the decision was made before speaking.',
    'desc':
        '"be going to + V1" ကို အရင်ကတည်းက စိတ်ထဲမှာ ဆုံးဖြတ်ထားတဲ့ '
        'အစီအစဉ် ဒါမှမဟုတ် ရည်ရွယ်ချက်ကို ပြောတဲ့အခါ သုံးတယ်။ '
        'ဒါပေမယ့် ဘယ်နေ့၊ ဘယ်အချိန်၊ ဘယ်လိုလုပ်မလဲဆိုတာကိုတော့ '
        'အတိအကျ မစီစဉ်ရသေးတာလည်း ဖြစ်နိုင်တယ်။\n'
        'အလွယ်ပြောရရင် — "ဒါကို လုပ်မယ်လို့ ငါ စိတ်ကူးထားပြီးသား" ဆိုတဲ့သဘောမျိုးပါ။',
    'tip':
        '💡 "be going to" ကို အငြင်းပုံစံနဲ့လည်း သုံးလို့ရတယ်။\n'
        '"I\'m going to study." → စာလေ့လာမယ်လို့ စိတ်ကူးထားတယ်။\n'
        '"I\'m not going to study." → စာမလေ့လာဘူးလို့ ဆုံးဖြတ်ထားတယ်။',
    'examples': [
      {
        'en': "We're going to go to Hawaii this year.",
        'breakdown': "We're going to [go] to Hawaii this year.",
        'mm': 'ဒီနှစ် ဟာဝိုင်ယီကို သွားမယ်လို့ စိတ်ကူးထားတယ်။',
      },
      {
        'en': "I'm going to study English every day this month.",
        'breakdown': "I'm going to [study] English every day this month.",
        'mm': 'ဒီလထဲမှာ နေ့တိုင်း အင်္ဂလိပ်စာ လေ့လာမယ်လို့ ဆုံးဖြတ်ထားတယ်။',
      },
      {
        'en': "She's going to apply for a scholarship next year.",
        'breakdown': "She's going to [apply] for a scholarship next year.",
        'mm': 'နောက်နှစ် ပညာသင်ဆု လျှောက်မယ်လို့ သူ ဆုံးဖြတ်ထားတယ်။',
      },
      {
        'en': "They're going to open a new restaurant downtown.",
        'breakdown': "They're going to [open] a new restaurant downtown.",
        'mm': 'မြို့ထဲမှာ စားသောက်ဆိုင်အသစ် ဖွင့်မယ်လို့ သူတို့ စိတ်ကူးထားတယ်။',
      },
      {
        'en': "I'm not going to waste my time on that.",
        'breakdown': "I'm not going to [waste] my time on that.",
        'mm': 'အဲဒီကိစ္စနဲ့ အချိန်မဖြုန်းတော့ဘူးလို့ ဆုံးဖြတ်ထားတယ်။',
      },
      {
        'en': "He's going to take a cooking class this summer.",
        'breakdown': "He's going to [take] a cooking class this summer.",
        'mm': 'ဒီနွေရာသီမှာ ဟင်းချက်သင်တန်း တက်မယ်လို့ သူ ဆုံးဖြတ်ထားတယ်။',
      },
      {
        'en': "We're going to redecorate our living room.",
        'breakdown': "We're going to [redecorate] our living room.",
        'mm': 'ဧည့်ခန်းကို ပြန်ပြီး အလှဆင်မယ်လို့ စိတ်ကူးထားတယ်။',
      },
    ],
  },

  // ─────────────────────────────────────────────────────────────────────────
  // SITUATION 3 – Predictions (Based on Evidence)
  // Structure: be going to + base verb
  // ─────────────────────────────────────────────────────────────────────────
  {
    'situation': 'Situation 3',
    'title': 'Predictions (Based on Evidence / Signs)',
    'titleMm': 'အခုမြင်နေရတဲ့ အခြေအနေကိုကြည့်ပြီး ခန့်မှန်းပြောတာ',
    'formula': '[am / is / are] + [going to] + [base verb]',
    'explanation':
        'We ALSO use "be going to + base verb" for predictions when there is '
        'visible evidence or clear signs right now that something WILL happen. '
        'We can already see it is about to occur.',
    'desc':
        '"be going to + V1" ကို အခုလက်ရှိ မြင်နေရတဲ့ အခြေအနေ၊ '
        'လက္ခဏာတွေကို ကြည့်ပြီး အနာဂတ်မှာ တစ်ခုခု ဖြစ်လာမယ်လို့ '
        'ခန့်မှန်းတဲ့အခါ သုံးတယ်။\n'
        'ဥပမာ မိုးတိမ်မည်းတွေ အများကြီးတွေ့နေရရင် '
        '"It\'s going to rain." လို့ ပြောနိုင်တယ်။ '
        'အဓိပ္ပာယ်က "မိုးရွာတော့မယ်" ဆိုတဲ့သဘောပါ။',
    'tip':
        '💡 ဒီနှစ်ခုကို ခွဲပြီး မှတ်ထားပါ။\n'
        '"It will rain tomorrow." → မနက်ဖြန် မိုးရွာမယ်လို့ အထွေထွေ ခန့်မှန်းပြောတာ။\n'
        '"It\'s going to rain." → အခု မိုးတိမ်မည်းတွေ မြင်နေရလို့ မိုးရွာတော့မယ်လို့ ခန့်မှန်းတာ။',
    'examples': [
      {
        'en': "It's going to rain. Look at those dark clouds!",
        'breakdown': "It's going to [rain]. Look at those dark clouds!",
        'mm': 'မိုးရွာတော့မယ်။ ဟိုမှာ မိုးတိမ်မည်းတွေ ကြည့်ပါဦး။',
      },
      {
        'en': "Watch out! That car is going to hit the wall!",
        'breakdown': "Watch out! That car is going to [hit] the wall!",
        'mm': 'သတိထား! အဲဒီကား နံရံကို တိုက်တော့မယ်!',
      },
      {
        'en': "She's going to fall if she's not careful on those stairs.",
        'breakdown':
            "She's going to [fall] if she's not careful on those stairs.",
        'mm': 'လှေကားမှာ သတိမထားရင် သူ လဲတော့မယ်။',
      },
      {
        'en': "He ate almost nothing today — he's going to be hungry soon.",
        'breakdown':
            "He ate almost nothing today — he's going to [be] hungry soon.",
        'mm': 'ဒီနေ့ သူ ဘာမှသိပ်မစားထားဘူး။ မကြာခင် ဗိုက်ဆာတော့မယ်။',
      },
      {
        'en': "The battery is at 1%. The phone is going to die.",
        'breakdown': "The battery is at 1%. The phone is going to [die].",
        'mm': 'ဘက်ထရီ ၁% ပဲကျန်တော့တယ်။ ဖုန်းပိတ်တော့မယ်။',
      },
      {
        'en': "Look at that traffic — we're going to be late.",
        'breakdown': "Look at that traffic — we're going to [be] late.",
        'mm': 'ဟိုကားတွေကြည့်ပါဦး။ ငါတို့ နောက်ကျတော့မယ်။',
      },
      {
        'en': "Her score is very low. She's going to fail the test.",
        'breakdown': "Her score is very low. She's going to [fail] the test.",
        'mm': 'သူ့အမှတ်က အရမ်းနည်းတယ်။ စာမေးပွဲကျတော့မယ်။',
      },
    ],
  },

  // ─────────────────────────────────────────────────────────────────────────
  // SITUATION 4 – On-the-Spot Decisions
  // Structure: will + base verb
  // ─────────────────────────────────────────────────────────────────────────
  {
    'situation': 'Situation 4',
    'title': 'On-the-Spot Decisions',
    'titleMm': 'အခုချက်ချင်း ဆုံးဖြတ်လိုက်တာ',
    'formula': '[will] + [base verb]',
    'explanation':
        'We use "will + base verb" when we make a decision AT THE MOMENT of speaking — '
        'NOT something we planned before. It is a spontaneous decision made right now.',
    'desc':
        '"will + V1" ကို အရင်ကတည်းက ကြိုတင်စီစဉ်ထားတာမဟုတ်ဘဲ '
        'ပြောနေတဲ့အချိန်မှာပဲ ချက်ချင်း ဆုံးဖြတ်လိုက်တဲ့အရာကို ပြောတဲ့အခါ သုံးတယ်။\n'
        'အလွယ်ပြောရရင် — "အခုမှ စဉ်းစားပြီး ဒီလိုလုပ်မယ်လို့ ဆုံးဖြတ်လိုက်တာ" ဆိုတဲ့သဘောပါ။',
    'tip':
        '💡 ဥပမာ စားသောက်ဆိုင်ရောက်ပြီး မီနူးကြည့်တဲ့အချိန်မှ ရှမ်းခေါက်ဆွဲစားမယ်လို့ '
        'ဆုံးဖြတ်လိုက်တယ်ဆိုရင် "I\'ll have the Shan noodles." လို့ ပြောနိုင်တယ်။\n'
        'ဒါက အိမ်ကနေ ထွက်လာတုန်းကတည်းက စီစဉ်ထားတာမဟုတ်ဘဲ '
        'အဲဒီအချိန်မှာပဲ ဆုံးဖြတ်လိုက်တာ ဖြစ်တယ်။',
    'examples': [
      {
        'en': "I'll have the Shan noodles, please.",
        'breakdown': "I'll [have] the Shan noodles, please.",
        'mm': 'ရှမ်းခေါက်ဆွဲပဲ မှာမယ်နော်။',
      },
      {
        'en': "The phone is ringing. I'll get it!",
        'breakdown': "The phone is ringing. I'll [get] it!",
        'mm': 'ဖုန်းမြည်နေတယ်။ ငါ ကိုင်လိုက်မယ်!',
      },
      {
        'en': "You look tired. I'll make you some tea.",
        'breakdown': "You look tired. I'll [make] you some tea.",
        'mm': 'မင်း ပင်ပန်းနေသလိုပဲ။ ငါ လက်ဖက်ရည် ဖျော်ပေးမယ်။',
      },
      {
        'en': "That book sounds great! I'll buy it this afternoon.",
        'breakdown': "That book sounds great! I'll [buy] it this afternoon.",
        'mm': 'အဲဒီစာအုပ်က ကောင်းမယ့်ပုံပဲ။ ဒီနေ့မွန်းလွဲကျရင် ဝယ်မယ်။',
      },
      {
        'en': "There's no milk left. I'll go to the shop and get some.",
        'breakdown':
            "There's no milk left. I'll [go] to the shop and get some.",
        'mm': 'နို့ကုန်သွားပြီ။ ငါ ဆိုင်သွားပြီး ဝယ်လာမယ်။',
      },
      {
        'en': "I can't decide — I'll just take the first one.",
        'breakdown': "I can't decide — I'll just [take] the first one.",
        'mm': 'ဘာယူရမလဲ မဆုံးဖြတ်တတ်တော့ဘူး။ ပထမတစ်ခုကိုပဲ ယူလိုက်မယ်။',
      },
      {
        'en': "You dropped your bag! I'll pick it up for you.",
        'breakdown': "You dropped your bag! I'll [pick] it up for you.",
        'mm': 'မင်းအိတ်ကျသွားတယ်။ ငါ ကောက်ပေးမယ်။',
      },
    ],
  },

  // ─────────────────────────────────────────────────────────────────────────
  // SITUATION 5 – Offers & Promises
  // Structure: will + base verb
  // ─────────────────────────────────────────────────────────────────────────
  {
    'situation': 'Situation 5',
    'title': 'Offers & Promises',
    'titleMm': 'ကူညီပေးမယ်လို့ ကမ်းလှမ်းတာနဲ့ ကတိပေးတာ',
    'formula': '[will] + [base verb]',
    'explanation':
        'We also use "will + base verb" to make OFFERS (helping someone voluntarily) '
        'and PROMISES (committing to do something in the future). '
        'The key feeling is willingness and commitment.',
    'desc':
        '"will + V1" ကို တစ်ယောက်ယောက်ကို ကူညီပေးမယ်လို့ ကိုယ်တိုင် ကမ်းလှမ်းတဲ့အခါ '
        'သုံးနိုင်သလို၊ အနာဂတ်မှာ တစ်ခုခု လုပ်ပေးမယ်လို့ ကတိပေးတဲ့အခါလည်း သုံးတယ်။\n'
        'အဓိကကတော့ "ငါ လုပ်ပေးမယ်"၊ "ငါ ကတိပေးတယ်" ဆိုတဲ့သဘောပါ။',
    'tip':
        '💡 Offer (ကူညီပေးမယ်လို့ ကမ်းလှမ်းတာ)\n'
        '"I\'ll explain it to you." → ငါ ရှင်းပြပေးမယ်။\n\n'
        'Promise (ကတိပေးတာ)\n'
        '"I\'ll do it tomorrow." → မနက်ဖြန် ငါ လုပ်မယ်။\n\n'
        '💡 စကားပြောတဲ့အခါ "I will" ထက် "I\'ll" ကို ပိုသုံးလေ့ရှိတယ်။',
    'examples': [
      // Offers
      {
        'en': "I'll explain it to you right now.",
        'breakdown': "I'll [explain] it to you right now.",
        'mm': 'ငါ အခု ရှင်းပြပေးမယ်။',
      },
      {
        'en': "I'll carry those bags for you.",
        'breakdown': "I'll [carry] those bags for you.",
        'mm': 'အဲဒီအိတ်တွေ ငါ ထမ်းပေးမယ်။',
      },
      {
        'en': "I'll help you with that if you want.",
        'breakdown': "I'll [help] you with that if you want.",
        'mm': 'မင်းလိုရင် အဲဒါကို ငါ ကူညီပေးမယ်။',
      },
      {
        'en': "I'll show you how to use the app.",
        'breakdown': "I'll [show] you how to use the app.",
        'mm': 'ဒီ app ကို ဘယ်လိုသုံးရလဲ ငါ ပြပေးမယ်။',
      },

      // Promises
      {
        'en': "I'll do it tomorrow. I promise.",
        'breakdown': "I'll [do] it tomorrow. I promise.",
        'mm': 'မနက်ဖြန် ငါ လုပ်မယ်။ တကယ် ကတိပေးတယ်။',
      },
      {
        'en': "I won't tell anyone your secret. I promise.",
        'breakdown': "I won't [tell] anyone your secret. I promise.",
        'mm': 'မင်းရဲ့လျှို့ဝှက်ချက်ကို ဘယ်သူ့ကိုမှ ငါ မပြောဘူး။ ကတိပေးတယ်။',
      },
      {
        'en': "I'll call you as soon as I arrive.",
        'breakdown': "I'll [call] you as soon as I arrive.",
        'mm': 'ငါ ရောက်တာနဲ့ မင်းကို ချက်ချင်း ဖုန်းဆက်မယ်။',
      },
      {
        'en': "I'll be there on time. Don't worry.",
        'breakdown': "I'll [be] there on time. Don't worry.",
        'mm': 'ငါ အချိန်မီ ရောက်မယ်။ စိတ်မပူနဲ့။',
      },
    ],
  },
];

// =============================================================================
//  Quick-Comparison Table Data
//  shown at the top of the screen as a cheat-sheet
// =============================================================================
const List<List<String>> future5SituationsTableRows = [
  // [Situation, Structure, When to Use (English), မြန်မာ]
  [
    'Future Plans\n(Definite)',
    'Present Continuous\nam/is/are + V-ing',
    'Arranged events\n(booked / scheduled)',
    'ကြိုတင်ချိန်းဆိုပြီး အတည်ဖြစ်သောအစီအစဉ်',
  ],
  [
    'Future Plans\n(Intention)',
    'be going to\n+ base verb',
    'Decided but\nnot arranged',
    'ကြိုတင်ဆုံးဖြတ်ထားသော ရည်ရွယ်ချက်',
  ],
  [
    'Predictions\n(Evidence)',
    'be going to\n+ base verb',
    'Visible signs\nright now',
    'ယခုမျက်မြင် သက်သေပေါ် မူတည်သော ခန့်မှန်းချက်',
  ],
  [
    'Decisions\n(Spontaneous)',
    'will\n+ base verb',
    'Decided AT the\nmoment of speaking',
    'ပြောနေစဉ်ချက်ချင်း ဆုံးဖြတ်သောကိစ္စ',
  ],
  [
    'Offers &\nPromises',
    'will\n+ base verb',
    'Offering help or\nmaking a commitment',
    'ကမ်းလှမ်းချက် သို့မဟုတ် ကတိပေးမှု',
  ],
];

// =============================================================================
//  Quiz Data – field names match QuizLessonPage:
//  q (question), a (correct answer), options, type, mm (Burmese explanation)
// =============================================================================
final List<Map<String, dynamic>> future5SituationsQuizData = const [
  // --- Situation 1: Present Continuous for future plans ---
  {
    'q':
        'I _______ my friend at the airport tomorrow morning. (We already arranged it.)',
    'a': "am meeting",
    'options': ['will meet', 'am meeting', 'am going to meet', 'meet'],
    'type': 'Situation 1 – Definite Plans (Present Continuous)',
    'mm':
        'ကြိုတင်ချိန်းဆိုပြီးသောကြောင့် Present Continuous (am meeting) သုံးရသည်။ "tomorrow" ဆိုသော အနာဂတ်ကာလ ညွှန်ကိန်းပါ၍ ဤနေရာတွင် Future အဓိပ္ပာယ်ဖြင့် သုံးသည်။',
  },
  {
    'q': 'They _______ to Bangkok next Tuesday. (Tickets are already booked.)',
    'a': "are flying",
    'options': ['will fly', 'are flying', 'going to fly', 'fly'],
    'type': 'Situation 1 – Definite Plans (Present Continuous)',
    'mm':
        'လက်မှတ်ဝယ်ပြီးသောကြောင့် (ကြိုတင်စီစဉ်ပြီး) Present Continuous (are flying) သုံးရသည်။',
  },

  // --- Situation 2: be going to for intentions ---
  {
    'q': 'I _______ study harder from now on. (I\'ve decided this in my mind.)',
    'a': "am going to",
    'options': ['will', 'am going to', 'am', 'going'],
    'type': 'Situation 2 – Intentions (be going to)',
    'mm':
        'ကြိုတင်ဆုံးဖြတ်ထားသော ရည်ရွယ်ချက် (intention) ဖြစ်၍ "am going to" သုံးရသည်။',
  },
  {
    'q':
        'She _______ learn how to drive next month. (She has already decided.)',
    'a': "is going to",
    'options': ['will', 'is going to', 'is', 'going to'],
    'type': 'Situation 2 – Intentions (be going to)',
    'mm':
        'ပြောဆိုချိန် မတိုင်မီ ဆုံးဖြတ်ထားသောကြောင့် (intention) "is going to" သုံးရသည်။',
  },

  // --- Situation 3: be going to for predictions with evidence ---
  {
    'q':
        'Look at the sky — it _______ snow! (There are heavy grey clouds overhead.)',
    'a': "is going to",
    'options': ['will', 'is going to', 'is', 'snows'],
    'type': 'Situation 3 – Predictions with Evidence (be going to)',
    'mm':
        'မြင်နေရသော သက်သေ (မိုးတိမ်) ကြောင့် "is going to" သုံးရသည်။ "will snow" ဆိုသည်မှာ သက်သေမဲ့ ယေဘုယျ ခန့်မှန်းချက်ဖြစ်သည်။',
  },
  {
    'q':
        'He hasn\'t studied at all. He _______ fail the exam. (It\'s obvious.)',
    'a': "is going to",
    'options': ['will', 'is going to', 'is', 'would'],
    'type': 'Situation 3 – Predictions with Evidence (be going to)',
    'mm':
        'မသင်မကြားကြောင်း မျက်မြင်မြင်ရ၍ "is going to" (မြင်သာသော သက်သေ) သုံးရသည်။',
  },

  // --- Situation 4: will for on-the-spot decisions ---
  {
    'q':
        'A: "We have no bread left." B: "OK, I _______ go to the shop now." (Decided just now.)',
    'a': "'ll (will)",
    'options': ["'ll (will)", 'am going to', 'am', 'was going to'],
    'type': 'Situation 4 – On-the-Spot Decisions (will)',
    'mm':
        'ဗိုင်တင်မကြားမီ ဆုံးဖြတ်မထားဘဲ ကြားသည်နှင့် ချက်ချင်းဆုံးဖြတ်သောကြောင့် "will" (\'ll) သုံးရသည်။',
  },
  {
    'q': 'The phone is ringing. "Don\'t worry, I _______ answer it."',
    'a': "'ll (will)",
    'options': ["'ll (will)", 'am going to', 'am answering', 'answered'],
    'type': 'Situation 4 – On-the-Spot Decisions (will)',
    'mm':
        'ဖုန်းမြည်နေသည်ကိုမြင်ပြီးမှ ချက်ချင်းဆုံးဖြတ်သောကြောင့် "will (\'ll)" သုံးရသည်။',
  },

  // --- Situation 5: will for offers ---
  {
    'q': 'You look confused. _______ I help you with that?',
    'a': 'Will',
    'options': ['Will', 'Am', 'Going to', 'Do'],
    'type': 'Situation 5 – Offers (will)',
    'mm':
        'ကမ်းလှမ်းချက် (offer) ဖြစ်၍ "Will I help you?" ပုံစံ "will" သုံးရသည်။',
  },
  {
    'q': 'I _______ carry that heavy box for you. (You are offering help.)',
    'a': "'ll (will)",
    'options': ["'ll (will)", 'am going to', 'am', 'can going to'],
    'type': 'Situation 5 – Offers (will)',
    'mm': 'ကမ်းလှမ်းချက် (offer) ဖြစ်၍ "will (\'ll)" သုံးရသည်။',
  },

  // --- Situation 5: will for promises ---
  {
    'q': 'I _______ be late again. I promise! (Making a promise.)',
    'a': "won't (will not)",
    'options': ["won't (will not)", "am not going to", "don't", "am not"],
    'type': 'Situation 5 – Promises (will not)',
    'mm':
        'ကတိ (promise) တွင်လည်း "will" ကိုသုံးသည်။ ငြင်းဆိုကတိမှာ "won\'t" (will not) ဖြစ်သည်။',
  },
  {
    'q':
        'I _______ tell anyone your secret. I promise. (Making a promise NOT to do something.)',
    'a': "won't",
    'options': ["won't", "am not going to", "don't", "didn't"],
    'type': 'Situation 5 – Promises (will)',
    'mm': 'မပြောမည်ဟု ကတိပေးသည် → "won\'t" (will not) သုံးရသည်။',
  },

  // --- Mixed Discrimination Questions ---
  {
    'q':
        'A: "What are you doing tonight?" B: "I _______ have dinner with my parents." (Already arranged — restaurant is booked.)',
    'a': "am having",
    'options': ['am having', 'will have', 'am going to have', 'have'],
    'type': 'Mixed – Which structure fits?',
    'mm':
        'ဆိုင်ကြိုတင်ဆိုင်ချိန်းဆိုပြီးဖြစ်သောကြောင့် Present Continuous (am having) သည် '
        'ကြိုတင်ချိန်းဆိုမှုကိုဖော်ပြ၍ မှန်ကန်သည်။',
  },
  {
    'q':
        'A: "There\'s no sugar." B: "OK, I _______ get some from the shop." (Spontaneous decision right now.)',
    'a': "'ll (will)",
    'options': ["'ll (will)", 'am going to', 'am getting', 'would'],
    'type': 'Mixed – Which structure fits?',
    'mm':
        'ကြားသည်နှင့် ချက်ချင်းဆုံးဖြတ်မှုဖြစ်၍ "\'ll (will)" ကိုသာ သုံးရသည်။',
  },
  {
    'q':
        'A: "I hear Tom has started eating healthier." B: "Yes, he _______ lose weight this year." (He already decided weeks ago.)',
    'a': "is going to",
    'options': ['is going to', "'ll", 'is losing', 'will'],
    'type': 'Mixed – Which structure fits?',
    'mm':
        'ပြောမတိုင်မီ ဆုံးဖြတ်ထားသော ကြိုတင်ရည်ရွယ်ချက် (intention) → "is going to"',
  },
  {
    'q': 'Look at that child near the edge! He _______ fall into the pool!',
    'a': "is going to",
    'options': ['is going to', "'ll", 'will', 'falls'],
    'type': 'Mixed – Which structure fits?',
    'mm':
        'မျက်မြင် သက်သေ (ကလေး ရေကန်နဘေးတွင် ရောက်နေ) ရှိ၍ prediction with evidence → "is going to"',
  },
  {
    'q': "I've decided — I _______ quit my job and travel the world.",
    'a': "'m going to",
    'options': ["'m going to", "'ll", "am", "will have"],
    'type': 'Mixed – Which structure fits?',
    'mm':
        '"I\'ve decided" = ကြိုတင်ဆုံးဖြတ်ပြီး (intention) ဖြစ်သောကြောင့် "am going to" (\'m going to) သုံးရသည်။',
  },
];
