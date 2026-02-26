import 'package:flutter/material.dart';

import 'tense_matrix_data.dart';

class TenseCategoryScreen extends StatelessWidget {
  const TenseCategoryScreen({super.key});

  final List<Map<String, dynamic>> tensesData = const [
    {
      'group': 'Present Tenses (ပစ္စုပ္ပန်ကာလ)',
      'items': [
        {
          'title': 'Simple Present (ပစ္စုပ္ပန်ကာလရိုးရိုး)',
          'formula': 'Subject + V1 (s/es)',
          'usage':
              'အမြဲတမ်းမှန်ကန်သောအရာများ (General Truths)၊ အလေ့အထများ (Habits) နှင့် ကြိုတင်သတ်မှတ်ထားသော အချိန်ဇယားများ (Timetables) အတွက်သုံးသည်။',
          'examples': [
            // --- Category 1: General Truths (သိပ္ပံနည်းကျ အမှန်တရားများ) ---
            {
              's': 'The earth',
              'v': 'revolves',
              'rest': 'around the sun.',
              'mm': 'ကမ္ဘာသည် နေကို ဗဟိုပြု၍ လည်ပတ်နေသည်။',
              'note': 'အမြဲတမ်းမှန်ကန်သည့်အချက်။',
            },
            {
              's': 'Water',
              'v': 'boils',
              'rest': 'at 100°C.',
              'mm': 'ရေသည် ၁၀၀ ဒီဂရီစင်တီဂရိတ်တွင် ဆူပွက်သည်။',
              'note': 'Scientific fact.',
            },
            {
              's': 'Cows',
              'v': 'eat',
              'rest': 'grass.',
              'mm': 'နွားများသည် မြက်စားကြသည်။',
              'note': 'Plural subject ဖြစ်၍ Verb တွင် s မပါပါ။',
            },

            // --- Category 2: Habits & Routines (အလေ့အထများ) ---
            {
              's': 'I',
              'v': 'wake up',
              'rest': 'at 6 AM every day.',
              'mm': 'ကျွန်တော် နေ့တိုင်း မနက် ၆ နာရီမှာ နိုးသည်။',
              'note': 'ပုံမှန်လုပ်ဆောင်ချက်။',
            },
            {
              's': 'She',
              'v': 'practices',
              'rest': 'piano on weekends.',
              'mm': 'သူမသည် ပိတ်ရက်များတွင် ပီယာနို လေ့ကျင့်သည်။',
              'note': 'She သည် Singular ဖြစ်၍ Verb တွင် s ပါသည်။',
            },
            {
              's': 'They',
              'v': 'often go',
              'rest': 'to the gym.',
              'mm': 'သူတို့ ခဏခဏ ဂျင်မ်သွားလေ့ရှိသည်။',
              'note': 'အကြိမ်ရေပြ Adverb (Often) ပါဝင်သောအသုံး။',
            },

            // --- Category 3: Timetables & Fixed Future (သတ်မှတ်ထားသော အချိန်ဇယားများ) ---
            {
              's': 'The train',
              'v': 'leaves',
              'rest': 'at 8:00 tonight.',
              'mm': 'ရထားသည် ယနေ့ည ၈ နာရီတွင် ထွက်ခွာမည်။',
              'note':
                  'အနာဂတ်ဖြစ်သော်လည်း အချိန်ဇယားဖြစ်၍ Simple Present သုံးသည်။',
            },
            {
              's': 'The exam',
              'v': 'starts',
              'rest': 'at 9 AM tomorrow.',
              'mm': 'စာမေးပွဲသည် မနက်ဖြန် မနက် ၉ နာရီတွင် စတင်မည်။',
              'note': 'Fixed schedule.',
            },

            // --- Category 4: Stative Verbs (အခြေအနေပြ ကြိယာများ) ---
            {
              's': 'I',
              'v': 'need',
              'rest': 'some help right now.',
              'mm': 'ကျွန်တော် အခု အကူအညီ လိုအပ်နေသည်။',
              'note':
                  'Need သည် Continuous (ing) သုံး၍မရသော Stative verb ဖြစ်သည်။',
            },
            {
              's': 'He',
              'v': 'understands',
              'rest': 'the situation.',
              'mm': 'သူသည် အခြေအနေကို နားလည်သည်။',
              'note': 'စိတ်ပိုင်းဆိုင်ရာ အခြေအနေ။',
            },
            {
              's': 'This soup',
              'v': 'tastes',
              'rest': 'delicious.',
              'mm': 'ဒီဟင်းချိုက အရသာ အရမ်းကောင်းသည်။',
              'note': 'အာရုံခံစားမှုပြ ကြိယာ။',
            },

            // --- Category 5: Instructions & Directions (လမ်းညွှန်ချက်များ) ---
            {
              's': 'You',
              'v': 'turn',
              'rest': 'left at the next corner.',
              'mm': 'နောက်ထောင့်မှာ ဘယ်ဘက်ကို ကွေ့ပါ။',
              'note': 'လမ်းညွှန်ချက်ပေးရာတွင် သုံးသည်။',
            },
            {
              's': 'First, you',
              'v': 'mix',
              'rest': 'the flour and eggs.',
              'mm': 'ပထမဦးစွာ ဂျုံနှင့် ကြက်ဥကို ရောမွှေပါ။',
              'note': 'ဟင်းချက်နည်း လမ်းညွှန်ချက်။',
            },

            // --- Category 6: Headlines & Professional Narrative (သတင်းခေါင်းစဉ်များ) ---
            {
              's': 'The President',
              'v': 'arrives',
              'rest': 'in Myanmar today.',
              'mm': 'သမ္မတသည် ယနေ့ မြန်မာနိုင်ငံသို့ ရောက်ရှိသည်။',
              'note': 'သတင်းခေါင်းစဉ်များတွင် Simple Present ကို အသုံးများသည်။',
            },
            {
              's': 'The hero',
              'v': 'saves',
              'rest': 'the princess at the end.',
              'mm': 'ဇာတ်သိမ်းပိုင်းတွင် သူရဲကောင်းက မင်းသမီးကို ကယ်တင်ခဲ့သည်။',
              'note': 'ပုံပြင် သို့မဟုတ် ရုပ်ရှင်အကြောင်း ပြန်ပြောပြခြင်း။',
            },
          ],
        },
        {
          'title': 'Present Continuous (ပစ္စုပ္ပန်ကာလဖြစ်ဆဲ)',
          'formula': 'Subject + am/is/are + V-ing',
          'usage':
              'လက်ရှိဖြစ်ပျက်နေသော အရာများ၊ ယာယီအခြေအနေများ၊ သေချာပေါက်ဖြစ်လာမည့် အနာဂတ်အစီအစဉ်များနှင့် စိတ်အနှောင့်အယှက်ဖြစ်စရာ အလေ့အထများအတွက် သုံးသည်။',
          'examples': [
            // --- Category 1: Actions Happening Now (ယခုလက်ရှိ လုပ်ဆောင်နေဆဲ) ---
            {
              's': 'I',
              'v': 'am writing',
              'rest': 'a letter to my parents.',
              'mm': 'ကျွန်တော် မိဘတွေဆီ စာရေးနေပါတယ်။',
              'note': 'စကားပြောနေချိန်တွင် အမှန်တကယ် လုပ်နေသည့်အလုပ်။',
            },
            {
              's': 'The students',
              'v': 'are listening',
              'rest': 'to the lecture.',
              'mm': 'ကျောင်းသားတွေက ဟောပြောချက်ကို နားထောင်နေကြတယ်။',
              'note': 'Plural subject ဖြစ်၍ "are" သုံးသည်။',
            },
            {
              's': 'Look! It',
              'v': 'is snowing',
              'rest': 'outside.',
              'mm': 'ကြည့်စမ်း! အပြင်မှာ နှင်းတွေကျနေတယ်။',
              'note': 'မျက်မှောက်အခြေအနေကို အာရုံစိုက်စေခြင်း။',
            },

            // --- Category 2: Temporary Situations (ယာယီအခြေအနေများ) ---
            {
              's': 'He',
              'v': 'is staying',
              'rest': 'with his aunt this week.',
              'mm': 'သူ ဒီအပတ်မှာ သူ့အဒေါ်နဲ့အတူ နေနေပါတယ်။',
              'note': 'အမြဲတမ်းမဟုတ်ဘဲ ခဏတာ ယာယီနေထိုင်ခြင်း။',
            },
            {
              's': 'I',
              'v': 'am reading',
              'rest': 'a very interesting book.',
              'mm': 'ကျွန်တော် စိတ်ဝင်စားစရာကောင်းတဲ့ စာအုပ်တစ်အုပ် ဖတ်နေတယ်။',
              'note':
                  'အခုလက်ရှိ လက်ထဲမှာ ကိုင်ဖတ်နေတာမျိုး မဟုတ်ဘဲ ဒီရက်ပိုင်းအတွင်း လုပ်နေသည့်အလုပ်။',
            },
            {
              's': 'She',
              'v': 'is working',
              'rest': 'at a cafe until she finds a job.',
              'mm': 'သူမ အလုပ်မရခင်အထိ ကော်ဖီဆိုင်မှာ အလုပ်လုပ်နေတယ်။',
              'note': 'ယာယီအလုပ်အကိုင်။',
            },

            // --- Category 3: Definite Future Plans (သေချာသော အနာဂတ်အစီအစဉ်) ---
            {
              's': 'We',
              'v': 'are meeting',
              'rest': 'the manager at 10 AM tomorrow.',
              'mm': 'မနက်ဖြန် မနက် ၁၀ နာရီမှာ မန်နေဂျာနဲ့ တွေ့ဖို့ရှိပါတယ်။',
              'note': 'ကြိုတင်စီစဉ်ထားသော အနာဂတ် (Fixed Arrangement)။',
            },
            {
              's': 'I',
              'v': 'am flying',
              'rest': 'to Singapore next Friday.',
              'mm': 'နောက်အပတ် သောကြာနေ့မှာ စင်ကာပူကို ပျံသန်းမှာပါ။',
              'note': 'လက်မှတ်ဝယ်ပြီးသား၊ သေချာပြီးသား အစီအစဉ်။',
            },
            {
              's': 'They',
              'v': 'are getting married',
              'rest': 'this coming June.',
              'mm': 'သူတို့ လာမယ့် ဇွန်လမှာ လက်ထပ်ကြတော့မယ်။',
              'note': 'နီးကပ်သော အနာဂတ် အစီအစဉ်။',
            },

            // --- Category 4: Expressing Annoyance (စိတ်ပျက်ခြင်း/အပြစ်တင်ခြင်း) ---
            {
              's': 'You',
              'v': 'are always losing',
              'rest': 'your keys!',
              'mm': 'မင်းကတော့ အမြဲတမ်း သော့ပျောက်နေတာပဲ။',
              'note':
                  '"Always" နှင့် တွဲသုံး၍ စိတ်အနှောင့်အယှက်ဖြစ်ရသောအလေ့အထကို ပြသည်။',
            },
            {
              's': 'He',
              'v': 'is constantly complaining',
              'rest': 'about the weather.',
              'mm': 'သူက ရာသီဥတုအကြောင်းကို တတွတ်တွတ် ညည်းညူနေတော့တာပဲ။',
              'note': 'အမြဲတမ်းလုပ်နေသည့် စိတ်ပျက်ဖွယ် အပြုအမူ။',
            },

            // --- Category 5: Changing & Developing Situations (ပြောင်းလဲတိုးတက်နေသောအခြေအနေ) ---
            {
              's': 'Your English',
              'v': 'is getting',
              'rest': 'better and better.',
              'mm': 'မင်းရဲ့ အင်္ဂလိပ်စာက ပိုပိုပြီး တိုးတက်လာနေတယ်။',
              'note': 'ပြောင်းလဲတိုးတက်မှု အဆင့်ဆင့်။',
            },
            {
              's': 'The world population',
              'v': 'is increasing',
              'rest': 'rapidly.',
              'mm': 'ကမ္ဘာ့လူဦးရေက လျင်မြန်စွာ တိုးပွားနေတယ်။',
              'note': 'Trend သို့မဟုတ် ဖြစ်ပေါ်ပြောင်းလဲမှု။',
            },

            // --- Category 6: Non-Continuous Verbs Caution (သတိပြုရန် - ing သုံးလေ့မရှိသော ကြိယာများ) ---
            {
              's': 'I',
              'v': 'am liking',
              'rest': 'this pizza.',
              'mm': 'မမှန်ကန်ပါ။ "I like this pizza" ဟုသာ သုံးရမည်။',
              'note':
                  'Loves, Likes, Hates, Wants စသည့် စိတ်ခံစားမှုပြကြိယာများတွင် ing မသုံးရပါ။',
            },
            {
              's': 'She',
              'v': 'is knowing',
              'rest': 'the answer.',
              'mm': 'မမှန်ကန်ပါ။ "She knows the answer" ဟုသာ သုံးရမည်။',
              'note':
                  'အသိဉာဏ်ဆိုင်ရာ သိရှိနားလည်မှုကို ဖော်ပြလျှင် Simple Present သာသုံးပါ။',
            },
          ],
        },
        {
          'title': 'Present Perfect (ပစ္စုပ္ပန်ကာလပြီးစီး)',
          'formula': 'Subject + have/has + V3 (Past Participle)',
          'usage':
              'အတိတ်တွင်ဖြစ်ပျက်ခဲ့သော်လည်း လက်ရှိနှင့် ဆက်စပ်နေသောအရာများ၊ အတွေ့အကြုံများ နှင့် ယခုလေးတင် ပြီးစီးသွားသော အရာများအတွက် သုံးသည်။',
          'examples': [
            // --- Category 1: Experiences (ဘဝအတွေ့အကြုံများ) ---
            {
              's': 'I',
              'v': 'have visited',
              'rest': 'Japan three times.',
              'mm': 'ကျွန်တော် ဂျပန်နိုင်ငံကို သုံးကြိမ်ရောက်ဖူးပါတယ်။',
              'note':
                  'ဘယ်အချိန်ကသွားလဲဆိုတာထက် ရောက်ဖူးတယ်ဆိုတဲ့ အတွေ့အကြုံကို ဦးစားပေးသည်။',
            },
            {
              's': 'She',
              'v': 'has never seen',
              'rest': 'snow in her life.',
              'mm': 'သူမ တစ်သက်မှာ နှင်းတစ်ခါမှ မမြင်ဖူးသေးဘူး။',
              'note': 'အခုချိန်ထိ မကြုံဖူးသေးတဲ့ အတွေ့အကြုံ။',
            },
            {
              's': 'Have you ever',
              'v': 'eaten',
              'rest': 'durian?',
              'mm': 'မင်း ဒူးရင်းသီး စားဖူးသလား။',
              'note': 'Ever ကို အတွေ့အကြုံမေးခွန်းများတွင် သုံးသည်။',
            },

            // --- Category 2: Recent Actions with "Just/Already/Yet" (မကြာမီကမှ ပြီးစီးခြင်း) ---
            {
              's': 'The taxi',
              'v': 'has just arrived',
              'rest': 'outside.',
              'mm': 'တက္ကစီက အပြင်ကို ခုလေးတင် ရောက်လာပြီ။',
              'note': 'Just သည် ခုလေးတင် ပြီးစီးခြင်းကို ဖော်ပြသည်။',
            },
            {
              's': 'I',
              'v': 'have already finished',
              'rest': 'my homework.',
              'mm': 'ကျွန်တော် အိမ်စာတွေ ပြီးသွားပြီ။',
              'note': 'မျှော်လင့်ထားတာထက် စောပြီး ပြီးစီးခြင်း။',
            },
            {
              's': 'He',
              'v': 'has not called',
              'rest': 'me yet.',
              'mm': 'သူ ကျွန်တော့်ကို အခုထိ ဖုန်းမဆက်သေးဘူး။',
              'note': 'Yet ကို အငြင်းနှင့် အမေးဝါကျတွင် သုံးသည်။',
            },

            // --- Category 3: Unfinished Actions with "Since/For" (အတိတ်မှ ယခုထိ ဖြစ်ပျက်နေခြင်း) ---
            {
              's': 'We',
              'v': 'have lived',
              'rest': 'in Yangon for ten years.',
              'mm': 'ကျွန်တော်တို့ ရန်ကုန်မှာ နေလာတာ ၁၀ နှစ်ရှိပြီ။',
              'note': 'လွန်ခဲ့တဲ့ ၁၀ နှစ်ကစပြီး အခုထိ နေထိုင်ဆဲ ဖြစ်သည်။',
            },
            {
              's': 'They',
              'v': 'have known',
              'rest': 'each other since 2015.',
              'mm': 'သူတို့ တစ်ယောက်နဲ့တစ်ယောက် သိလာတာ ၂၀၁၅ ကတည်းကပါ။',
              'note': 'Since ကို အစပြုချိန် (Point of time) အတွက် သုံးသည်။',
            },

            // --- Category 4: Results in the Present (လက်ရှိတွင် အကျိုးသက်ရောက်မှုရှိနေခြင်း) ---
            {
              's': 'Oh no! I',
              'v': 'have lost',
              'rest': 'my keys.',
              'mm': 'ဒုက္ခပါပဲ၊ ကျွန်တော့်သော့တွေ ပျောက်သွားပြီ။',
              'note':
                  'အတိတ်မှာ ပျောက်ခဲ့ပေမယ့် အခုထိ ရှာမတွေ့သေးတဲ့ အကျိုးသက်ရောက်မှု ရှိနေသည်။',
            },
            {
              's': 'The price of gold',
              'v': 'has gone up',
              'rest': 'recently.',
              'mm': 'မကြာသေးမီက ရွှေဈေး တက်သွားတယ်။',
              'note': 'လက်ရှိဖြစ်ပေါ်နေတဲ့ အခြေအနေ။',
            },

            // --- Category 5: Multiple Actions at Different Times (မတူညီသောအချိန်များတွင် ထပ်တလဲလဲဖြစ်ခြင်း) ---
            {
              's': 'The army',
              'v': 'has attacked',
              'rest': 'the city several times.',
              'mm': 'စစ်တပ်က မြို့ကို အကြိမ်ကြိမ် တိုက်ခိုက်ခဲ့ပြီးပြီ။',
              'note': 'အတိတ်မှာ အကြိမ်ကြိမ် ဖြစ်ပျက်ခဲ့ပုံ။',
            },
            {
              's': 'I',
              'v': 'have seen',
              'rest': 'that movie four times.',
              'mm': 'ဒီရုပ်ရှင်ကို ကျွန်တော် လေးခါ ကြည့်ပြီးပြီ။',
              'note': 'ထပ်တလဲလဲ အတွေ့အကြုံ။',
            },

            // --- Category 6: Accomishments (အောင်မြင်မှုများ) ---
            {
              's': 'Scientists',
              'v': 'have discovered',
              'rest': 'a new planet.',
              'mm':
                  'သိပ္ပံပညာရှင်တွေ ဂြိုဟ်အသစ်တစ်ခုကို ရှာဖွေတွေ့ရှိခဲ့ကြပြီ။',
              'note': 'လူသားထုရဲ့ အောင်မြင်မှုမှတ်တိုင်။',
            },
            {
              's': 'My son',
              'v': 'has learned',
              'rest': 'how to read.',
              'mm': 'ကျွန်တော့်သားလေး စာဖတ်တတ်သွားပြီ။',
              'note': 'တိုးတက်မှု အခြေအနေ။',
            },

            // --- Category 7: Been vs Gone (အထူးသတိပြုရန်) ---
            {
              's': 'She',
              'v': 'has been to',
              'rest': 'London.',
              'mm': 'သူမ လန်ဒန်ကို ရောက်ဖူးတယ် (အခု ပြန်ရောက်နေပြီ)။',
              'note': 'Been = သွားပြီး ပြန်ရောက်ပြီ။',
            },
            {
              's': 'She',
              'v': 'has gone to',
              'rest': 'London.',
              'mm': 'သူမ လန်ဒန်ကို သွားပြီ (အခုထိ ဟိုမှာပဲ ရှိနေသေးတယ်)။',
              'note': 'Gone = သွားပြီး မပြန်လာသေးပါ။',
            },
          ],
        },
        {
          'title': 'Present Perfect Continuous (ပစ္စုပ္ပန်ကာလပြီးစီးဖြစ်ဆဲ)',
          'formula': 'Subject + have/has + been + V-ing',
          'usage':
              'အတိတ်မှစ၍ လက်ရှိအချိန်ထိ တောက်လျှောက် (မရပ်မနား) လုပ်ဆောင်နေဆဲအရာများကို ဖော်ပြသည်။ အချိန်ကာလ (Duration) ကို အဓိက ဦးစားပေး ဖော်ပြလိုလျှင် သုံးသည်။',
          'examples': [
            // --- Category 1: Duration from Past to Now (အတိတ်မှ ယခုထိ ကြာချိန်) ---
            {
              's': 'I',
              'v': 'have been waiting',
              'rest': 'for you for two hours!',
              'mm': 'မင်းကို စောင့်နေတာ နှစ်နာရီတောင် ရှိသွားပြီ။',
              'note':
                  'စောင့်နေသည့် ကြာချိန်ကို ဒေါသတကြီး သို့မဟုတ် အလေးအနက် ပြောဆိုခြင်း။',
            },
            {
              's': 'She',
              'v': 'has been working',
              'rest': 'at this company since 2010.',
              'mm': 'သူမ ဒီကုမ္ပဏီမှာ အလုပ်လုပ်နေတာ ၂၀၁၀ ကတည်းကပါ။',
              'note': 'အခုထိလည်း ဆက်လက်လုပ်ကိုင်နေဆဲ ဖြစ်သည်။',
            },
            {
              's': 'We',
              'v': 'have been living',
              'rest': 'in this house for decades.',
              'mm': 'ကျွန်တော်တို့ ဒီအိမ်မှာ နေလာတာ ဆယ်စုနှစ်ချီနေပြီ။',
              'note': 'နှစ်ပေါင်းများစွာ ကြာမြင့်မှုကို ဖော်ပြခြင်း။',
            },

            // --- Category 2: Actions Recently Stopped with Visible Results (မျက်မြင်သက်သေ အကျိုးဆက်များ) ---
            {
              's': 'My hands are dirty because I',
              'v': 'have been repairing',
              'rest': 'my bike.',
              'mm': 'စက်ဘီးပြင်နေခဲ့လို့ ကျွန်တော့်လက်တွေ ပေပွနေတာ။',
              'note':
                  'အလုပ်က အခုလေးတင် ပြီးသွားနိုင်သော်လည်း လက်ရှိတွင် လက်ဆုပ်လက်ကိုင်ပြနိုင်သော အကျိုးဆက် (လက်ပေနေခြင်း) ရှိသည်။',
            },
            {
              's': 'Why are your eyes red? Have you',
              'v': 'been crying',
              'rest': '?',
              'mm': 'ဘာလို့ မျက်လုံးတွေ နီနေတာလဲ? ငိုနေခဲ့တာလား။',
              'note': 'မျက်မြင်အခြေအနေကို ကြည့်ပြီး မေးမြန်းခြင်း။',
            },
            {
              's': 'He is out of breath because he',
              'v': 'has been running',
              'rest': '.',
              'mm': 'သူ အမောတကော ဖြစ်နေတာ ဘာလို့လဲဆိုတော့ သူ ပြေးနေခဲ့လို့ပါ။',
              'note': 'အမောဖောက်နေခြင်းက အလုပ်လုပ်ခဲ့သည့် သက်သေပင် ဖြစ်သည်။',
            },

            // --- Category 3: Temporary Habits (ယာယီ အလေ့အထများ) ---
            {
              's': 'I',
              'v': 'have been drinking',
              'rest': 'too much coffee lately.',
              'mm': 'ဒီရက်ပိုင်း ကျွန်တော် ကော်ဖီတွေ အရမ်းသောက်နေမိတယ်။',
              'note': 'တစ်သက်လုံး မဟုတ်ဘဲ မကြာသေးမီကမှ ဖြစ်ပေါ်လာသော အလေ့အထ။',
            },
            {
              's': 'She',
              'v': 'has been feeling',
              'rest': 'a bit depressed recently.',
              'mm': 'ဒီရက်ပိုင်း သူမ စိတ်ဓာတ်နည်းနည်း ကျနေခဲ့တယ်။',
              'note': 'Lately / Recently တို့နှင့် တွဲသုံးလေ့ရှိသည်။',
            },

            // --- Category 4: Emphasis on Continuity (တောက်လျှောက် လုပ်နေခြင်းကို အလေးပေးခြင်း) ---
            {
              's': 'It',
              'v': 'has been raining',
              'rest': 'all day long.',
              'mm': 'တစ်နေကုန် မိုးရွာနေတာပဲ။',
              'note': 'မနက်ကတည်းက အခုထိ မရပ်မနား ရွာနေခြင်း။',
            },
            {
              's': 'They',
              'v': 'have been arguing',
              'rest': 'since the meeting started.',
              'mm': 'အစည်းအဝေး စကတည်းက သူတို့ ငြင်းခုန်နေကြတာ။',
              'note': 'အနှောင့်အယှက်မရှိ တောက်လျှောက် ဖြစ်နေခြင်း။',
            },

            // --- Category 5: General Progress (တိုးတက်မှု အခြေအနေ) ---
            {
              's': 'The team',
              'v': 'has been developing',
              'rest': 'this software for months.',
              'mm': 'ဒီအဖွဲ့က ဒီဆော့ဖ်ဝဲကို ဖန်တီးနေတာ လပေါင်းများစွာ ကြာပြီ။',
              'note': 'ရေရှည် ပရောဂျက်များအတွက် သုံးသည်။',
            },
            {
              's': 'I',
              'v': 'have been studying',
              'rest': 'hard for my final exams.',
              'mm':
                  'နောက်ဆုံးနှစ် စာမေးပွဲအတွက် ကျွန်တော် စာတွေ ကြိုးစားဖတ်နေခဲ့တာပါ။',
              'note': 'လက်ရှိ ကြိုးပမ်းအားထုတ်မှု။',
            },

            // --- Category 6: Questions about Duration (ဘယ်လောက်ကြာပြီလဲဟု မေးခြင်း) ---
            {
              's': 'How long have you',
              'v': 'been learning',
              'rest': 'English?',
              'mm': 'မင်း အင်္ဂလိပ်စာ သင်နေတာ ဘယ်လောက်တောင် ကြာပြီလဲ။',
              'note': '"How long" မေးခွန်းများအတွက် အကောင်းဆုံး Tense ဖြစ်သည်။',
            },
            {
              's': 'How long has it',
              'v': 'been leaking',
              'rest': '?',
              'mm': 'ဒီကနေ ယိုစိမ့်နေတာ ဘယ်လောက်ကြာပြီလဲ။',
              'note': 'ပြဿနာတစ်ခု၏ ကြာချိန်ကို မေးခြင်း။',
            },

            // --- Category 7: Non-Action Verbs Warning (အထူးသတိပြုရန်) ---
            {
              's': 'I',
              'v': 'have been knowing',
              'rest': 'him for years.',
              'mm': 'မမှန်ကန်ပါ။ "I have known him" ဟုသာ သုံးရမည်။',
              'note':
                  'Know, Love, Believe ကဲ့သို့သော အခြေအနေပြကြိယာ (Stative Verbs) များတွင် -ing မသုံးရပါ။',
            },
          ],
        },
      ],
    },
    {
      'group': 'Past Tenses (အတိတ်ကာလ)',
      'items': [
        {
          'title': 'Simple Past (အတိတ်ကာလရိုးရိုး)',
          'formula': 'Subject + V2 (Past Tense Verb)',
          'usage':
              'အတိတ်က သတ်မှတ်ထားသော အချိန်တစ်ခုတွင် ပြီးဆုံးခဲ့သည့် အပြုအမူများ၊ အလေ့အထများကို ဖော်ပြသည်။',
          'examples': [
            {
              's': 'I',
              'v': 'finished',
              'rest': 'my project last night.',
              'mm': 'မနေ့ညက ကျွန်တော့် ပရောဂျက်ကို အပြီးသတ်ခဲ့ပါတယ်။',
              'note': 'Last night ဟူသော အချိန်အတိအကျ ပါဝင်သည်။',
            },
            {
              's': 'We',
              'v': 'visited',
              'rest': 'Bagan in 2022.',
              'mm': '၂၀၂၂ ခုနှစ်မှာ ပုဂံကို လည်ပတ်ခဲ့ကြတယ်။',
              'note': 'အတိတ်က ခုနှစ်တစ်ခုကို ညွှန်းဆိုခြင်း။',
            },
            {
              's': 'She',
              'v': 'bought',
              'rest': 'a new phone yesterday.',
              'mm': 'မနေ့က သူမ ဖုန်းအသစ်တစ်လုံး ဝယ်ခဲ့တယ်။',
              'note': 'Buy ၏ V2 မှာ Bought ဖြစ်သည်။',
            },
            {
              's': 'The ancient Egyptians',
              'v': 'built',
              'rest': 'the pyramids.',
              'mm':
                  'ရှေးဟောင်း အီဂျစ်လူမျိုးတွေက ပိရမစ်တွေကို တည်ဆောက်ခဲ့ကြတယ်။',
              'note': 'သမိုင်းဝင် အချက်အလက်များအတွက် သုံးသည်။',
            },
            {
              's': 'He',
              'v': 'lived',
              'rest': 'in Tokyo for five years.',
              'mm': 'သူ တိုကျိုမှာ ငါးနှစ်ကြာ နေထိုင်ခဲ့တယ်။',
              'note': 'အခုတော့ ဟိုမှာ မနေတော့ပါ။',
            },
            {
              's': 'I',
              'v': 'saw',
              'rest': 'a movie last weekend.',
              'mm': 'ပြီးခဲ့တဲ့ အပတ်က ရုပ်ရှင်ကြည့်ခဲ့တယ်။',
              'note': 'See ၏ V2 မှာ Saw ဖြစ်သည်။',
            },
            {
              's': 'They',
              'v': 'arrived',
              'rest': 'late for the meeting.',
              'mm': 'သူတို့ အစည်းအဝေးကို နောက်ကျမှ ရောက်လာခဲ့ကြတယ်။',
              'note': 'Completed action.',
            },
            {
              's': 'Shakespeare',
              'v': 'wrote',
              'rest': 'Hamlet.',
              'mm': 'ရှေးစပီးယားက ဟမ်းလက်ကို ရေးသားခဲ့သည်။',
              'note': 'ကွယ်လွန်ပြီးသူများ၏ လုပ်ဆောင်ချက်။',
            },
            {
              's': 'The rain',
              'v': 'stopped',
              'rest': 'an hour ago.',
              'mm': 'မိုးက လွန်ခဲ့တဲ့ တစ်နာရီက ရပ်သွားခဲ့တယ်။',
              'note': 'Ago ကို Simple Past တွင် အသုံးများသည်။',
            },
            {
              's': 'When I was a child, I',
              'v': 'played',
              'rest': 'football every day.',
              'mm': 'ငယ်ငယ်တုန်းက နေ့တိုင်း ဘောလုံးကစားခဲ့တယ်။',
              'note': 'အတိတ်က အလေ့အထ (Past Habit)။',
            },
            {
              's': 'She',
              'v': 'left',
              'rest': 'the room quietly.',
              'mm': 'သူမ အခန်းထဲကနေ တိတ်တဆိတ် ထွက်သွားခဲ့တယ်။',
              'note': 'Leave ၏ V2 မှာ Left ဖြစ်သည်။',
            },
            {
              's': 'We',
              'v': 'did not find',
              'rest': 'the keys.',
              'mm': 'သော့တွေကို ကျွန်တော်တို့ မတွေ့ခဲ့ဘူး။',
              'note': 'အငြင်းဝါကျတွင် did not + V1 သုံးရသည်။',
            },
            {
              's': 'Did you',
              'v': 'eat',
              'rest': 'dinner already?',
              'mm': 'မင်း ညစာ စားပြီးပြီလား။',
              'note': 'အမေးဝါကျတွင် Did + Subject + V1 သုံးရသည်။',
            },
            {
              's': 'I',
              'v': 'was',
              'rest': 'at home all day.',
              'mm': 'တစ်နေကုန် အိမ်မှာပဲ ရှိနေခဲ့တယ်။',
              'note': 'Be verb ၏ အတိတ်ကိန်း Was/Were။',
            },
            {
              's': 'The light',
              'v': 'went out',
              'rest': 'suddenly.',
              'mm': 'မီးက ရုတ်တရက် ပျက်သွားခဲ့တယ်။',
              'note': 'ရုတ်တရက် ဖြစ်ရပ်။',
            },
          ],
        },
        {
          'title': 'Past Continuous (အတိတ်ကာလဖြစ်ဆဲ)',
          'formula': 'Subject + was/were + V-ing',
          'usage':
              'အတိတ်ကာလ တစ်ချိန်ချိန်တွင် လုပ်ဆောင်နေခဲ့သည့် အရာကို ဖော်ပြသည်။ အခြားအဖြစ်အပျက်တစ်ခု ဝင်မလာခင် ဖြစ်ပျက်နေသည့် အခြေအနေအတွက် သုံးသည်။',
          'examples': [
            {
              's': 'I',
              'v': 'was sleeping',
              'rest': 'at 10 PM last night.',
              'mm': 'မနေ့ည ၁၀ နာရီမှာ ကျွန်တော် အိပ်နေခဲ့တာပါ။',
              'note': 'အတိတ်က အချိန်တစ်ခုမှာ ဖြစ်ပျက်နေသည့် အခြေအနေ။',
            },
            {
              's': 'They',
              'v': 'were playing',
              'rest': 'cards when the lights went out.',
              'mm': 'မီးပျက်သွားတဲ့အချိန်မှာ သူတို့ ဖဲကစားနေခဲ့ကြတာ။',
              'note':
                  'မီးပျက်ခြင်း (Simple Past) က ကစားနေခြင်းကို ကြားဖြတ်နှောင့်ယှက်လိုက်ခြင်း။',
            },
            {
              's': 'She',
              'v': 'was cooking',
              'rest': 'while I was cleaning.',
              'mm': 'ကျွန်တော် သန့်ရှင်းရေးလုပ်နေတုန်း သူက ဟင်းချက်နေခဲ့တယ်။',
              'note': 'အတိတ်တွင် တစ်ပြိုင်တည်း ဖြစ်နေသော အလုပ်နှစ်ခု။',
            },
            {
              's': 'It',
              'v': 'was raining',
              'rest': 'hard when we left.',
              'mm': 'ကျွန်တော်တို့ ထွက်လာတော့ မိုးက အရမ်းရွာနေခဲ့တယ်။',
              'note': 'နောက်ခံ အခြေအနေ။',
            },
            {
              's': 'The birds',
              'v': 'were singing',
              'rest': 'this morning.',
              'mm': 'ဒီမနက်မှာ ငှက်လေးတွေ တေးဆိုနေခဲ့ကြတယ်။',
              'note': 'Plural Subject ဖြစ်၍ Were သုံးသည်။',
            },
            {
              's': 'I',
              'v': 'was not paying',
              'rest': 'attention during the class.',
              'mm': 'အတန်းတက်နေတုန်းက ကျွန်တော် အာရုံမစိုက်မိခဲ့ဘူး။',
              'note': 'Negative form.',
            },
            {
              's': 'What',
              'v': 'were you doing',
              'rest': 'at 5 o’clock?',
              'mm': '၅ နာရီတုန်းက မင်း ဘာလုပ်နေတာလဲ။',
              'note': 'Past Continuous Question.',
            },
            {
              's': 'He',
              'v': 'was always smoking',
              'rest': 'in those days.',
              'mm': 'အဲဒီတုန်းက သူက အမြဲတမ်း ဆေးလိပ်သောက်နေတတ်တယ်။',
              'note': 'အတိတ်က စိတ်ပျက်စရာ အလေ့အထ။',
            },
            {
              's': 'We',
              'v': 'were walking',
              'rest': 'in the park when it started to rain.',
              'mm':
                  'မိုးစရွာတော့ ကျွန်တော်တို့ ပန်းခြံထဲမှာ လမ်းလျှောက်နေခဲ့တာ။',
              'note': 'Interrupted action.',
            },
            {
              's': 'I',
              'v': 'was wondering',
              'rest': 'if you could help me.',
              'mm': 'မင်း ငါ့ကို ကူညီနိုင်မလားလို့ စဉ်းစားနေခဲ့တာပါ။',
              'note': 'ယဉ်ကျေးစွာ တောင်းဆိုခြင်း။',
            },
            {
              's': 'The wind',
              'v': 'was blowing',
              'rest': 'fiercely.',
              'mm': 'လေက ပြင်းပြင်းထန်ထန် တိုက်ခတ်နေခဲ့တယ်။',
              'note': 'Atmospheric description.',
            },
            {
              's': 'She',
              'v': 'was talking',
              'rest': 'on the phone for hours.',
              'mm': 'သူမ ဖုန်းပြောနေခဲ့တာ နာရီပေါင်းများစွာ ကြာတယ်။',
              'note': 'Action in progress.',
            },
            {
              's': 'They',
              'v': 'were waiting',
              'rest': 'for the bus.',
              'mm': 'သူတို့ ကားစောင့်နေခဲ့ကြတယ်။',
              'note': 'Temporary past action.',
            },
            {
              's': 'The sun',
              'v': 'was setting',
              'rest': 'behind the mountains.',
              'mm': 'နေက တောင်တန်းတွေနောက်မှာ ဝင်နေခဲ့ပြီ။',
              'note': 'Narrative style.',
            },
            {
              's': 'I',
              'v': 'was having',
              'rest': 'a beautiful dream.',
              'mm': 'ကျွန်တော် အိပ်မက်လှလှလေးတစ်ခု မက်နေခဲ့တယ်။',
              'note': 'Ongoing past experience.',
            },
          ],
        },
        {
          'title': 'Past Perfect (အတိတ်ကာလပြီးစီး)',
          'formula': 'Subject + had + V3',
          'usage':
              'အတိတ်ကာလ အဖြစ်အပျက် နှစ်ခုအနက် ပထမဦးဆုံး အရင်ပြီးစီးသွားသော အရာကို ဖော်ပြသည်။',
          'examples': [
            {
              's': 'The train',
              'v': 'had left',
              'rest': 'when I reached the station.',
              'mm':
                  'ကျွန်တော် ဘူတာရုံကို ရောက်တဲ့အချိန်မှာ ရထားက ထွက်သွားနှင့်ပြီ။',
              'note': 'ရထားထွက်ခြင်းက အရင်ဖြစ်၍ Had Left သုံးသည်။',
            },
            {
              's': 'I',
              'v': 'had already eaten',
              'rest': 'breakfast before he arrived.',
              'mm': 'သူမလာခင်ကတည်းက ကျွန်တော် မနက်စာ စားပြီးနှင့်ပြီ။',
              'note': 'Actions in sequence.',
            },
            {
              's': 'She',
              'v': 'had lost',
              'rest': 'her phone before she got home.',
              'mm': 'အိမ်မရောက်ခင်ကတည်းက သူမ ဖုန်းပျောက်ခဲ့တာ။',
              'note': 'Had + V3.',
            },
            {
              's': 'They',
              'v': 'had lived',
              'rest': 'there for years before moving.',
              'mm':
                  'မပြောင်းခင်က သူတို့ အဲဒီမှာ နှစ်ပေါင်းများစွာ နေခဲ့ဖူးတယ်။',
              'note': 'Duration before a past time.',
            },
            {
              's': 'I',
              'v': 'had not seen',
              'rest': 'him for a long time.',
              'mm': 'သူ့ကို မတွေ့ရတာ ကြာပြီ။',
              'note': 'Negative Past Perfect.',
            },
            {
              's': 'By the time the police arrived, the thief',
              'v': 'had escaped',
              'rest': '.',
              'mm': 'ရဲတွေရောက်လာတဲ့အချိန်မှာ သူခိုးက လွတ်မြောက်သွားနှင့်ပြီ။',
              'note': 'Common exam structure.',
            },
            {
              's': 'He told me that he',
              'v': 'had finished',
              'rest': 'the work.',
              'mm': 'သူ အလုပ်ပြီးသွားပြီလို့ ကျွန်တော့်ကို ပြောခဲ့တယ်။',
              'note': 'Reported speech တွင် သုံးသည်။',
            },
            {
              's': 'The film',
              'v': 'had started',
              'rest': 'when we got to the cinema.',
              'mm': 'ရုပ်ရှင်ရုံရောက်တော့ ရုပ်ရှင်က စနှင့်နေပြီ။',
              'note': 'Sequence of events.',
            },
            {
              's': 'I',
              'v': 'had visited',
              'rest': 'London once before.',
              'mm': 'အရင်က လန်ဒန်ကို တစ်ခါ ရောက်ဖူးခဲ့တယ်။',
              'note': 'Past experience before a past date.',
            },
            {
              's': 'She realised she',
              'v': 'had made',
              'rest': 'a mistake.',
              'mm': 'သူမ အမှားတစ်ခု လုပ်ခဲ့မိမှန်း သိသွားခဲ့တယ်။',
              'note': 'Discovery of past action.',
            },
            {
              's': 'If I',
              'v': 'had known',
              'rest': ', I would have helped.',
              'mm': 'သာလျှင် ကျွန်တော် သိခဲ့မယ်ဆိုရင် ကူညီမိမှာပါ။',
              'note': '3rd Conditional တွင် သုံးသည်။',
            },
            {
              's': 'The grass was yellow because it',
              'v': 'had not rained',
              'rest': 'all summer.',
              'mm': 'နွေရာသီပတ်လုံး မိုးမရွာခဲ့လို့ မြက်တွေ ဝါနေခဲ့တာ။',
              'note': 'Reasoning for past state.',
            },
            {
              's': 'We',
              'v': 'had prepared',
              'rest': 'everything for the party.',
              'mm':
                  'ပါတီအတွက် အရာအားလုံးကို ကျွန်တော်တို့ ပြင်ဆင်ပြီးခဲ့ကြတယ်။',
              'note': 'Prior preparation.',
            },
            {
              's': 'He',
              'v': 'had never flown',
              'rest': 'in a plane before.',
              'mm': 'သူ တစ်ခါမှ လေယာဉ်မစီးဖူးခဲ့ဘူး။',
              'note': 'Past "never".',
            },
            {
              's': 'The house was quiet because everyone',
              'v': 'had gone',
              'rest': 'out.',
              'mm': 'အားလုံး အပြင်ထွက်သွားကြလို့ အိမ်က တိတ်ဆိတ်နေခဲ့တယ်။',
              'note': 'Completed state.',
            },
          ],
        },
        {
          'title': 'Past Perfect Continuous (အတိတ်ကာလပြီးစီးဖြစ်ဆဲ)',
          'formula': 'Subject + had + been + V-ing',
          'usage':
              'အတိတ်တွင် အဖြစ်အပျက်တစ်ခု မတိုင်ခင်အထိ တောက်လျှောက် (မရပ်မနား) လုပ်ဆောင်နေခဲ့သော ကြာချိန်ကို ဖော်ပြသည်။',
          'examples': [
            {
              's': 'I',
              'v': 'had been waiting',
              'rest': 'for an hour before the bus came.',
              'mm':
                  'ကားမလာခင်ကတည်းက ကျွန်တော် တစ်နာရီကြာအောင် စောင့်နေခဲ့တာပါ။',
              'note': 'စောင့်နေသည့် ကြာချိန်ကို အလေးပေးသည်။',
            },
            {
              's': 'She',
              'v': 'had been crying',
              'rest': 'so her eyes were red.',
              'mm': 'သူမ ငိုနေခဲ့လို့ မျက်လုံးတွေ နီနေခဲ့တာ။',
              'note': 'အတိတ်ကာလ မျက်မြင်သက်သေ အကျိုးဆက်။',
            },
            {
              's': 'They',
              'v': 'had been playing',
              'rest': 'football for two hours before it rained.',
              'mm': 'မိုးမရွာခင် သူတို့ ဘောလုံးကစားနေတာ နှစ်နာရီရှိပြီ။',
              'note': 'Duration before interruption.',
            },
            {
              's': 'He',
              'v': 'had been working',
              'rest': 'all day, so he was tired.',
              'mm': 'တစ်နေကုန် အလုပ်လုပ်နေခဲ့လို့ သူ အရမ်းပင်ပန်းနေခဲ့တယ်။',
              'note': 'Cause and effect in the past.',
            },
            {
              's': 'I',
              'v': 'had been living',
              'rest': 'in Mandalay since I was born.',
              'mm': 'မွေးကတည်းက မန္တလေးမှာ နေထိုင်လာခဲ့တာပါ။',
              'note': 'Long-term past continuity.',
            },
            {
              's': 'The engine',
              'v': 'had been making',
              'rest': 'a strange noise for weeks.',
              'mm': 'အင်ဂျင်က ထူးဆန်းတဲ့ အသံတွေ ထွက်နေတာ ရက်သတ္တပတ်တွေ ကြာပြီ။',
              'note': 'Persistence of an action.',
            },
            {
              's': 'She',
              'v': 'had been studying',
              'rest': 'hard, so she passed the exam.',
              'mm':
                  'သူမ စာတွေ တောက်လျှောက် ကြိုးစားခဲ့လို့ စာမေးပွဲ အောင်ခဲ့တာ။',
              'note': 'Emphasis on the effort.',
            },
            {
              's': 'We',
              'v': 'had been looking',
              'rest': 'for the dog for three hours.',
              'mm': 'ခွေးလေးကို ရှာနေတာ သုံးနာရီရှိပြီ။',
              'note': 'Ongoing search in the past.',
            },
            {
              's': 'It',
              'v': 'had been snowing',
              'rest': 'before we woke up.',
              'mm': 'ကျွန်တော်တို့ မနိုးခင်ကတည်းက နှင်းတွေ ကျနေခဲ့တာ။',
              'note': 'Continuous before a past moment.',
            },
            {
              's': 'How long had you',
              'v': 'been learning',
              'rest': 'English before you moved?',
              'mm': 'မပြောင်းခင်က မင်း အင်္ဂလိပ်စာ သင်နေတာ ဘယ်လောက်ကြာပြီလဲ။',
              'note': 'Past duration question.',
            },
            {
              's': 'He',
              'v': 'had been smoking',
              'rest': 'for years before he quit.',
              'mm':
                  'မဖြတ်ခင်အထိ သူ ဆေးလိပ်သောက်ခဲ့တာ နှစ်ပေါင်းများစွာ ကြာပြီ။',
              'note': 'Action reaching a terminal point.',
            },
            {
              's': 'The child',
              'v': 'had been dreaming',
              'rest': 'when his mother woke him.',
              'mm':
                  'အမေဖြစ်သူ နိုးလိုက်တဲ့အချိန်မှာ ကလေးလေး အိပ်မက်မက်နေခဲ့တာ။',
              'note': 'Progressive action in the past.',
            },
            {
              's': 'I',
              'v': 'had been wanting',
              'rest': 'to buy that car for a long time.',
              'mm': 'အဲဒီကားကို ဝယ်ချင်နေတာ တော်တော်ကြာပြီ။',
              'note': 'State of wanting in the past.',
            },
            {
              's': 'They',
              'v': 'had been arguing',
              'rest': 'for hours.',
              'mm': 'သူတို့ ငြင်းခုန်နေခဲ့တာ နာရီပေါင်းများစွာ ကြာတယ်။',
              'note': 'Heavy emphasis on the "length" of time.',
            },
            {
              's': 'The ground was wet because it',
              'v': 'had been raining',
              'rest': '.',
              'mm': 'မြေကြီးတွေ စိုနေတာ မိုးရွာနေခဲ့လို့ပါ။',
              'note': 'Visible evidence in the past.',
            },
          ],
        },
      ],
    },
    {
      'group': 'Future Tenses (အနာဂတ်ကာလ)',
      'items': [
        {
          'title': 'Simple Future (အနာဂတ်ကာလရိုးရိုး)',
          'formula': 'Subject + will + V1',
          'usage':
              'နောင်တွင် ဖြစ်ပျက်လာမည့် အရာများ၊ ကတိပေးခြင်း၊ ဆုံးဖြတ်ချက်ချခြင်းနှင့် ခန့်မှန်းချက်များအတွက် သုံးသည်။',
          'examples': [
            {
              's': 'I',
              'v': 'will call',
              'rest': 'you as soon as I arrive.',
              'mm': 'ကျွန်တော်ရောက်တာနဲ့ မင်းကို ဖုန်းဆက်ပါ့မယ်။',
              'note': 'Promise (ကတိပေးခြင်း)။',
            },
            {
              's': 'It',
              'v': 'will rain',
              'rest': 'tomorrow, I think.',
              'mm': 'မနက်ဖြန် မိုးရွာလိမ့်မယ်လို့ ထင်တယ်။',
              'note': 'Prediction (ခန့်မှန်းချက်)။',
            },
            {
              's': 'The shop',
              'v': 'will open',
              'rest': 'at 9 AM.',
              'mm': 'ဆိုင်က မနက် ၉ နာရီမှာ ဖွင့်လိမ့်မယ်။',
              'note': 'Future fact.',
            },
            {
              's': 'I',
              'v': 'will help',
              'rest': 'you with those bags.',
              'mm': 'အဲဒီအိတ်တွေ သယ်ဖို့ ကျွန်တော် ကူညီပါ့မယ်။',
              'note': 'Spontaneous offer (ကူညီရန် ကမ်းလှမ်းခြင်း)။',
            },
            {
              's': 'They',
              'v': 'will not attend',
              'rest': 'the meeting.',
              'mm': 'သူတို့ အစည်းအဝေးကို တက်ရောက်မှာ မဟုတ်ဘူး။',
              'note': 'Negative: will not (won\'t) + V1.',
            },
            {
              's': 'Will you',
              'v': 'marry',
              'rest': 'me?',
              'mm': 'ငါ့ကို လက်ထပ်မလား။',
              'note': 'Simple Future Question.',
            },
            {
              's': 'I',
              'v': 'will be',
              'rest': 'twenty years old next year.',
              'mm': 'လာမယ့်နှစ်မှာ ကျွန်တော် အသက် ၂၀ ပြည့်မယ်။',
              'note': 'Future state.',
            },
            {
              's': 'The price of petrol',
              'v': 'will rise',
              'rest': 'again.',
              'mm': 'ဓာတ်ဆီဈေး ပြန်တက်လိမ့်မယ်။',
              'note': 'General prediction.',
            },
            {
              's': 'Wait, I',
              'v': 'will get',
              'rest': 'the door.',
              'mm': 'နေဦး၊ တံခါး ကျွန်တော် သွားဖွင့်လိုက်မယ်။',
              'note': 'Instant decision.',
            },
            {
              's': 'She',
              'v': 'will probably pass',
              'rest': 'the exam.',
              'mm': 'သူမ စာမေးပွဲ အောင်နိုင်ခြေ များပါတယ်။',
              'note': 'Probability.',
            },
            {
              's': 'I',
              'v': 'will never forget',
              'rest': 'your kindness.',
              'mm': 'မင်းရဲ့ ကျေးဇူးကို ဘယ်တော့မှ မေ့မှာ မဟုတ်ပါဘူး။',
              'note': 'Strong promise.',
            },
            {
              's': 'The world',
              'v': 'will change',
              'rest': 'a lot in ten years.',
              'mm': 'နောက် ၁၀ နှစ်မှာ ကမ္ဘာကြီး အများကြီး ပြောင်းလဲလိမ့်မယ်။',
              'note': 'Long-term prediction.',
            },
            {
              's': 'We',
              'v': 'will see',
              'rest': 'what happens.',
              'mm': 'ဘာဖြစ်မလဲဆိုတာ စောင့်ကြည့်ကြတာပေါ့။',
              'note': 'Common expression.',
            },
            {
              's': 'I',
              'v': 'will pay',
              'rest': 'you back next week.',
              'mm': 'နောက်အပတ်မှာ မင်းကို ပိုက်ဆံပြန်ဆပ်ပါ့မယ်။',
              'note': 'Commitment.',
            },
            {
              's': 'He',
              'v': 'will find',
              'rest': 'a new job soon.',
              'mm': 'သူ မကြာခင် အလုပ်အသစ် ရပါလိမ့်မယ်။',
              'note': 'Optimistic prediction.',
            },
          ],
        },
        {
          'title': 'Future Continuous (အနာဂတ်ကာလဖြစ်ဆဲ)',
          'formula': 'Subject + will be + V-ing',
          'usage':
              'အနာဂတ်ကာလ တစ်ချိန်ချိန်တွင် လုပ်ဆောင်နေလိမ့်မည့် အရာများကို ဖော်ပြသည်။ ကြိုတင်စီစဉ်ထားသော အရာများအတွက်လည်း သုံးသည်။',
          'examples': [
            {
              's': 'This time tomorrow, I',
              'v': 'will be flying',
              'rest': 'to Tokyo.',
              'mm':
                  'မနက်ဖြန် ဒီအချိန်မှာ ကျွန်တော် တိုကျိုကို ပျံသန်းနေလိမ့်မယ်။',
              'note': 'အနာဂတ် အချိန်အတိအကျတွင် ဖြစ်ပျက်နေမည့်အရာ။',
            },
            {
              's': 'They',
              'v': 'will be having',
              'rest': 'dinner at 8 PM.',
              'mm': 'ည ၈ နာရီမှာ သူတို့ ထမင်းစားနေကြလိမ့်မယ်။',
              'note': 'Action in progress.',
            },
            {
              's': 'I',
              'v': 'will be waiting',
              'rest': 'for you at the station.',
              'mm': 'ဘူတာရုံမှာ မင်းကို စောင့်နေပါ့မယ်။',
              'note': 'Planned action.',
            },
            {
              's': 'She',
              'v': 'will be working',
              'rest': 'late tonight.',
              'mm': 'သူမ ဒီည အလုပ်တွေ နောက်ကျထိ လုပ်နေလိမ့်မယ်။',
              'note': 'Extended action.',
            },
            {
              's': 'Will you',
              'v': 'be using',
              'rest': 'your car tomorrow?',
              'mm': 'မနက်ဖြန် မင်းကားကို သုံးဖို့ ရှိသလား။',
              'note': 'Polite inquiry about plans.',
            },
            {
              's': 'In 2030, people',
              'v': 'will be driving',
              'rest': 'flying cars.',
              'mm': '၂၀၃၀ မှာ လူတွေက ပျံလွှားတဲ့ကားတွေ မောင်းနေကြလိမ့်မယ်။',
              'note': 'Vision of the future.',
            },
            {
              's': 'I',
              'v': 'will be sleeping',
              'rest': 'when you get home.',
              'mm': 'မင်းအိမ်ပြန်ရောက်တဲ့အချိန်မှာ ငါအိပ်နေလိမ့်မယ်။',
              'note': 'Overlap of actions.',
            },
            {
              's': 'The team',
              'v': 'will be practicing',
              'rest': 'all morning.',
              'mm': 'အဖွဲ့က တစ်မနက်လုံး လေ့ကျင့်နေလိမ့်မယ်။',
              'note': 'Continuous duration.',
            },
            {
              's': 'He',
              'v': 'will be living',
              'rest': 'in Paris next month.',
              'mm': 'နောက်လမှာ သူ ပဲရစ်မှာ နေထိုင်နေလိမ့်မယ်။',
              'note': 'Temporary state.',
            },
            {
              's': 'We',
              'v': 'will be celebrating',
              'rest': 'our anniversary soon.',
              'mm':
                  'မကြာခင်မှာ ကျွန်တော်တို့ နှစ်ပတ်လည်ကို ဆင်နွှဲနေကြတော့မယ်။',
              'note': 'Upcoming event.',
            },
            {
              's': 'Don\'t call her now; she',
              'v': 'will be bathing',
              'rest': 'the baby.',
              'mm': 'သူ့ကို အခုဖုန်းမဆက်နဲ့ဦး၊ သူကလေးကို ရေချိုးပေးနေလိမ့်မယ်။',
              'note': 'Logical deduction.',
            },
            {
              's': 'I',
              'v': 'will not be attending',
              'rest': 'the concert.',
              'mm': 'ကျွန်တော် ဖျော်ဖြေပွဲကို တက်ဖြစ်မှာ မဟုတ်ဘူး။',
              'note': 'Negative form.',
            },
            {
              's': 'The band',
              'v': 'will be performing',
              'rest': 'live.',
              'mm': 'တီးဝိုင်းက တိုက်ရိုက်ဖျော်ဖြေနေလိမ့်မယ်။',
              'note': 'Professional schedule.',
            },
            {
              's': 'What',
              'v': 'will you be doing',
              'rest': 'this weekend?',
              'mm': 'ဒီပိတ်ရက်မှာ မင်းဘာလုပ်နေမလဲ။',
              'note': 'Common social question.',
            },
            {
              's': 'The stars',
              'v': 'will be shining',
              'rest': 'brightly tonight.',
              'mm': 'ဒီည ကြယ်လေးတွေ လင်းလက်နေလိမ့်မယ်။',
              'note': 'Atmospheric prediction.',
            },
          ],
        },
        {
          'title': 'Future Perfect (အနာဂတ်ကာလပြီးစီး)',
          'formula': 'Subject + will have + V3',
          'usage':
              'အနာဂတ်ကာလ အချိန်တစ်ခုသို့ မရောက်မီ ပြီးစီးသွားလိမ့်မည့် အရာများကို ဖော်ပြသည်။',
          'examples': [
            {
              's': 'I',
              'v': 'will have finished',
              'rest': 'my report by 5 PM.',
              'mm': 'ညနေ ၅ နာရီမှာ ကျွန်တော် အစီရင်ခံစာ ရေးပြီးလိမ့်မယ်။',
              'note': 'Deadline (အချိန်ကန့်သတ်ချက်) ကို ပြသည်။',
            },
            {
              's': 'By next year, they',
              'v': 'will have built',
              'rest': 'the bridge.',
              'mm': 'လာမယ့်နှစ်မှာ သူတို့ တံတားကို တည်ဆောက်ပြီးလိမ့်မယ်။',
              'note': 'Project completion.',
            },
            {
              's': 'She',
              'v': 'will have graduated',
              'rest': 'by June.',
              'mm': 'ဇွန်လရောက်ရင် သူမ ဘွဲ့ရပြီးလိမ့်မယ်။',
              'note': 'Future milestone.',
            },
            {
              's': 'We',
              'v': 'will have lived',
              'rest': 'here for a decade by July.',
              'mm':
                  'ဇူလိုင်လဆိုရင် ကျွန်တော်တို့ ဒီမှာနေတာ ၁၀ နှစ်ပြည့်လိမ့်မယ်။',
              'note': 'Future duration.',
            },
            {
              's': 'I',
              'v': 'will have saved',
              'rest': 'enough money by then.',
              'mm':
                  'အဲဒီအချိန်ရောက်ရင် ကျွန်တော် ပိုက်ဆံလုံလောက်အောင် စုမိလိမ့်မယ်။',
              'note': 'Financial goal.',
            },
            {
              's': 'The film',
              'v': 'will have started',
              'rest': 'before we reach.',
              'mm': 'ကျွန်တော်တို့မရောက်ခင် ရုပ်ရှင်က စနှင့်လိမ့်မယ်။',
              'note': 'Future sequence.',
            },
            {
              's': 'He',
              'v': 'will have repaired',
              'rest': 'your laptop by Monday.',
              'mm':
                  'တနင်္လာနေ့ရောက်ရင် သူ မင်းရဲ့ လက်ပ်တော့ကို ပြင်ပြီးလိမ့်မယ်။',
              'note': 'Promise of completion.',
            },
            {
              's': 'Will you',
              'v': 'have cooked',
              'rest': 'dinner when I come?',
              'mm': 'ငါပြန်လာတဲ့အချိန်မှာ မင်း ထမင်းချက်ပြီးပြီလား။',
              'note': 'Future Perfect Question.',
            },
            {
              's': 'By 2050, doctors',
              'v': 'will have found',
              'rest': 'a cure for cancer.',
              'mm':
                  '၂၀၅၀ ရောက်ရင် ဆရာဝန်တွေ ကင်ဆာပျောက်ဆေး ရှာတွေ့ပြီးလိမ့်မယ်။',
              'note': 'Advanced prediction.',
            },
            {
              's': 'They',
              'v': 'will have left',
              'rest': 'by the time you arrive.',
              'mm': 'မင်းရောက်တဲ့အချိန်မှာ သူတို့ ထွက်သွားကြပြီးလိမ့်မယ်။',
              'note': 'Common "by the time" structure.',
            },
            {
              's': 'I',
              'v': 'will not have received',
              'rest': 'the package by then.',
              'mm': 'အဲဒီအချိန်ထိ ကျွန်တော် ပါဆယ်ထုတ် ရဦးမှာ မဟုတ်ဘူး။',
              'note': 'Negative deadline.',
            },
            {
              's': 'She',
              'v': 'will have cleaned',
              'rest': 'the whole house.',
              'mm': 'သူမ အိမ်တစ်အိမ်လုံးကို သန့်ရှင်းရေး လုပ်ပြီးလိမ့်မယ်။',
              'note': 'Completed effort.',
            },
            {
              's': 'The flowers',
              'v': 'will have bloomed',
              'rest': 'by spring.',
              'mm': 'နွေဦးရောက်ရင် ပန်းလေးတွေ ပွင့်ပြီးလိမ့်မယ်။',
              'note': 'Natural cycle.',
            },
            {
              's': 'We',
              'v': 'will have traveled',
              'rest': 'to five countries by 2027.',
              'mm':
                  '၂၀၂၇ ရောက်ရင် ကျွန်တော်တို့ နိုင်ငံ ၅ နိုင်ငံကို လည်ပတ်ပြီးလိမ့်မယ်။',
              'note': 'Travel achievement.',
            },
            {
              's': 'You',
              'v': 'will have learned',
              'rest': 'all tenses by the end of this.',
              'mm':
                  'ဒါပြီးဆုံးသွားတဲ့အခါ မင်း Tense အားလုံးကို သင်ယူပြီးလိမ့်မယ်။',
              'note': 'Encouragement!',
            },
          ],
        },
        {
          'title': 'Future Perfect Continuous (အနာဂတ်ကာလပြီးစီးဖြစ်ဆဲ)',
          'formula': 'Subject + will have been + V-ing',
          'usage':
              'အနာဂတ်ကာလတစ်ခုသို့ရောက်လျှင် အချိန်မည်မျှကြာအောင် (တောက်လျှောက်) လုပ်ဆောင်နေခဲ့ပြီးဖြစ်ကြောင်း ဖော်ပြသည်။',
          'examples': [
            {
              's': 'Next month, I',
              'v': 'will have been working',
              'rest': 'here for a year.',
              'mm':
                  'နောက်လဆိုရင် ကျွန်တော် ဒီမှာ အလုပ်လုပ်နေတာ တစ်နှစ်ပြည့်လိမ့်မယ်။',
              'note': 'အနာဂတ်ကာလ ကြာချိန် (Duration) ကို အလေးပေးသည်။',
            },
            {
              's': 'By midnight, she',
              'v': 'will have been dancing',
              'rest': 'for five hours.',
              'mm': 'သန်းခေါင်ယံမှာ သူမ ကနေတာ ၅ နာရီရှိပြီ ဖြစ်လိမ့်မယ်။',
              'note': 'Extreme duration.',
            },
            {
              's': 'They',
              'v': 'will have been living',
              'rest': 'in London for ten years by 2025.',
              'mm': '၂၀၂၅ ရောက်ရင် သူတို့ လန်ဒန်မှာ နေတာ ၁၀ နှစ်ရှိလိမ့်မယ်။',
              'note': 'Future residency duration.',
            },
            {
              's': 'By 5 PM, we',
              'v': 'will have been waiting',
              'rest': 'for six hours!',
              'mm':
                  'ညနေ ၅ နာရီဆိုရင် ကျွန်တော်တို့ စောင့်နေတာ ၆ နာရီတောင် ရှိပြီ။',
              'note': 'Emphasis on patience/fatigue.',
            },
            {
              's': 'He',
              'v': 'will have been studying',
              'rest': 'for three hours when the break starts.',
              'mm': 'နားချိန်မစခင် သူ စာဖတ်နေတာ ၃ နာရီ ရှိနေလိမ့်မယ်။',
              'note': 'Academic focus.',
            },
            {
              's': 'How long will you',
              'v': 'have been driving',
              'rest': 'by the time we arrive?',
              'mm':
                  'ငါတို့ရောက်တဲ့အချိန်မှာ မင်း ကားမောင်းနေတာ ဘယ်လောက်ကြာပြီလဲ။',
              'note': 'Duration question.',
            },
            {
              's': 'She',
              'v': 'has been sleeping',
              'rest': 'for twelve hours by morning.',
              'mm': 'မနက်ရောက်ရင် သူမ အိပ်နေတာ ၁၂ နာရီ ရှိလိမ့်မယ်။',
              'note': 'Natural duration.',
            },
            {
              's': 'I',
              'v': 'will have been teaching',
              'rest': 'for twenty years next June.',
              'mm':
                  'လာမယ့် ဇွန်လမှာ ကျွန်တော် စာသင်လာတာ နှစ် ၂၀ ပြည့်လိမ့်မယ်။',
              'note': 'Career milestone.',
            },
            {
              's': 'By the end of the year, he',
              'v': 'will have been training',
              'rest': 'for the marathon.',
              'mm': 'နှစ်ကုန်ရင် သူ မာရသွန်အတွက် လေ့ကျင့်နေတာ တော်တော်ကြာပြီ။',
              'note': 'Goal focus.',
            },
            {
              's': 'We',
              'v': 'will have been playing',
              'rest': 'online games all night.',
              'mm': 'ကျွန်တော်တို့ တစ်ညလုံး ဂိမ်းဆော့နေခဲ့တာ ဖြစ်လိမ့်မယ်။',
              'note': 'Continuous activity.',
            },
            {
              's': 'The engine',
              'v': 'will have been running',
              'rest': 'continuously for a week.',
              'mm':
                  'အင်ဂျင်က တစ်ပတ်လုံး တောက်လျှောက် လည်ပတ်နေခဲ့တာ ဖြစ်လိမ့်မယ်။',
              'note': 'Technical durability.',
            },
            {
              's': 'I',
              'v': 'will not have been staying',
              'rest': 'there for long.',
              'mm': 'ကျွန်တော် အဲဒီမှာ ကြာကြာ နေခဲ့တာမျိုး မဟုတ်ပါဘူး။',
              'note': 'Negative duration.',
            },
            {
              's': 'By 2 PM, I',
              'v': 'will have been writing',
              'rest': 'for four hours.',
              'mm': 'နေ့လယ် ၂ နာရီမှာ ကျွန်တော် စာရေးနေတာ ၄ နာရီရှိပြီ။',
              'note': 'Work progress.',
            },
            {
              's': 'They',
              'v': 'will have been traveling',
              'rest': 'for twenty-four hours straight.',
              'mm': 'သူတို့ တောက်လျှောက် ခရီးသွားနေတာ ၂၄ နာရီ ရှိလိမ့်မယ်။',
              'note': 'Physical exhaustion.',
            },
            {
              's': 'You',
              'v': 'will have been improving',
              'rest': 'your English every day.',
              'mm':
                  'မင်း နေ့တိုင်း အင်္ဂလိပ်စာကို တိုးတက်အောင် လုပ်နေခဲ့တာ ဖြစ်လိမ့်မယ်။',
              'note': 'Positive outlook!',
            },
          ],
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All 12 Tenses')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        heroTag: "tenseTableBtn",
        tooltip: "Open Tense Table",
        icon: const Icon(Icons.table_chart),
        label: const Text("Tense Table"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => TenseMatrixScreen()),
          );
        },
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: MediaQuery.sizeOf(context).width * 0.05,
        ),
        itemCount: tensesData.length,
        itemBuilder: (context, index) {
          final group = tensesData[index];
          return ExpansionTile(
            backgroundColor: Theme.of(context).colorScheme.surface,
            shape: Border.all(width: 0.1, color: Colors.grey),
            initiallyExpanded: index == 0,
            title: Text(
              group['group'],
              style: Theme.of(context).textTheme.titleMedium,
            ),
            children: (group['items'] as List)
                .map(
                  (tense) => ListTile(
                    title: Text(tense['title']),
                    subtitle: Text(tense['formula']),
                    titleTextStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                    subtitleTextStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                    trailing: const Icon(Icons.arrow_right),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TenseDetailScreen(tense: tense),
                      ),
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}

class TenseDetailScreen extends StatelessWidget {
  final Map<String, dynamic> tense;

  const TenseDetailScreen({super.key, required this.tense});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tense['title'])),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: MediaQuery.sizeOf(context).width * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Formula Section
            Text(
              "Structure / Formula",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Theme.of(
                  context,
                ).colorScheme.onPrimaryContainer.withAlpha(25),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                tense['formula'],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),

            const SizedBox(height: 20),
            Text(
              "Usage (အသုံးပြုပုံ)",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(tense['usage'], style: const TextStyle(fontSize: 16)),

            const Divider(height: 40),
            Text("Examples", style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 10),

            // Inside your TenseDetailScreen loop:
            ...(tense['examples'] as List).map((ex) {
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(fontSize: 17),
                          children: [
                            TextSpan(
                              text: ex['s'] + " ",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo,
                              ),
                            ),
                            TextSpan(
                              text: ex['v'] + " ",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            TextSpan(
                              text: ex['rest'],
                              style: TextStyle(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onPrimaryContainer,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        ex['mm'],
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      if (ex.containsKey('note')) ...[
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            // color: Colors.green.shade50,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            "💡 Tip: ${ex['note']}",
                            style: const TextStyle(
                              fontSize: 12,
                              // color: Colors.brown,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
