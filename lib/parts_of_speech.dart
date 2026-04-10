import 'dart:math';

import 'package:flutter/material.dart';
import 'package:perfect_english/services/sound_service.dart';
import 'package:perfect_english/widgets/speak_button.dart';

final List<Map<String, dynamic>> partsOfSpeech = const [
  {
    'title': 'နာမ် (Noun)',
    'definition': 'လူ၊ တိရစ္ဆာန်၊ အရာဝတ္ထု၊ နေရာဌာန အမည်များကို နာမ်ဟုခေါ်သည်။',
    'examples': [
      {
        'en': 'Kyaw Kyaw',
        'mm': 'ကျော်ကျော်',
        'sentenceEn': 'Kyaw Kyaw is my friend.',
        'sentenceMM': 'ကျော်ကျော်သည် ကျွန်တော့်သူငယ်ချင်းဖြစ်သည်။',
      },
      {
        'en': 'Teacher',
        'mm': 'ဆရာ',
        'sentenceEn': 'The teacher is kind.',
        'sentenceMM': 'ဆရာသည် သဘောကောင်းသည်။',
      },
      {
        'en': 'Cat',
        'mm': 'ကြောင်',
        'sentenceEn': 'The cat is sleeping.',
        'sentenceMM': 'ကြောင်လေး အိပ်နေသည်။',
      },
      {
        'en': 'Yangon',
        'mm': 'ရန်ကုန်',
        'sentenceEn': 'I live in Yangon.',
        'sentenceMM': 'ကျွန်တော် ရန်ကုန်မှာ နေထိုင်သည်။',
      },
      {
        'en': 'Book',
        'mm': 'စာအုပ်',
        'sentenceEn': 'This is a good book.',
        'sentenceMM': 'ဒါက စာအုပ်ကောင်း တစ်အုပ်ပါ။',
      },
      {
        'en': 'Water',
        'mm': 'ရေ',
        'sentenceEn': 'Please give me some water.',
        'sentenceMM': 'ကျွန်တော့်ကို ရေနည်းနည်းပေးပါ။',
      },
      {
        'en': 'Happiness',
        'mm': 'ပျော်ရွှင်မှု',
        'sentenceEn': 'Happiness is important in life.',
        'sentenceMM': 'ဘဝမှာ ပျော်ရွှင်မှုက အရေးကြီးသည်။',
      },
      {
        'en': 'Apple',
        'mm': 'ပန်းသီး',
        'sentenceEn': 'She is eating an apple.',
        'sentenceMM': 'သူမ ပန်းသီးစားနေသည်။',
      },
      {
        'en': 'School',
        'mm': 'ကျောင်း',
        'sentenceEn': 'The school opens at 9 AM.',
        'sentenceMM': 'ကျောင်းသည် မနက် ၉ နာရီတွင် ဖွင့်သည်။',
      },
      {
        'en': 'Gold',
        'mm': 'ရွှေ',
        'sentenceEn': 'Gold is very valuable.',
        'sentenceMM': 'ရွှေသည် အလွန်တန်ဖိုးရှိသည်။',
      },
    ],
  },
  {
    'title': 'နာမ်စား (Pronoun)',
    'definition': 'နာမ်အစား အသုံးပြုသော စကားလုံးကို နာမ်စားဟုခေါ်သည်။',
    'examples': [
      {
        'en': 'I',
        'mm': 'ကျွန်တော်/ကျွန်မ',
        'sentenceEn': 'I am a student.',
        'sentenceMM': 'ကျွန်တော် ကျောင်းသားတစ်ယောက် ဖြစ်ပါသည်။',
      },
      {
        'en': 'You',
        'mm': 'သင်/မင်း',
        'sentenceEn': 'You are very kind.',
        'sentenceMM': 'မင်းက အရမ်းသဘောကောင်းတာပဲ။',
      },
      {
        'en': 'He',
        'mm': 'သူ (ကျား)',
        'sentenceEn': 'He likes to play football.',
        'sentenceMM': 'သူ ဘောလုံးကစားရတာ ဝါသနာပါသူ ဖြစ်သည်။',
      },
      {
        'en': 'She',
        'mm': 'သူမ (မ)',
        'sentenceEn': 'She is a famous singer.',
        'sentenceMM': 'သူမက နာမည်ကြီး အဆိုတော်တစ်ယောက် ဖြစ်သည်။',
      },
      {
        'en': 'It',
        'mm': '၎င်း/၎င်းအရာ',
        'sentenceEn': 'It is a sunny day.',
        'sentenceMM': 'ဒီနေ့က သာယာတဲ့နေ့လေး တစ်နေ့ပါ။',
      },
      {
        'en': 'We',
        'mm': 'ကျွန်ုပ်တို့',
        'sentenceEn': 'We love our country.',
        'sentenceMM': 'ကျွန်ုပ်တို့သည် မိမိတို့နိုင်ငံကို ချစ်မြတ်နိုးကြသည်။',
      },
      {
        'en': 'They',
        'mm': 'သူတို့',
        'sentenceEn': 'They are working hard.',
        'sentenceMM': 'သူတို့ အလုပ်ကြိုးစားနေကြသည်။',
      },
      {
        'en': 'Me',
        'mm': 'ကျွန်တော့်ကို',
        'sentenceEn': 'Can you help me?',
        'sentenceMM': 'ကျွန်တော့်ကို ကူညီနိုင်မလား။',
      },
      {
        'en': 'This',
        'mm': 'ဤအရာ',
        'sentenceEn': 'This is my favorite pen.',
        'sentenceMM': 'ဒါက ကျွန်တော်အနှစ်သက်ဆုံး ဖောင်တိန်ပါ။',
      },
      {
        'en': 'Who',
        'mm': 'ဘယ်သူလဲ',
        'sentenceEn': 'Who is at the door?',
        'sentenceMM': 'တံခါးမှာ ဘယ်သူရှိနေတာလဲ။',
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
        'sentenceEn': 'I eat an apple every day.',
        'sentenceMM': 'ကျွန်တော် နေ့တိုင်း ပန်းသီးတစ်လုံး စားသည်။',
      },
      {
        'en': 'Go',
        'mm': 'သွားသည်',
        'sentenceEn': 'We go to school together.',
        'sentenceMM': 'ကျွန်ုပ်တို့ ကျောင်းကို အတူတူ သွားကြသည်။',
      },
      {
        'en': 'Sleep',
        'mm': 'အိပ်သည်',
        'sentenceEn': 'The baby needs to sleep.',
        'sentenceMM': 'ကလေးလေး အိပ်ဖို့ လိုအပ်နေပြီ။',
      },
      {
        'en': 'Run',
        'mm': 'ပြေးသည်',
        'sentenceEn': 'He can run very fast.',
        'sentenceMM': 'သူက အရမ်းမြန်မြန် ပြေးနိုင်သည်။',
      },
      {
        'en': 'Speak',
        'mm': 'စကားပြောသည်',
        'sentenceEn': 'She speaks English fluently.',
        'sentenceMM': 'သူမက အင်္ဂလိပ်စကားကို ကျွမ်းကျင်စွာ ပြောနိုင်သည်။',
      },
      {
        'en': 'Think',
        'mm': 'စဉ်းစားသည်',
        'sentenceEn': 'I need to think about it.',
        'sentenceMM': 'ကျွန်တော် အဲဒီအကြောင်းကို စဉ်းစားဖို့ လိုအပ်သည်။',
      },
      {
        'en': 'Love',
        'mm': 'ချစ်သည်',
        'sentenceEn': 'I love my parents.',
        'sentenceMM': 'ကျွန်တော် ကျွန်တော့်မိဘတွေကို ချစ်သည်။',
      },
      {
        'en': 'Buy',
        'mm': 'ဝယ်သည်',
        'sentenceEn': 'They want to buy a new car.',
        'sentenceMM': 'သူတို့ ကားအသစ်တစ်စီး ဝယ်ချင်ကြသည်။',
      },
      {
        'en': 'Write',
        'mm': 'စာရေးသည်',
        'sentenceEn': 'Please write your name here.',
        'sentenceMM': 'ကျေးဇူးပြုပြီး ဒီနေရာမှာ နာမည်ရေးပေးပါ။',
      },
      {
        'en': 'Play',
        'mm': 'ကစားသည်',
        'sentenceEn': 'Children like to play outside.',
        'sentenceMM': 'ကလေးတွေက အပြင်မှာ ကစားရတာ ဝါသနာပါကြသည်။',
      },
    ],
  },
  {
    'title': 'နာမဝိသေသန (Adjective)',
    'definition':
        'နာမ် သို့မဟုတ် နာမ်စား၏ အရည်အသွေးကို ထူးခြားအောင် ဖော်ပြသောစကားလုံးဖြစ်သည်။',
    'examples': [
      {
        'en': 'Beautiful',
        'mm': 'လှပသော',
        'sentenceEn': 'She is a beautiful girl.',
        'sentenceMM': 'သူမသည် လှပသော မိန်းကလေးတစ်ဦး ဖြစ်သည်။',
      },
      {
        'en': 'Big',
        'mm': 'ကြီးသော',
        'sentenceEn': 'They live in a big house.',
        'sentenceMM': 'သူတို့က အိမ်ကြီးတစ်လုံးမှာ နေထိုင်ကြသည်။',
      },
      {
        'en': 'Smart',
        'mm': 'ထက်မြက်သော',
        'sentenceEn': 'He is a smart student.',
        'sentenceMM': 'သူသည် ထက်မြက်သော ကျောင်းသားတစ်ဦး ဖြစ်သည်။',
      },
      {
        'en': 'Red',
        'mm': 'နီသော',
        'sentenceEn': 'I have a red car.',
        'sentenceMM': 'ကျွန်တော့်မှာ အနီရောင်ကားတစ်စီး ရှိသည်။',
      },
      {
        'en': 'Tall',
        'mm': 'ရှည်သော',
        'sentenceEn': 'That building is very tall.',
        'sentenceMM': 'ထိုအဆောက်အဦးက အလွန်မြင့်သည်။',
      },
      {
        'en': 'Happy',
        'mm': 'ပျော်ရွှင်သော',
        'sentenceEn': 'They are a happy family.',
        'sentenceMM': 'သူတို့က ပျော်ရွှင်တဲ့ မိသားစုလေး တစ်စုဖြစ်ပါတယ်။',
      },
      {
        'en': 'Cold',
        'mm': 'အေးသော',
        'sentenceEn': 'I like cold water.',
        'sentenceMM': 'ကျွန်တော် ရေအေးအေး ကြိုက်သည်။',
      },
      {
        'en': 'Expensive',
        'mm': 'ဈေးကြီးသော',
        'sentenceEn': 'This watch is very expensive.',
        'sentenceMM': 'ဒီနာရီက အရမ်းဈေးကြီးသည်။',
      },
      {
        'en': 'Fast',
        'mm': 'မြန်သော',
        'sentenceEn': 'A cheetah is a fast animal.',
        'sentenceMM': 'သစ်ကုလားအုတ်သည် မြန်သော တိရစ္ဆာန်တစ်မျိုး ဖြစ်သည်။',
      },
      {
        'en': 'Small',
        'mm': 'သေးငယ်သော',
        'sentenceEn': 'It is a small cat.',
        'sentenceMM': '၎င်းက ကြောင်လေးတစ်ကောင် ဖြစ်သည်။',
      },
    ],
  },
  {
    'title': 'ကြိယာဝိသေသန (Adverb)',
    'definition':
        'ကြိယာ၊ နာမဝိသေသန သို့မဟုတ် အခြားသော ကြိယာဝိသေသနတစ်ခုကို အထူးပြုသောစကားလုံးဖြစ်သည်။',
    'examples': [
      {
        'en': 'Slowly',
        'mm': 'နှေးကွေးစွာ',
        'sentenceEn': 'He walks slowly.',
        'sentenceMM': 'သူက နှေးနှေးကွေးကွေး လမ်းလျှောက်တတ်သည်။',
      },
      {
        'en': 'Quickly',
        'mm': 'မြန်ဆန်စွာ',
        'sentenceEn': 'She finished the work quickly.',
        'sentenceMM': 'သူမက အလုပ်ကို မြန်မြန်ဆန်ဆန် ပြီးစီးခဲ့သည်။',
      },
      {
        'en': 'Easily',
        'mm': 'လွယ်ကူစွာ',
        'sentenceEn': 'I can do this easily.',
        'sentenceMM': 'ဒါကို ကျွန်တော် လွယ်လွယ်ကူကူ လုပ်နိုင်သည်။',
      },
      {
        'en': 'Very',
        'mm': 'အလွန်',
        'sentenceEn': 'The food is very delicious.',
        'sentenceMM': 'အစားအသောက်က အလွန် အရသာရှိသည်။',
      },
      {
        'en': 'Always',
        'mm': 'အမြဲတမ်း',
        'sentenceEn': 'I always wake up early.',
        'sentenceMM': 'ကျွန်တော် အမြဲတမ်း စောစောနိုးသည်။',
      },
      {
        'en': 'Never',
        'mm': 'ဘယ်တော့မှ',
        'sentenceEn': 'I never lie to you.',
        'sentenceMM': 'မင်းကို ငါဘယ်တော့မှ မညာဘူး။',
      },
      {
        'en': 'Today',
        'mm': 'ယနေ့',
        'sentenceEn': 'I have a lot of work today.',
        'sentenceMM': 'ဒီနေ့ ကျွန်တော့်မှာ အလုပ်တွေ အများကြီး ရှိသည်။',
      },
      {
        'en': 'Here',
        'mm': 'ဤနေရာမှာ',
        'sentenceEn': 'Come here, please.',
        'sentenceMM': 'ဒီကို ခဏလာပေးပါ။',
      },
      {
        'en': 'Well',
        'mm': 'ကောင်းမွန်စွာ',
        'sentenceEn': 'He plays the piano well.',
        'sentenceMM': 'သူက ပီယာနိုကို ကောင်းကောင်း တီးနိုင်သည်။',
      },
      {
        'en': 'Quietly',
        'mm': 'တိတ်ဆိတ်စွာ',
        'sentenceEn': 'Please talk quietly in the library.',
        'sentenceMM': 'စာကြည့်တိုက်ထဲမှာ တိုးတိုးတိတ်တိတ် စကားပြောပေးပါ။',
      },
    ],
  },
  {
    'title': 'ဝိဘတ် (Preposition)',
    'definition':
        'နာမ် သို့မဟုတ် နာမ်စားတစ်ခုနှင့် အခြားစကားလုံးတို့၏ ဆက်သွယ်မှုကို ပြသောစကားလုံးဖြစ်သည်။',
    'examples': [
      {
        'en': 'In',
        'mm': 'အတွင်း၌',
        'sentenceEn': 'The keys are in my bag.',
        'sentenceMM': 'သော့တွေက ကျွန်တော့်အိတ်ထဲမှာ ရှိတယ်။',
      },
      {
        'en': 'On',
        'mm': 'အပေါ်၌',
        'sentenceEn': 'The book is on the table.',
        'sentenceMM': 'စာအုပ်က စားပွဲပေါ်မှာ ရှိသည်။',
      },
      {
        'en': 'At',
        'mm': 'နေရာတစ်ခုခုတွင်',
        'sentenceEn': 'I will meet you at the bus stop.',
        'sentenceMM': 'ကားမှတ်တိုင်မှာ မင်းကို စောင့်နေမယ်။',
      },
      {
        'en': 'Under',
        'mm': 'အောက်၌',
        'sentenceEn': 'The dog is sleeping under the tree.',
        'sentenceMM': 'ခွေးလေးက သစ်ပင်အောက်မှာ အိပ်နေတယ်။',
      },
      {
        'en': 'With',
        'mm': 'နှင့်အတူ',
        'sentenceEn': 'I went to the cinema with my brother.',
        'sentenceMM': 'ကျွန်တော် အစ်ကိုနဲ့အတူ ရုပ်ရှင်သွားကြည့်ခဲ့တယ်။',
      },
      {
        'en': 'By',
        'mm': 'ဖြင့်/နားမှာ',
        'sentenceEn': 'She travels to work by bus.',
        'sentenceMM': 'သူမ အလုပ်ကို ကားနဲ့ သွားလေ့ရှိတယ်။',
      },
      {
        'en': 'From',
        'mm': 'မှ/ထံမှ',
        'sentenceEn': 'I received a gift from my friend.',
        'sentenceMM': 'သူငယ်ချင်းဆီက လက်ဆောင်တစ်ခု ရခဲ့တယ်။',
      },
      {
        'en': 'To',
        'mm': 'သို့',
        'sentenceEn': 'We are going to the market.',
        'sentenceMM': 'ကျွန်တော်တို့ ဈေးကို သွားနေကြတယ်။',
      },
      {
        'en': 'Between',
        'mm': 'ကြားတွင်',
        'sentenceEn': 'The shop is between the bank and the hotel.',
        'sentenceMM': 'ဆိုင်က ဘဏ်နဲ့ ဟိုတယ် ကြားထဲမှာ ရှိပါတယ်။',
      },
      {
        'en': 'For',
        'mm': 'အတွက်',
        'sentenceEn': 'This present is for you.',
        'sentenceMM': 'ဒီလက်ဆောင်က မင်းအတွက်ပါ။',
      },
    ],
  },
  {
    'title': 'စကားဆက် (Conjunction)',
    'definition':
        'စကားလုံး သို့မဟုတ် ဝါကျများကို ဆက်သွယ်ပေးသော စကားလုံးဖြစ်သည်။',
    'examples': [
      {
        'en': 'And',
        'mm': 'နှင့်/ပြီးတော့',
        'sentenceEn': 'I like tea and coffee.',
        'sentenceMM': 'ကျွန်တော် လက်ဖက်ရည်နဲ့ ကော်ဖီကို ကြိုက်တယ်။',
      },
      {
        'en': 'But',
        'mm': 'သို့သော်',
        'sentenceEn': 'He is rich but he is not happy.',
        'sentenceMM': 'သူက ချမ်းသာပေမယ့် မပျော်ရွှင်ဘူး။',
      },
      {
        'en': 'Or',
        'mm': 'သို့မဟုတ်',
        'sentenceEn': 'Do you want tea or coffee?',
        'sentenceMM': 'မင်း လက်ဖက်ရည် သောက်မလား၊ ကော်ဖီ သောက်မလား။',
      },
      {
        'en': 'So',
        'mm': 'ထို့ကြောင့်',
        'sentenceEn': 'It was raining, so I took an umbrella.',
        'sentenceMM': 'မိုးရွာနေလို့ ကျွန်တော် ထီးယူသွားခဲ့တယ်။',
      },
      {
        'en': 'Because',
        'mm': 'ဘာကြောင့်လဲဆိုတော့',
        'sentenceEn': 'I was late because of the traffic.',
        'sentenceMM': 'လမ်းပိတ်နေလို့ ကျွန်တော် နောက်ကျသွားတယ်။',
      },
      {
        'en': 'If',
        'mm': 'အကယ်၍',
        'sentenceEn': 'If you study hard, you will pass.',
        'sentenceMM': 'မင်း အလုပ်ကြိုးစားရင် စာမေးပွဲအောင်လိမ့်မယ်။',
      },
      {
        'en': 'Although',
        'mm': 'သော်လည်း',
        'sentenceEn': 'Although it was cold, we went swimming.',
        'sentenceMM': 'ရာသီဥတု အေးနေသော်လည်း ကျွန်တော်တို့ ရေကူးခဲ့ကြတယ်။',
      },
      {
        'en': 'While',
        'mm': 'နေစဉ်အတွင်း',
        'sentenceEn': 'I listened to music while I was cooking.',
        'sentenceMM': 'ဟင်းချက်နေတုန်း ကျွန်တော် သီချင်းနားထောင်ခဲ့တယ်။',
      },
      {
        'en': 'Since',
        'mm': 'ကတည်းက',
        'sentenceEn': 'I have been here since morning.',
        'sentenceMM': 'ကျွန်တော် ဒီကို မနက်ကတည်းက ရောက်နေတာ။',
      },
      {
        'en': 'Unless',
        'mm': 'မ...လျှင်',
        'sentenceEn': 'You will fail unless you study.',
        'sentenceMM': 'မင်းစာမကျက်ရင် စာမေးပွဲကျလိမ့်မယ်။',
      },
    ],
  },
  {
    'title': 'အာမေဍိတ် (Interjection)',
    'definition': 'စိတ်လှုပ်ရှားမှုကို ရုတ်တရက် ဖော်ပြသောစကားလုံးဖြစ်သည်။',
    'examples': [
      {
        'en': 'Oh!',
        'mm': 'အို!',
        'sentenceEn': 'Oh! I forgot my keys.',
        'sentenceMM': 'အို! သော့တွေ ကျန်ခဲ့ပြီ။',
      },
      {
        'en': 'Wow!',
        'mm': 'ဝါး!',
        'sentenceEn': 'Wow! That dress is beautiful.',
        'sentenceMM': 'ဝါး! အဲဒီဂါဝန်လေးက တကယ့်ကို လှတာပဲ။',
      },
      {
        'en': 'Alas!',
        'mm': 'ဖြစ်ရလေခြင်း!',
        'sentenceEn': 'Alas! We lost the game.',
        'sentenceMM': 'ဖြစ်မှဖြစ်ရလေ! ငါတို့ ရှုံးသွားပြီ။',
      },
      {
        'en': 'Ouch!',
        'mm': 'အား!',
        'sentenceEn': 'Ouch! That hurts.',
        'sentenceMM': 'အား! နာလိုက်တာ။',
      },
      {
        'en': 'Hello!',
        'mm': 'ဟယ်လို!',
        'sentenceEn': 'Hello! How are you?',
        'sentenceMM': 'ဟယ်လို! နေကောင်းလား။',
      },
      {
        'en': 'Hey!',
        'mm': 'ဟေး!',
        'sentenceEn': 'Hey! Look at me.',
        'sentenceMM': 'ဟေး! ငါ့ကိုကြည့်ဦး။',
      },
      {
        'en': 'Oops!',
        'mm': 'အာဗြဲ!',
        'sentenceEn': 'Oops! I dropped the glass.',
        'sentenceMM': 'အာဗြဲ! ဖန်ခွက် ကျကွဲသွားပြီ။',
      },
      {
        'en': 'Bravo!',
        'mm': 'သာဓု/တော်လေစွ!',
        'sentenceEn': 'Bravo! You did a great job.',
        'sentenceMM': 'သာဓုပါကွာ! မင်း တကယ့်ကို တော်ပါတယ်။',
      },
      {
        'en': 'Hooray!',
        'mm': 'ဟေးဟေး!',
        'sentenceEn': 'Hooray! We won the match.',
        'sentenceMM': 'ဟေး! ငါတို့ ပွဲနိုင်ပြီဟေ့။',
      },
      {
        'en': 'Ah!',
        'mm': 'အာ!',
        'sentenceEn': 'Ah! Now I understand.',
        'sentenceMM': 'အာ! အခုမှပဲ ကျွန်တော် နားလည်သွားတော့တယ်။',
      },
    ],
  },
];

class PartOfSpeechs extends StatelessWidget {
  const PartOfSpeechs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ဝါစင်္ဂ ၈ မျိုး (8 Parts of Speech)')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const QuizPage()),
        ),
        label: const Text("Take a Quiz"),
        icon: const Icon(Icons.play_arrow),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: MediaQuery.sizeOf(context).width * 0.05,
        ),
        itemCount: partsOfSpeech.length,
        itemBuilder: (context, index) {
          final item = partsOfSpeech[index];
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
                item['title'],
                style: Theme.of(context).textTheme.titleMedium,
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      title: item['title'],
                      definition: item['definition'],
                      examples: List<Map<String, String>>.from(
                        item['examples'],
                      ),
                    ),
                  ),
                );
              },
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

  Widget _buildHighlightedSentence(
    String sentence,
    String word,
    BuildContext context,
  ) {
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
        spans.add(
          TextSpan(
            style: TextStyle(color: Colors.blue),
            text: sentence.substring(lastIndex, match.start),
          ),
        );
      }

      // highlighted word
      spans.add(
        TextSpan(
          text: sentence.substring(match.start, match.end),
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            decoration: TextDecoration.underline,
          ),
        ),
      );

      lastIndex = match.end;
    }

    // remaining text
    if (lastIndex < sentence.length) {
      spans.add(
        TextSpan(
          style: TextStyle(color: Colors.blue),
          text: sentence.substring(lastIndex),
        ),
      );
    }
    return RichText(text: TextSpan(children: spans));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: MediaQuery.sizeOf(context).width * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('အဓိပ္ပာယ်သတ်မှတ်ချက် (Definition)', context),
            const SizedBox(height: 8),
            Text(definition, style: const TextStyle(fontSize: 16)),
            const Divider(height: 32),
            _buildSectionTitle('ဥပမာစကားလုံးများ (Example Words)', context),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: examples
                  .map(
                    (ex) => Chip(
                      label: Text("${ex['en']} (${ex['mm']})"),
                      backgroundColor: Theme.of(
                        context,
                      ).colorScheme.onPrimaryContainer.withAlpha(25),
                    ),
                  )
                  .toList(),
            ),
            const Divider(height: 32),

            _buildSectionTitle('နမူနာဝါကျများ (Sample Sentences)', context),
            SizedBox(height: 16),

            ...examples.map(
              (ex) => Card(
                color: Theme.of(context).colorScheme.onPrimary,
                margin: const EdgeInsets.only(bottom: 8),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  ex['en']!,
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "(${ex['mm']!})",
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ),
                          SpeakButton(text: ex['sentenceEn'] ?? ""),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Divider(thickness: 0.5),
                      ),

                      const SizedBox(height: 4),
                      _buildHighlightedSentence(
                        ex['sentenceEn']!,
                        ex['en']!,
                        context,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        ex['sentenceMM']!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(
                            context,
                          ).colorScheme.onSecondaryContainer,
                          // fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String text, BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.titleMedium);
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late String currentWord;
  late String correctAnswer;
  List<String> options = [];
  int score = 0;
  int totalAnswered = 0;

  bool soundOn = true;

  toggleSoundOn() {
    setState(() {
      soundOn = !soundOn;
      SoundService.toggle();
    });
  }

  @override
  void initState() {
    super.initState();
    generateQuestion();
  }

  void generateQuestion() {
    final random = Random();
    // Pick a random category
    final categoryIndex = random.nextInt(partsOfSpeech.length);
    final category = partsOfSpeech[categoryIndex];

    // Pick a random word from that category
    final examples = category['examples'] as List<Map<String, String>>;
    final wordMap = examples[random.nextInt(examples.length)];

    setState(() {
      currentWord = wordMap['en']!;
      correctAnswer = category['title'];

      // Generate Options
      options = [correctAnswer];
      while (options.length < 4) {
        String randomOption =
            partsOfSpeech[random.nextInt(partsOfSpeech.length)]['title'];
        if (!options.contains(randomOption)) {
          options.add(randomOption);
        }
      }
      options.shuffle();
    });
  }

  void checkAnswer(String selected) {
    totalAnswered++;

    bool isCorrect = (selected == correctAnswer);

    if (isCorrect) {
      SoundService.playCorrect(); // no await
      score++;
    } else {
      SoundService.playWrong(); // no await
    }

    if (!mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(
          isCorrect ? "မှန်သွားပြီ! 🎉" : "မှားသွားပြီ! ❌",
          style: TextStyle(
            color: isCorrect
                ? Theme.of(context).colorScheme.onPrimaryContainer
                : Theme.of(context).colorScheme.onErrorContainer,
          ),
        ),
        content: Text(
          isCorrect
              ? "မှန်ပါတယ် '$currentWord' က $correctAnswer ဖြစ်ပါတယ်"
              : "တကယ်တော့, '$currentWord' ဆိုတာ $correctAnswer တစ်ခုပါ",
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.pop(context);
              generateQuestion();
            },
            iconAlignment: IconAlignment.end,
            icon: const Icon(Icons.navigate_next),
            label: const Text("Next Question"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Score: $score / $totalAnswered"),
        actions: [
          IconButton(
            onPressed: () {
              toggleSoundOn();
            },
            tooltip: "ဖွင့်/ပိတ်",
            icon: Icon(soundOn ? Icons.volume_up : Icons.volume_off),
          ),
        ],
        actionsPadding: EdgeInsets.only(
          right: MediaQuery.sizeOf(context).width * 0.05,
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 16,
            horizontal: MediaQuery.sizeOf(context).width * 0.05,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Identify this Part of Speech \n(အမျိုးအစားခွဲပြပါ)",
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                currentWord,
                style: const TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 40),
              ...options.map(
                (option) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () => checkAnswer(option),
                      child: Text(option, style: const TextStyle(fontSize: 18)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
