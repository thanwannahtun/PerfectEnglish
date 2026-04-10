import 'package:flutter/material.dart';

class ModalVerb {
  final String verb;
  final String burmeseMeaning;
  final String usage;
  // Updated from List<ModalExample> to List of Maps
  final List<Map<String, String>> examples;

  const ModalVerb({
    required this.verb,
    required this.burmeseMeaning,
    required this.usage,
    required this.examples,
  });
}

final List<ModalVerb> modalVerbsList = [
  ModalVerb(
    verb: "Can / Could",
    burmeseMeaning: "...နိုင်သည် / ...နိုင်ခဲ့သည်",
    usage:
        "စွမ်းဆောင်ရည် (Ability)၊ ခွင့်ပြုချက် (Permission)၊ ဖြစ်နိုင်ခြေ (Possibility) နှင့် ယဉ်ကျေးစွာတောင်းဆိုခြင်း (Polite Request) များတွင် သုံးသည်။",
    examples: [
      // --- CAN (Present Ability & Permission) ---
      {
        "sentenceEn": "I can drive a manual car.",
        "sentenceMm": "ကျွန်တော် ဂီယာကား မောင်းတတ်တယ်။",
        "context": "Ability",
      },
      {
        "sentenceEn": "Can I use your charger for a moment?",
        "sentenceMm": "မင်းရဲ့ အားသွင်းကြိုး ခဏသုံးလို့ရမလား။",
        "context": "Permission",
      },
      {
        "sentenceEn": "She can speak three languages fluently.",
        "sentenceMm": "သူမ ဘာသာစကား သုံးမျိုးကို ကျွမ်းကျင်စွာ ပြောနိုင်သည်။",
        "context": "Ability",
      },
      {
        "sentenceEn": "You can park your bike here.",
        "sentenceMm": "မင်း ဒီမှာ စက်ဘီး ရပ်လို့ရတယ်။",
        "context": "Permission",
      },
      {
        "sentenceEn": "I can't find my keys anywhere.",
        "sentenceMm": "ကျွန်တော့်သော့တွေကို ဘယ်နေရာမှာမှ ရှာမတွေ့တော့ဘူး။",
        "context": "Inability",
      },
      {
        "sentenceEn": "We can meet at the coffee shop at 5 PM.",
        "sentenceMm": "ကျွန်တော်တို့ ညနေ ၅ နာရီမှာ ကော်ဖီဆိုင်မှာ ဆုံလို့ရတယ်။",
        "context": "Possibility",
      },
      {
        "sentenceEn": "Can you hear me now?",
        "sentenceMm": "အခု ကျွန်တော်ပြောတာ ကြားရလား။",
        "context": "Request",
      },
      {
        "sentenceEn": "It can get very cold in the winter here.",
        "sentenceMm": "ဒီမှာ ဆောင်းတွင်းဆို တော်တော်အေးတတ်တယ်။",
        "context": "General Truth",
      },

      // --- COULD (Polite Requests & Past Ability) ---
      {
        "sentenceEn": "Could you repeat that more slowly, please?",
        "sentenceMm":
            "အဲဒါလေးကို နည်းနည်းလောက် နှေးနှေးလေး ပြန်ပြောပေးလို့ ရမလားခင်ဗျာ။",
        "context": "Polite Request",
      },
      {
        "sentenceEn": "When I was young, I could run very fast.",
        "sentenceMm": "ကျွန်တော် ငယ်ငယ်တုန်းက အရမ်းမြန်မြန် ပြေးနိုင်ခဲ့တယ်။",
        "context": "Past Ability",
      },
      {
        "sentenceEn": "Could I have the bill, please?",
        "sentenceMm": "ကျသင့်ငွေရှင်းပေးလို့ ရမလားခင်ဗျာ။",
        "context": "Polite Request",
      },
      {
        "sentenceEn": "I couldn't finish the homework last night.",
        "sentenceMm": "မနေ့ညက အိမ်စာ မပြီးခဲ့ဘူး။",
        "context": "Past Inability",
      },
      {
        "sentenceEn": "Could you tell me how to get to the station?",
        "sentenceMm":
            "ဘူတာရုံကို ဘယ်လိုသွားရမလဲဆိုတာ ပြောပြပေးလို့ ရမလားခင်ဗျာ။",
        "context": "Polite Request",
      },
      {
        "sentenceEn": "It could rain later this evening.",
        "sentenceMm": "ဒီနေ့ ညနေပိုင်း မိုးရွာနိုင်တယ်။",
        "context": "Possibility",
      },
      {
        "sentenceEn": "We could go to the beach if you want.",
        "sentenceMm": "မင်းဆန္ဒရှိရင် ကျွန်တော်တို့ ကမ်းခြေသွားလို့ရတယ်။",
        "context": "Suggestion",
      },
      {
        "sentenceEn": "I could not sleep because of the noise.",
        "sentenceMm": "ဆူညံသံတွေကြောင့် ကျွန်တော် အိပ်လို့မရခဲ့ဘူး။",
        "context": "Past Inability",
      },
      {
        "sentenceEn": "Could you hold this for a second?",
        "sentenceMm": "ဒါလေး ခဏလောက် ကိုင်ပေးထားလို့ ရမလား။",
        "context": "Request",
      },
      {
        "sentenceEn": "He could be at the office right now.",
        "sentenceMm": "သူ အခု အလုပ်မှာ ရှိနေနိုင်တယ်။",
        "context": "Deduction",
      },
      {
        "sentenceEn": "Could I ask a quick question?",
        "sentenceMm": "မေးခွန်းတိုလေးတစ်ခုလောက် မေးလို့ရမလားခင်ဗျာ။",
        "context": "Polite Permission",
      },
      {
        "sentenceEn": "I thought you could swim!",
        "sentenceMm": "မင်း ရေကူးတတ်တယ်လို့ ငါထင်ခဲ့တာ။",
        "context": "Assumption",
      },
    ],
  ),

  ModalVerb(
    verb: "Will / Would",
    burmeseMeaning: "...လိမ့်မည် / ...လိမ့်မည် (ယဉ်ကျေးစွာ)",
    usage:
        "အနာဂတ် (Future)၊ ဆန္ဒရှိမှု (Willingness)၊ ယဉ်ကျေးစွာတောင်းဆိုခြင်း (Polite Request) နှင့် စိတ်ကူးယဉ်အခြေအနေ (Imaginary Situations) တို့တွင် သုံးသည်။",
    examples: [
      // --- WILL (Future & Promises) ---
      {
        "sentenceEn": "I will call you when I arrive.",
        "sentenceMm": "ကျွန်တော် ရောက်တဲ့အခါ မင်းကို ဖုန်းဆက်ပါ့မယ်။",
        "context": "Promise",
      },
      {
        "sentenceEn": "The meeting will start at 9 AM.",
        "sentenceMm": "အစည်းအဝေးက မနက် ၉ နာရီမှာ စလိမ့်မယ်။",
        "context": "Future Fact",
      },
      {
        "sentenceEn": "I will help you with your homework.",
        "sentenceMm": "မင်းရဲ့ အိမ်စာတွေကို ငါ ကူညီပေးပါ့မယ်။",
        "context": "Willingness",
      },
      {
        "sentenceEn": "It will probably rain tonight.",
        "sentenceMm": "ဒီည မိုးရွာနိုင်ချေ ရှိလိမ့်မယ်။",
        "context": "Prediction",
      },
      {
        "sentenceEn": "I won't (will not) tell anyone your secret.",
        "sentenceMm": "မင်းရဲ့လျှို့ဝှက်ချက်ကို ဘယ်သူ့ကိုမှ မပြောပါဘူး။",
        "context": "Promise",
      },
      {
        "sentenceEn": "Will you open the window, please?",
        "sentenceMm": "ပြတင်းပေါက်လေး ဖွင့်ပေးလို့ ရမလား။",
        "context": "Request",
      },

      // --- WOULD (Polite Requests & Offers) ---
      {
        "sentenceEn": "Would you like some coffee?",
        "sentenceMm": "ကော်ဖီ သောက်မလားခင်ဗျာ။",
        "context": "Offer",
      },
      {
        "sentenceEn": "I would like to order a pizza.",
        "sentenceMm": "ပီဇာ တစ်ခုလောက် မှာချင်လို့ပါ။",
        "context": "Polite Desire",
      },
      {
        "sentenceEn": "Would you mind closing the door?",
        "sentenceMm": "တံခါးလေး ပိတ်ပေးလို့ ရမလားခင်ဗျာ။",
        "context": "Polite Request",
      },
      {
        "sentenceEn": "I would love to visit Bagan one day.",
        "sentenceMm":
            "တစ်နေ့ကျရင် ပုဂံကို သွားချင်တယ် (သွားဖြစ်ဖို့ မျှော်လင့်တယ်)။",
        "context": "Wish",
      },

      // --- WOULD (Imaginary / Conditional) ---
      {
        "sentenceEn": "If I were you, I would take the job.",
        "sentenceMm": "ငါသာ မင်းနေရာမှာဆိုရင် အဲဒီအလုပ်ကို လက်ခံလိမ့်မယ်။",
        "context": "Advice/Imaginary",
      },
      {
        "sentenceEn": "What would you do with a million dollars?",
        "sentenceMm": "ဒေါ်လာ တစ်သန်းရရင် မင်း ဘာလုပ်မလဲ။",
        "context": "Imaginary",
      },
      {
        "sentenceEn": "I would help you, but I'm very busy.",
        "sentenceMm": "ကျွန်တော် ကူညီချင်ပေမယ့် အခု အရမ်းအလုပ်ရှုပ်နေလို့ပါ။",
        "context": "Refusal/Condition",
      },

      // --- DAILY SCENARIOS ---
      {
        "sentenceEn": "Will you be home for dinner?",
        "sentenceMm": "ညစာစားဖို့ အိမ်မှာ ရှိမလား။",
        "context": "Question",
      },
      {
        "sentenceEn": "Everything will be okay.",
        "sentenceMm": "အရာအားလုံး အဆင်ပြေသွားလိမ့်မယ်။",
        "context": "Reassurance",
      },
      {
        "sentenceEn": "Would you rather have tea or coffee?",
        "sentenceMm": "လက်ဖက်ရည်နဲ့ ကော်ဖီ ဘယ်ဟာ ပိုသောက်ချင်လဲ။",
        "context": "Preference",
      },
      {
        "sentenceEn": "Who will win the match today?",
        "sentenceMm": "ဒီနေ့ပွဲမှာ ဘယ်သူနိုင်မလဲ။",
        "context": "Prediction",
      },
      {
        "sentenceEn": "I thought it would rain, but it didn't.",
        "sentenceMm": "မိုးရွာလိမ့်မယ်လို့ ထင်ခဲ့ပေမယ့် မရွာခဲ့ဘူး။",
        "context": "Future in the Past",
      },
      {
        "sentenceEn": "That would be great!",
        "sentenceMm": "အဲဒါဆိုရင် အရမ်းကောင်းမှာပဲ။",
        "context": "Reaction",
      },
      {
        "sentenceEn": "I'll (I will) be right back.",
        "sentenceMm": "အခုချက်ချင်း ပြန်လာခဲ့မယ်။",
        "context": "Immediate Action",
      },
    ],
  ),
  ModalVerb(
    verb: "May / Might",
    burmeseMeaning: "...ကောင်း...နိုင်သည် (ဖြစ်နိုင်ခြေ)",
    usage:
        "ဖြစ်နိုင်ခြေ (Possibility)၊ ခွင့်ပြုချက်တောင်းခံခြင်း (Permission) နှင့် ဆုတောင်းစကား (Wishes) များတွင် သုံးသည်။",
    examples: [
      // --- PERMISSION (ခွင့်ပြုချက်) ---
      {
        "sentenceEn": "May I use your restroom, please?",
        "sentenceMm": "အိမ်သာ ခဏလောက် သုံးခွင့်ပြုမလားခင်ဗျာ။",
        "context": "Polite Permission",
      },
      {
        "sentenceEn": "May I ask you a personal question?",
        "sentenceMm": "ကိုယ်ရေးကိုယ်တာ မေးခွန်းတစ်ခုလောက် မေးလို့ရမလား။",
        "context": "Permission",
      },
      {
        "sentenceEn": "You may leave the room now.",
        "sentenceMm": "မင်း အခု အခန်းထဲက ထွက်သွားလို့ရပါပြီ။",
        "context": "Giving Permission",
      },
      {
        "sentenceEn": "May I have your attention, please?",
        "sentenceMm": "အားလုံးပဲ ကျွန်တော့်ကို ခဏလောက် အာရုံစိုက်ပေးပါဦး။",
        "context": "Formal Request",
      },

      // --- POSSIBILITY (ဖြစ်နိုင်ခြေ) ---
      {
        "sentenceEn": "It may rain this afternoon; take an umbrella.",
        "sentenceMm": "ဒီနေ့ ညနေပိုင်း မိုးရွာနိုင်တယ်၊ ထီးယူသွားလိုက်ပါ။",
        "context": "Likely Possibility",
      },
      {
        "sentenceEn": "I might be a bit late for dinner tonight.",
        "sentenceMm": "ဒီနေ့ည ညစာစားဖို့ ကျွန်တော် နည်းနည်း နောက်ကျနိုင်တယ်။",
        "context": "Uncertainty",
      },
      {
        "sentenceEn": "The shop might be closed today.",
        "sentenceMm": "ဒီနေ့ ဆိုင်ပိတ်ထားတာ ဖြစ်နိုင်တယ်။",
        "context": "Possibility",
      },
      {
        "sentenceEn": "We might go to Japan next year if we save enough.",
        "sentenceMm":
            "ပိုက်ဆံအလုံအလောက် စုမိရင် နောက်နှစ် ဂျပန်ကို သွားကောင်း သွားနိုင်တယ်။",
        "context": "Future Plan",
      },
      {
        "sentenceEn": "She may not like the surprise gift.",
        "sentenceMm": "သူမ ဒီလက်ဆောင်ကို ကြိုက်ချင်မှ ကြိုက်လိမ့်မယ်။",
        "context": "Negative Possibility",
      },
      {
        "sentenceEn": "He might have forgotten our meeting.",
        "sentenceMm": "သူ ငါတို့ ချိန်းထားတာကို မေ့သွားတာ ဖြစ်နိုင်တယ်။",
        "context": "Past Guess",
      },

      // --- SUGGESTIONS & OFFERS (အကြံပြုချက်နှင့် ကမ်းလှမ်းချက်) ---
      {
        "sentenceEn": "May I help you with those bags?",
        "sentenceMm": "ဒီအိတ်တွေ သယ်ပေးဖို့ ကူညီပေးရမလားခင်ဗျာ။",
        "context": "Offering Help",
      },
      {
        "sentenceEn": "You might want to check the weather before you go.",
        "sentenceMm":
            "မင်းမသွားခင် ရာသီဥတုကို အရင်စစ်ကြည့်သင့်တယ် (စစ်ကြည့်နိုင်တယ်)။",
        "context": "Suggestion",
      },
      {
        "sentenceEn": "If you hurry, you might catch the bus.",
        "sentenceMm": "မင်းမြန်မြန်လုပ်ရင် ကားမှီနိုင်သေးတယ်။",
        "context": "Chance",
      },

      // --- WISHES & FORMAL USAGE (ဆုတောင်းခြင်းနှင့် ပုံစံတကျသုံးနှုန်းခြင်း) ---
      {
        "sentenceEn": "May all your dreams come true!",
        "sentenceMm": "မင်းရဲ့ အိပ်မက်တွေအားလုံး အကောင်အထည်ဖော်နိုင်ပါစေ။",
        "context": "Wish",
      },
      {
        "sentenceEn": "May he rest in peace.",
        "sentenceMm": "သူ ငြိမ်းချမ်းစွာ အနားယူနိုင်ပါစေ။",
        "context": "Blessing",
      },

      // --- DAILY SCENARIOS ---
      {
        "sentenceEn": "That might be the delivery man at the door.",
        "sentenceMm": "တံခါးဝမှာ ရောက်နေတာ ပစ္စည်းပို့တဲ့လူ ဖြစ်နိုင်တယ်။",
        "context": "Deduction",
      },
      {
        "sentenceEn": "I might try a different career path soon.",
        "sentenceMm":
            "ကျွန်တော် မကြာခင်မှာ တခြား အလုပ်အကိုင်လမ်းကြောင်းတစ်ခုကို ပြောင်းကြည့်ကောင်း ပြောင်းကြည့်မယ်။",
        "context": "Thinking Ahead",
      },
      {
        "sentenceEn": "May I join you for lunch?",
        "sentenceMm": "နေ့လယ်စာ အတူတူ စားလို့ရမလားခင်ဗျာ။",
        "context": "Polite Permission",
      },
      {
        "sentenceEn": "There might be a mistake in the bill.",
        "sentenceMm": "ဘေလ်ထဲမှာ အမှားတစ်ခုခု ပါနေနိုင်တယ်။",
        "context": "Doubt",
      },
      {
        "sentenceEn": "It may take a few days to process your request.",
        "sentenceMm":
            "ခင်ဗျားရဲ့ တောင်းဆိုချက်ကို ဆောင်ရွက်ဖို့ ရက်အနည်းငယ် ကြာနိုင်ပါတယ်။",
        "context": "Formal Info",
      },
    ],
  ),
  ModalVerb(
    verb: "Shall",
    burmeseMeaning: "...မလား / ...ရမလား (အကြံပြုချက်/ကမ်းလှမ်းချက်)",
    usage:
        "အကြံပြုချက်တောင်းခံခြင်း (Suggestions)၊ ကူညီရန်ကမ်းလှမ်းခြင်း (Offers) နှင့် တရားဝင်စည်းကမ်းများ (Formal Rules) တွင် သုံးသည်။ (အများအားဖြင့် 'I' နှင့် 'We' တို့နှင့်သာ တွဲသုံးလေ့ရှိသည်။)",
    examples: [
      // --- SUGGESTIONS (အကြံပြုချက်များ) ---
      {
        "sentenceEn": "Shall we go for a walk?",
        "sentenceMm": "ငါတို့ လမ်းလျှောက်ထွက်ကြမလား။",
        "context": "Suggestion",
      },
      {
        "sentenceEn": "What shall we have for dinner tonight?",
        "sentenceMm": "ဒီနေ့ည ညစာအတွက် ဘာစားကြမလဲ။",
        "context": "Asking for Suggestion",
      },
      {
        "sentenceEn": "Shall we meet at the station at 10 AM?",
        "sentenceMm": "မနက် ၁၀ နာရီမှာ ဘူတာရုံမှာ ဆုံကြမလား။",
        "context": "Planning",
      },
      {
        "sentenceEn": "Where shall we go for our holiday?",
        "sentenceMm": "အားလပ်ရက်မှာ ငါတို့ ဘယ်သွားကြမလဲ။",
        "context": "Asking for Suggestion",
      },
      {
        "sentenceEn": "Shall we start the meeting now?",
        "sentenceMm": "အခု အစည်းအဝေး စလိုက်ကြမလား။",
        "context": "Decision making",
      },

      // --- OFFERS (ကူညီရန် ကမ်းလှမ်းချက်များ) ---
      {
        "sentenceEn": "Shall I carry your bag for you?",
        "sentenceMm": "မင်းရဲ့အိတ်ကို ကျွန်တော် သယ်ပေးရမလား။",
        "context": "Offer of Help",
      },
      {
        "sentenceEn": "Shall I open the window?",
        "sentenceMm": "ပြတင်းပေါက် ဖွင့်ပေးရမလား။",
        "context": "Offer",
      },
      {
        "sentenceEn": "Shall I call a taxi for you?",
        "sentenceMm": "ခင်ဗျားအတွက် တက္ကစီ ခေါ်ပေးရမလား။",
        "context": "Offer of Help",
      },
      {
        "sentenceEn": "Shall I make some tea?",
        "sentenceMm": "လက်ဖက်ရည် ဖျော်ပေးရမလား။",
        "context": "Offer",
      },
      {
        "sentenceEn": "Shall I send the email now?",
        "sentenceMm": "အီးမေးလ်ကို အခုပဲ ပို့လိုက်ရမလား။",
        "context": "Offer/Asking Permission",
      },

      // --- FORMAL RULES & PROMISES (တရားဝင်စည်းကမ်းနှင့် ကတိများ) ---
      {
        "sentenceEn": "The buyer shall pay the full amount within 30 days.",
        "sentenceMm": "ဝယ်ယူသူသည် ရက်ပေါင်း ၃၀ အတွင်း ငွေအပြည့်အဝ ပေးချေရမည်။",
        "context": "Formal/Legal Rule",
      },
      {
        "sentenceEn": "We shall overcome this difficulty together.",
        "sentenceMm": "ငါတို့ ဒီအခက်အခဲကို အတူတူ ကျော်ဖြတ်ကြပါစို့။",
        "context": "Determination",
      },
      {
        "sentenceEn": "Students shall not enter the lab without a teacher.",
        "sentenceMm": "ကျောင်းသားများသည် ဆရာမပါဘဲ ဓာတ်ခွဲခန်းထဲသို့ မဝင်ရ။",
        "context": "Formal Instruction",
      },
      {
        "sentenceEn": "I shall never forget your kindness.",
        "sentenceMm": "မင်းရဲ့ ကျေးဇူးကို ငါ ဘယ်တော့မှ မေ့မှာ မဟုတ်ပါဘူး။",
        "context": "Strong Promise",
      },

      // --- DAILY SCENARIOS ---
      {
        "sentenceEn": "Shall we dance?",
        "sentenceMm": "ကကြမလား။",
        "context": "Invitation",
      },
      {
        "sentenceEn": "Which one shall I buy?",
        "sentenceMm": "ဘယ်တစ်ခုကို ဝယ်ရမလဲ။",
        "context": "Asking for Advice",
      },
      {
        "sentenceEn": "Shall we try the other way?",
        "sentenceMm": "တခြားနည်းလမ်းနဲ့ စမ်းကြည့်ကြမလား။",
        "context": "Suggestion",
      },
      {
        "sentenceEn": "I shall be glad to help you.",
        "sentenceMm": "မင်းကို ကူညီရတာ ကျွန်တော် ဝမ်းသာမှာပါ။",
        "context": "Formal Willingness",
      },
      {
        "sentenceEn": "Shall we take a break for 10 minutes?",
        "sentenceMm": "၁၀ မိနစ်လောက် နားကြမလား။",
        "context": "Suggestion",
      },
      {
        "sentenceEn": "What shall I tell him if he calls?",
        "sentenceMm": "သူဖုန်းဆက်ရင် ကျွန်တော် ဘာပြောလိုက်ရမလဲ။",
        "context": "Inquiry",
      },
    ],
  ),

  ModalVerb(
    verb: "Should",
    burmeseMeaning: "...သင့်သည်",
    usage:
        "အကြံပေးခြင်း (Advice)၊ ထင်မြင်ယူဆချက် (Opinion)၊ မျှော်လင့်ထားသောအရာ (Expectation) နှင့် တာဝန်ရှိမှု (Duty) တို့တွင် သုံးသည်။",
    examples: [
      // --- ADVICE & SUGGESTIONS (အကြံပြုချက်များ) ---
      {
        "sentenceEn": "You should drink more water every day.",
        "sentenceMm": "မင်း နေ့တိုင်း ရေပိုသောက်သင့်တယ်။",
        "context": "Health Advice",
      },
      {
        "sentenceEn": "Should I wear a suit to the interview?",
        "sentenceMm": "အင်တာဗျူးကို စကပ်/ကုတ်အကျီ ဝတ်သွားသင့်သလား။",
        "context": "Asking Advice",
      },
      {
        "sentenceEn": "You shouldn't stay up so late.",
        "sentenceMm": "မင်း ညဉ့်အရမ်းမနက်သင့်ဘူး။",
        "context": "Negative Advice",
      },
      {
        "sentenceEn": "We should start our journey early tomorrow.",
        "sentenceMm": "မနက်ဖြန် ခရီးကို စောစောစသင့်တယ်။",
        "context": "Suggestion",
      },
      {
        "sentenceEn": "You should check your email regularly.",
        "sentenceMm": "မင်း အီးမေးလ်ကို ပုံမှန် စစ်ဆေးသင့်တယ်။",
        "context": "Professional Advice",
      },

      // --- EXPECTATION (မျှော်လင့်ထားသောအရာ) ---
      {
        "sentenceEn": "The bus should be here in five minutes.",
        "sentenceMm":
            "ကားက နောက် ၅ မိနစ်နေရင် ရောက်လာသင့်ပြီ (ရောက်လာလိမ့်မယ်)။",
        "context": "Expectation",
      },
      {
        "sentenceEn": "He has studied hard; he should pass the exam.",
        "sentenceMm": "သူ စာကြိုးစားထားတယ်၊ သူ စာမေးပွဲအောင်သင့်တယ်။",
        "context": "Logical Result",
      },
      {
        "sentenceEn": "It shouldn't take long to fix this phone.",
        "sentenceMm": "ဒီဖုန်းပြင်ဖို့ အချိန်အကြာကြီး မကြာသင့်ဘူး။",
        "context": "Expectation",
      },
      {
        "sentenceEn": "The price should be around 10,000 Kyats.",
        "sentenceMm": "ဈေးနှုန်းက ကျပ်တစ်သောင်းဝန်းကျင် ဖြစ်သင့်တယ်။",
        "context": "Estimation",
      },

      // --- DUTY & RESPONSIBILITY (တာဝန်နှင့် ဝတ္တရား) ---
      {
        "sentenceEn": "We should be kind to everyone.",
        "sentenceMm": "ကျွန်ုပ်တို့ လူတိုင်းအပေါ် ကြင်နာသင့်သည်။",
        "context": "Moral Duty",
      },
      {
        "sentenceEn": "Drivers should obey the traffic rules.",
        "sentenceMm": "ယာဉ်မောင်းသူတွေ ယာဉ်စည်းကမ်းကို လိုက်နာသင့်တယ်။",
        "context": "Social Responsibility",
      },
      {
        "sentenceEn": "You should apologize for what you said.",
        "sentenceMm": "မင်းပြောခဲ့တဲ့စကားအတွက် မင်း တောင်းပန်သင့်တယ်။",
        "context": "Right Action",
      },

      // --- DAILY SCENARIOS & CRITICISM ---
      {
        "sentenceEn": "I should probably go home now.",
        "sentenceMm": "ကျွန်တော် အခု အိမ်ပြန်သင့်ပြီ ထင်တယ်။",
        "context": "Personal Decision",
      },
      {
        "sentenceEn": "Should we call him before we arrive?",
        "sentenceMm": "ငါတို့မရောက်ခင် သူ့ကို ဖုန်းဆက်သင့်လား။",
        "context": "Planning",
      },
      {
        "sentenceEn": "You should try the new restaurant downtown.",
        "sentenceMm": "မြို့ထဲက ဆိုင်သစ်ကို မင်း သွားစားကြည့်သင့်တယ်။",
        "context": "Recommendation",
      },
      {
        "sentenceEn": "I should have told the truth.",
        "sentenceMm": "ငါ အမှန်အတိုင်း ပြောခဲ့သင့်တာ။",
        "context": "Regret",
      },
      {
        "sentenceEn": "Where should we meet tonight?",
        "sentenceMm": "ဒီည ငါတို့ ဘယ်မှာ ဆုံကြမလဲ။",
        "context": "Inquiry",
      },
      {
        "sentenceEn": "You should take a break; you look tired.",
        "sentenceMm": "မင်း နားသင့်ပြီ၊ ပင်ပန်းနေပုံရတယ်။",
        "context": "Empathy",
      },
      {
        "sentenceEn": "Parents should spend time with their children.",
        "sentenceMm": "မိဘတွေဟာ သူတို့သားသမီးတွေနဲ့ အချိန်ကုန်ဆုံးသင့်တယ်။",
        "context": "Opinion",
      },
      {
        "sentenceEn": "Everything should be fine.",
        "sentenceMm": "အရာအားလုံး အဆင်ပြေသွားမှာပါ။",
        "context": "Reassurance",
      },
    ],
  ),

  ModalVerb(
    verb: "Must",
    burmeseMeaning: "...ရမည် (မဖြစ်မနေ)",
    usage:
        "တာဝန်ဝတ္တရား (Obligation)၊ မဖြစ်မနေလိုအပ်ချက် (Necessity) နှင့် ခိုင်မာသောယူဆချက် (Strong Deduction) များတွင် သုံးသည်။",
    examples: [
      // --- OBLIGATION & RULES (တာဝန်နှင့် စည်းကမ်းများ) ---
      {
        "sentenceEn": "All staff must wear ID cards at all times.",
        "sentenceMm": "ဝန်ထမ်းအားလုံး အမြဲတမ်း ဝန်ထမ်းကတ် ချိတ်ထားရမည်။",
        "context": "Rule",
      },
      {
        "sentenceEn": "You must stop when the traffic light is red.",
        "sentenceMm": "မီးနီရင် မင်း မဖြစ်မနေ ရပ်ရမယ်။",
        "context": "Law",
      },
      {
        "sentenceEn": "Students must submit their assignments by Friday.",
        "sentenceMm":
            "ကျောင်းသားများသည် သောကြာနေ့ နောက်ဆုံးထားပြီး အိမ်စာတင်ရမည်။",
        "context": "Deadline",
      },
      {
        "sentenceEn": "I must finish this report before the meeting.",
        "sentenceMm":
            "အစည်းအဝေးမတိုင်ခင် ဒီအစီရင်ခံစာကို ကျွန်တော် အပြီးသတ်ရမယ်။",
        "context": "Obligation",
      },
      {
        "sentenceEn": "You must not smoke inside the building.",
        "sentenceMm": "အဆောက်အဦအတွင်း ဆေးလိပ် မသောက်ရ။",
        "context": "Prohibition",
      },

      // --- STRONG ADVICE & NECESSITY (အကြံပေးချက်နှင့် လိုအပ်ချက်) ---
      {
        "sentenceEn": "You must see a doctor if the pain continues.",
        "sentenceMm": "နာကျင်တာ မသက်သာရင် မင်း ဆရာဝန်နဲ့ မဖြစ်မနေ ပြသင့်တယ်။",
        "context": "Strong Advice",
      },
      {
        "sentenceEn": "We must save money for our future.",
        "sentenceMm": "ငါတို့ အနာဂတ်အတွက် ပိုက်ဆံ စုရမယ်။",
        "context": "Necessity",
      },
      {
        "sentenceEn": "You must try this cake; it's delicious!",
        "sentenceMm": "ဒီကိတ်မုန့်ကို မြည်းကြည့်ဦး၊ အရမ်းစားကောင်းတယ်။",
        "context": "Recommendation",
      },
      {
        "sentenceEn": "I must call my mom today; it's her birthday.",
        "sentenceMm": "ဒီနေ့ အမေ့်မွေးနေ့မို့လို့ ကျွန်တော် ဖုန်းဆက်ရမယ်။",
        "context": "Personal Duty",
      },
      {
        "sentenceEn": "You must be careful when crossing the road.",
        "sentenceMm": "လမ်းကူးတဲ့အခါ မင်း သတိထားရမယ်။",
        "context": "Warning",
      },

      // --- LOGICAL DEDUCTION (ခိုင်မာသော ယူဆချက် - ဖြစ်ရမယ်) ---
      {
        "sentenceEn": "He has been working all day; he must be tired.",
        "sentenceMm": "သူ တစ်နေကုန် အလုပ်လုပ်နေတာ၊ သူ ပင်ပန်းနေရမယ်။",
        "context": "Deduction",
      },
      {
        "sentenceEn": "You haven't eaten anything; you must be hungry.",
        "sentenceMm": "မင်း ဘာမှမစားရသေးဘူးပဲ၊ ဗိုက်ဆာနေရမယ်။",
        "context": "Deduction",
      },
      {
        "sentenceEn": "The ground is wet; it must have rained last night.",
        "sentenceMm": "မြေကြီးတွေ စိုနေတယ်၊ မနေ့ညက မိုးရွာခဲ့တာ ဖြစ်ရမယ်။",
        "context": "Past Deduction",
      },
      {
        "sentenceEn": "She's not answering; she must be busy.",
        "sentenceMm": "သူမ ဖုန်းမကိုင်ဘူး၊ အလုပ်ရှုပ်နေတာ ဖြစ်ရမယ်။",
        "context": "Deduction",
      },
      {
        "sentenceEn": "That car is very expensive; he must be rich.",
        "sentenceMm": "အဲဒီကားက အရမ်းဈေးကြီးတယ်၊ သူ ချမ်းသာရမယ်။",
        "context": "Deduction",
      },

      // --- MORE DAILY SCENARIOS ---
      {
        "sentenceEn": "I must remember to lock the door.",
        "sentenceMm": "တံခါးပိတ်ဖို့ ကျွန်တော် မှတ်ထားရမယ်။",
        "context": "Reminder",
      },
      {
        "sentenceEn": "You must listen to your parents.",
        "sentenceMm": "မင်း မိဘစကားကို နားထောင်ရမယ်။",
        "context": "Duty",
      },
      {
        "sentenceEn": "We must not be late for the flight.",
        "sentenceMm": "လေယာဉ် နောက်ကျလို့ မဖြစ်ဘူး။",
        "context": "Urgency",
      },
      {
        "sentenceEn": "You must have a passport to travel abroad.",
        "sentenceMm": "နိုင်ငံခြားထွက်ဖို့ မင်းမှာ ပတ်စပို့ ရှိရမယ်။",
        "context": "Requirement",
      },
      {
        "sentenceEn": "This must be the right address.",
        "sentenceMm": "ဒါ လိပ်စာအမှန် ဖြစ်ရမယ်။",
        "context": "Certainty",
      },
    ],
  ),
];

class ModalVerbsScreen extends StatelessWidget {
  const ModalVerbsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Modal Verbs (အကူကြိယာများ)')),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
          vertical: 8,
          horizontal: MediaQuery.sizeOf(context).width * 0.05,
        ),
        itemCount: modalVerbsList.length,
        itemBuilder: (context, index) {
          final modal = modalVerbsList[index];
          return Card(
            color: Theme.of(context).colorScheme.onPrimary,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.grey.shade800),
            ),
            elevation: 0.0,
            child: ListTile(
              title: Text(
                modal.verb,
                style: Theme.of(context).textTheme.titleMedium,
              ),

              subtitle: Text(modal.burmeseMeaning),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ModalDetailScreen(modal: modal),
                ),
              ),
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
        padding: EdgeInsets.symmetric(
          vertical: 8,
          horizontal: MediaQuery.sizeOf(context).width * 0.05,
        ),
        children: [
          _buildInfoBox(context),
          const SizedBox(height: 25),
          const Text(
            "Example Sentences",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ...modal.examples.map((ex) => _buildModernExampleTile(ex, context)),
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
          const Text(
            "Usage Guide",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(modal.usage, style: const TextStyle(height: 1.5)),
        ],
      ),
    );
  }

  // Updated to accept Map<String, String> instead of a model class
  Widget _buildModernExampleTile(Map<String, String> ex, BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.onPrimary,
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Chip(
                color: WidgetStatePropertyAll(
                  Theme.of(context).colorScheme.onPrimary,
                ),
                label: Text(
                  ex['context'] ?? '',
                  style: const TextStyle(fontSize: 10),
                ),
                visualDensity: VisualDensity.compact,
              ),
            ),
            Text(
              ex['sentenceEn'] ?? '',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 5),
            Text(
              ex['sentenceMm'] ?? '',
              // style: Theme.of(context).textTheme.titleMedium,
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                // fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
