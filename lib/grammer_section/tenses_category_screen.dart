import 'package:flutter/material.dart';

import 'tense_matrix_data.dart';
import 'tense_quiz_lesson_page.dart';

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
          'quizzes': [
            // Declarative (Statements)
            {
              'q': 'She ___ (work) at a hospital.',
              'a': 'works',
              'options': ['work', 'works', 'working'],
              'type': 'Declarative',
              'mm': 'သူမ ဆေးရုံမှာ အလုပ်လုပ်တယ်။',
            },
            {
              'q': 'The sun ___ (rise) in the east.',
              'a': 'rises',
              'options': ['rise', 'rises', 'rising'],
              'type': 'Declarative',
              'mm': 'နေသည် အရှေ့ဘက်မှ ထွက်သည်။',
            },
            {
              'q': 'Cats ___ (hate) water.',
              'a': 'hate',
              'options': ['hates', 'hate', 'hating'],
              'type': 'Declarative',
              'mm': 'ကြောင်များသည် ရေကို မုန်းကြသည်။',
            },
            {
              'q': 'Water ___ (freeze) at 0°C.',
              'a': 'freezes',
              'options': ['freeze', 'freezes', 'frozen'],
              'type': 'Declarative',
              'mm': 'ရေသည် ၀ ဒီဂရီတွင် ခဲသည်။',
            },
            {
              'q': 'I ___ (play) football on Sundays.',
              'a': 'play',
              'options': ['play', 'plays', 'playing'],
              'type': 'Declarative',
              'mm': 'ကျွန်တော် တနင်္ဂနွေနေ့တိုင်း ဘောလုံးကစားသည်။',
            },

            // Interrogative (Questions)
            {
              'q': '___ you speak English?',
              'a': 'Do',
              'options': ['Do', 'Does', 'Are'],
              'type': 'Interrogative',
              'mm': 'မင်း အင်္ဂလိပ်စကား ပြောတတ်သလား။',
            },
            {
              'q': '___ he like pizza?',
              'a': 'Does',
              'options': ['Do', 'Does', 'Is'],
              'type': 'Interrogative',
              'mm': 'သူ ပီဇာ ကြိုက်သလား။',
            },
            {
              'q': 'Where ___ they live?',
              'a': 'do',
              'options': ['do', 'does', 'are'],
              'type': 'Interrogative',
              'mm': 'သူတို့ ဘယ်မှာ နေကြတာလဲ။',
            },
            {
              'q': 'What time ___ the train leave?',
              'a': 'does',
              'options': ['do', 'does', 'is'],
              'type': 'Interrogative',
              'mm': 'ရထား ဘယ်အချိန် ထွက်မှာလဲ။',
            },
            {
              'q': '___ it rain often here?',
              'a': 'Does',
              'options': ['Do', 'Does', 'Is'],
              'type': 'Interrogative',
              'mm': 'ဒီမှာ မိုးခဏခဏ ရွာသလား။',
            },

            // Negative Sentences
            {
              'q': 'I ___ (not/like) coffee.',
              'a': 'do not like',
              'options': ['not like', 'do not like', 'does not like'],
              'type': 'Negative',
              'mm': 'ကျွန်တော် ကော်ဖီ မကြိုက်ဘူး။',
            },
            {
              'q': 'She ___ (not/watch) TV often.',
              'a': 'does not watch',
              'options': ['do not watch', 'not watch', 'does not watch'],
              'type': 'Negative',
              'mm': 'သူမ တီဗွီ ခဏခဏ မကြည့်ဘူး။',
            },
            {
              'q': 'They ___ (not/know) the answer.',
              'a': 'do not know',
              'options': ['does not know', 'do not know', 'no know'],
              'type': 'Negative',
              'mm': 'သူတို့ အဖြေကို မသိကြဘူး။',
            },
            {
              'q': 'He ___ (not/have) a car.',
              'a': 'does not have',
              'options': ['does not has', 'do not have', 'does not have'],
              'type': 'Negative',
              'mm': 'သူ့မှာ ကားမရှိဘူး။',
            },
            {
              'q': 'Birds ___ (not/swim).',
              'a': 'do not swim',
              'options': ['does not swim', 'do not swim', 'not swimming'],
              'type': 'Negative',
              'mm': 'ငှက်များသည် ရေမကူးကြပါ။',
            },

            // Imperative & Exclamatory
            {
              'q': '___ (Close) the door, please.',
              'a': 'Close',
              'options': ['Close', 'Closes', 'Closing'],
              'type': 'Imperative',
              'mm': 'တံခါးပိတ်ပေးပါဦး။',
            },
            {
              'q': '___ (Be) quiet in the library!',
              'a': 'Be',
              'options': ['Be', 'Is', 'Am'],
              'type': 'Imperative',
              'mm': 'စာကြည့်တိုက်ထဲမှာ ငြိမ်ငြိမ်နေပါ။',
            },
            {
              'q': 'Look how fast he ___ (run)!',
              'a': 'runs',
              'options': ['run', 'runs', 'running'],
              'type': 'Exclamatory',
              'mm': 'ကြည့်စမ်း၊ သူ ဘယ်လောက်တောင် မြန်မြန်ပြေးနေလဲ။',
            },
            {
              'q': 'How beautiful she ___ (look)!',
              'a': 'looks',
              'style': 'Exclamatory',
              'options': ['look', 'looks', 'looking'],
              'mm': 'သူမ ဘယ်လောက်တောင် လှနေလဲ။',
            },
            {
              'q': 'Help! My house ___ (be) on fire!',
              'a': 'is',
              'options': ['is', 'are', 'be'],
              'type': 'Exclamatory',
              'mm': 'ကယ်ကြပါဦး! ကျွန်တော့်အိမ် မီးလောင်နေလို့ပါ။',
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
          'quizzes': [
            // --- Declarative (Statements) ---
            {
              'q': 'Right now, the children ___ (play) in the garden.',
              'a': 'are playing',
              'options': ['play', 'is playing', 'are playing'],
              'type': 'Declarative',
              'mm': 'အခုကလေးတွေ ဥယျာဉ်ထဲမှာ ကစားနေကြတယ်။',
            },
            {
              'q': 'Listen! The bird ___ (sing) beautifully.',
              'a': 'is singing',
              'options': ['sings', 'is singing', 'are singing'],
              'type': 'Declarative',
              'mm': 'နားထောင်စမ်း! ငှက်လေး သာယာစွာ သီချင်းဆိုနေတယ်။',
            },
            {
              'q': 'I ___ (study) for my exams this month.',
              'a': 'am studying',
              'options': ['study', 'am studying', 'is studying'],
              'type': 'Declarative',
              'mm': 'ဒီလမှာ ကျွန်တော် စာမေးပွဲအတွက် စာဖတ်နေပါတယ်။',
            },
            {
              'q': 'My father ___ (cook) dinner in the kitchen.',
              'a': 'is cooking',
              'options': ['is cooking', 'cooks', 'are cooking'],
              'type': 'Declarative',
              'mm': 'ကျွန်တော့်အဖေ မီးဖိုချောင်မှာ ညစာချက်နေတယ်။',
            },
            {
              'q': 'Technology ___ (change) the way we live.',
              'a': 'is changing',
              'options': ['change', 'is changing', 'are changing'],
              'type': 'Declarative',
              'mm': 'နည်းပညာက ငါတို့ရဲ့ နေထိုင်မှုပုံစံကို ပြောင်းလဲပေးနေတယ်။',
            },

            // --- Interrogative (Questions) ---
            {
              'q': '___ you ___ (watch) a movie right now?',
              'a': 'Are / watching',
              'options': ['Is / watching', 'Are / watching', 'Do / watching'],
              'type': 'Interrogative',
              'mm': 'မင်းအခု ရုပ်ရှင်ကြည့်နေတာလား။',
            },
            {
              'q': 'Why ___ she ___ (cry) over there?',
              'a': 'is / crying',
              'options': ['is / crying', 'are / crying', 'does / crying'],
              'type': 'Interrogative',
              'mm': 'သူမ ဟိုမှာ ဘာလို့ ငိုနေတာလဲ။',
            },
            {
              'q': '___ it ___ (rain) outside at the moment?',
              'a': 'Is / raining',
              'options': ['Is / raining', 'Are / raining', 'Does / raining'],
              'type': 'Interrogative',
              'mm': 'အခု အပြင်မှာ မိုးရွာနေလား။',
            },
            {
              'q': 'Where ___ they ___ (go) for their vacation?',
              'a': 'are / going',
              'options': ['is / going', 'are / going', 'do / going'],
              'type': 'Interrogative',
              'mm': 'သူတို့ အားလပ်ရက်အတွက် ဘယ်ကို သွားနေကြတာလဲ။',
            },
            {
              'q': '___ I ___ (speak) too loud?',
              'a': 'Am / speaking',
              'options': ['Am / speaking', 'Is / speaking', 'Are / speaking'],
              'type': 'Interrogative',
              'mm': 'ငါ စကားပြောတာ အရမ်းကျယ်နေသလား။',
            },

            // --- Negative Sentences ---
            {
              'q': 'He ___ (not/do) his homework; he is sleeping.',
              'a': 'is not doing',
              'options': ['not doing', 'is not doing', 'are not doing'],
              'type': 'Negative',
              'mm': 'သူ အိမ်စာမလုပ်နေဘူး၊ သူ အိပ်နေတယ်။',
            },
            {
              'q': 'We ___ (not/go) to the party tonight.',
              'a': 'are not going',
              'options': ['is not going', 'are not going', 'do not going'],
              'type': 'Negative',
              'mm': 'ကျွန်တော်တို့ ဒီည ပါတီမသွားတော့ဘူး။',
            },
            {
              'q': 'I ___ (not/use) the computer at the moment.',
              'a': 'am not using',
              'options': ['am not using', 'is not using', 'not using'],
              'type': 'Negative',
              'mm': 'ကျွန်တော် အခု ကွန်ပျူတာ မသုံးနေပါဘူး။',
            },
            {
              'q': 'The workers ___ (not/build) the bridge today.',
              'a': 'are not building',
              'options': [
                'is not building',
                'are not building',
                'not building',
              ],
              'type': 'Negative',
              'mm': 'အလုပ်သမားတွေ ဒီနေ့ တံတားမဆောက်နေကြဘူး။',
            },
            {
              'q': 'She ___ (not/feeling) very well lately.',
              'a': 'is not feeling',
              'options': [
                'is not feeling',
                'am not feeling',
                'are not feeling',
              ],
              'type': 'Negative',
              'mm': 'ဒီရက်ပိုင်း သူမ နေလို့ သိပ်မကောင်းဘူး။',
            },

            // --- Imperative & Exclamatory (Strong Feelings / Attention) ---
            {
              'q': 'Hurry up! The bus ___ (come)!',
              'a': 'is coming',
              'options': ['comes', 'is coming', 'are coming'],
              'type': 'Exclamatory',
              'mm': 'မြန်မြန်လုပ်! ဘတ်စ်ကား လာနေပြီ။',
            },
            {
              'q': 'Be quiet! The baby ___ (sleep).',
              'a': 'is sleeping',
              'options': ['sleeps', 'is sleeping', 'are sleeping'],
              'type': 'Imperative',
              'mm': 'တိတ်တိတ်နေ! ကလေး အိပ်နေတယ်။',
            },
            {
              'q': 'Look! The airplane ___ (land) now!',
              'a': 'is landing',
              'options': ['land', 'is landing', 'lands'],
              'type': 'Exclamatory',
              'mm': 'ကြည့်စမ်း! လေယာဉ်ကြီး အခု ဆင်းသက်နေပြီ။',
            },
            {
              'q': 'Stop it! You ___ (always/complain) about everything!',
              'a': 'are always complaining',
              'options': [
                'is always complaining',
                'are always complaining',
                'always complain',
              ],
              'type': 'Exclamatory',
              'mm': 'တော်တော့! မင်းက အရာရာကို အမြဲ အပြစ်တင်နေတာပဲ။',
            },
            {
              'q': 'Stay here! The teacher ___ (check) our names.',
              'a': 'is checking',
              'options': ['checks', 'is checking', 'checking'],
              'type': 'Imperative',
              'mm': 'ဒီမှာနေဦး! ဆရာက ငါတို့ နာမည်တွေ စစ်နေတယ်။',
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
          'quizzes': [
            // --- Declarative (Experience & Completion) ---
            {
              'q': 'I ___ (finish) my lunch, so I am full now.',
              'a': 'have finished',
              'options': ['have finished', 'has finished', 'finished'],
              'type': 'Declarative',
              'mm':
                  'ကျွန်တော် နေ့လယ်စာ စားပြီးသွားပြီ၊ ဒါကြောင့် အခု ဗိုက်ပြည့်နေပြီ။',
            },
            {
              'q': 'She ___ (write) three books so far.',
              'a': 'has written',
              'options': ['have written', 'has written', 'has wrote'],
              'type': 'Declarative',
              'mm': 'သူမ အခုထိ စာအုပ်သုံးအုပ် ရေးပြီးပြီ။',
            },
            {
              'q': 'They ___ (live) in this house since 1990.',
              'a': 'have lived',
              'options': ['has lived', 'lived', 'have lived'],
              'type': 'Declarative',
              'mm': 'သူတို့ ဒီအိမ်မှာနေတာ ၁၉၉၀ ကတည်းကပါ။',
            },
            {
              'q': 'The cat ___ (drink) all the milk.',
              'a': 'has drunk',
              'options': ['has drunk', 'have drunk', 'has drank'],
              'type': 'Declarative',
              'mm': 'ကြောင်က နို့တွေအကုန် သောက်လိုက်ပြီ။',
            },
            {
              'q': 'We ___ (see) this movie many times.',
              'a': 'have seen',
              'options': ['has seen', 'have seen', 'have saw'],
              'type': 'Declarative',
              'mm': 'ဒီရုပ်ရှင်ကို ကျွန်တော်တို့ အကြိမ်ကြိမ် ကြည့်ဖူးပါတယ်။',
            },

            // --- Interrogative (Experience Questions) ---
            {
              'q': '___ you ever ___ (be) to Paris?',
              'a': 'Have / been',
              'options': ['Has / been', 'Have / been', 'Have / gone'],
              'type': 'Interrogative',
              'mm': 'မင်း ပဲရစ်ကို ရောက်ဖူးသလား။',
            },
            {
              'q': '___ he ___ (finish) the report yet?',
              'a': 'Has / finished',
              'options': ['Have / finished', 'Has / finished', 'Has / finish'],
              'type': 'Interrogative',
              'mm': 'သူ အစီရင်ခံစာ ရေးပြီးပြီလား။',
            },
            {
              'q': 'How long ___ they ___ (know) each other?',
              'a': 'have / known',
              'options': ['has / known', 'have / known', 'do / known'],
              'type': 'Interrogative',
              'mm': 'သူတို့ သိလာကြတာ ဘယ်လောက်ကြာပြီလဲ။',
            },
            {
              'q': '___ it ___ (stop) raining yet?',
              'a': 'Has / stopped',
              'options': ['Has / stopped', 'Have / stopped', 'Is / stopped'],
              'type': 'Interrogative',
              'mm': 'မိုးတိတ်သွားပြီလား။',
            },
            {
              'q': 'Where ___ she ___ (go)? I can\'t find her.',
              'a': 'has / gone',
              'options': ['has / gone', 'has / been', 'have / gone'],
              'type': 'Interrogative',
              'mm': 'သူမ ဘယ်သွားလိုက်တာလဲ။ ကျွန်တော် သူမကို ရှာမတွေ့တော့ဘူး။',
            },

            // --- Negative Sentences (Not finished / Not experienced) ---
            {
              'q': 'I ___ (not/see) him today.',
              'a': 'have not seen',
              'options': ['has not seen', 'have not seen', 'not have seen'],
              'type': 'Negative',
              'mm': 'ကျွန်တော် ဒီနေ့ သူ့ကို မတွေ့ရသေးဘူး။',
            },
            {
              'q': 'He ___ (not/call) me since last week.',
              'a': 'has not called',
              'options': [
                'have not called',
                'not has called',
                'has not called',
              ],
              'type': 'Negative',
              'mm': 'သူ ပြီးခဲ့တဲ့အပတ်ကတည်းက ကျွန်တော့်ကို ဖုန်းမဆက်တော့ဘူး။',
            },
            {
              'q': 'We ___ (not/receive) the package yet.',
              'a': 'have not received',
              'options': [
                'have not received',
                'has not received',
                'not received',
              ],
              'type': 'Negative',
              'mm': 'ကျွန်တော်တို့ ပါဆယ် မရသေးပါဘူး။',
            },
            {
              'q': 'The rain ___ (not/stop) for three hours.',
              'a': 'has not stopped',
              'options': [
                'has not stopped',
                'have not stopped',
                'is not stopped',
              ],
              'type': 'Negative',
              'mm': 'မိုးမတိတ်တာ ၃ နာရီရှိပြီ။',
            },
            {
              'q': 'They ___ (not/visit) us lately.',
              'a': 'have not visited',
              'options': [
                'has not visited',
                'have not visited',
                'not visiting',
              ],
              'type': 'Negative',
              'mm': 'သူတို့ ကျွန်တော်တို့ဆီ မလာတာ ကြာပြီ။',
            },

            // --- Imperative & Exclamatory (Results & Strong Feelings) ---
            {
              'q': 'Be careful! Someone ___ (break) the window!',
              'a': 'has broken',
              'options': ['has broken', 'have broken', 'broke'],
              'type': 'Exclamatory',
              'mm': 'သတိထား! တစ်ယောက်ယောက် ပြတင်းပေါက်ကို ခွဲလိုက်ပြီ။',
            },
            {
              'q': 'Look! I ___ (buy) a new car!',
              'a': 'have bought',
              'options': ['has bought', 'have bought', 'am buying'],
              'type': 'Exclamatory',
              'mm': 'ကြည့်စမ်း! ငါ ကားအသစ်တစ်စီး ဝယ်လိုက်ပြီ။',
            },
            {
              'q': 'Don\'t enter! I ___ (just/wash) the floor.',
              'a': 'have just washed',
              'options': ['have just washed', 'just washed', 'am washing'],
              'type': 'Imperative',
              'mm': 'မဝင်နဲ့ဦး! ကျွန်တော် ခုလေးတင် ကြမ်းတိုက်ထားလို့။',
            },
            {
              'q': 'Wow! You ___ (grow) so much!',
              'a': 'have grown',
              'options': ['has grown', 'have grown', 'is grown'],
              'type': 'Exclamatory',
              'mm': 'ဝါး! မင်း တော်တော်လေး အရွယ်ရောက်လာပြီပဲ။',
            },
            {
              'q': 'Stop! You ___ (do) enough work for today.',
              'a': 'have done',
              'options': ['has done', 'have done', 'did'],
              'type': 'Imperative',
              'mm': 'တော်ပြီ! မင်း ဒီနေ့အတွက် အလုပ်လုပ်တာ လုံလောက်သွားပြီ။',
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
          'quizzes': [
            // --- Declarative (Duration & Continuity) ---
            {
              'q': 'I ___ (wait) for the bus for thirty minutes.',
              'a': 'have been waiting',
              'options': ['have waited', 'have been waiting', 'am waiting'],
              'type': 'Declarative',
              'mm': 'ကျွန်တော် ဘတ်စ်ကားစောင့်နေတာ မိနစ်သုံးဆယ်ရှိပြီ။',
            },
            {
              'q': 'It ___ (snow) since last night.',
              'a': 'has been snowing',
              'options': ['has been snowing', 'has snowed', 'is snowing'],
              'type': 'Declarative',
              'mm': 'မနေ့ညကတည်းက နှင်းတွေကျနေတာ။',
            },
            {
              'q': 'They ___ (work) on this project for months.',
              'a': 'have been working',
              'options': ['have worked', 'have been working', 'are working'],
              'type': 'Declarative',
              'mm': 'သူတို့ ဒီပရောဂျက်ကို လုပ်နေကြတာ လပေါင်းများစွာရှိပြီ။',
            },
            {
              'q': 'She ___ (practice) the piano all morning.',
              'a': 'has been practicing',
              'options': [
                'has practiced',
                'is practicing',
                'has been practicing',
              ],
              'type': 'Declarative',
              'mm': 'သူမ တစ်မနက်ခင်းလုံး ပီယာနိုလေ့ကျင့်နေတာ။',
            },
            {
              'q': 'We ___ (look) for a new house recently.',
              'a': 'have been looking',
              'options': ['have been looking', 'looked', 'are looking'],
              'type': 'Declarative',
              'mm': 'ကျွန်တော်တို့ ဒီရက်ပိုင်း အိမ်အသစ်ရှာနေကြတယ်။',
            },

            // --- Interrogative (How Long questions) ---
            {
              'q': 'How long ___ you ___ (learn) English?',
              'a': 'have / been learning',
              'options': [
                'do / learn',
                'have / been learning',
                'are / learning',
              ],
              'type': 'Interrogative',
              'mm': 'မင်း အင်္ဂလိပ်စာသင်နေတာ ဘယ်လောက်ကြာပြီလဲ။',
            },
            {
              'q': '___ he ___ (watch) TV since he got home?',
              'a': 'Has / been watching',
              'options': [
                'Has / been watching',
                'Is / watching',
                'Does / watch',
              ],
              'type': 'Interrogative',
              'mm': 'သူ အိမ်ပြန်ရောက်ကတည်းက တီဗွီကြည့်နေတာလား။',
            },
            {
              'q': 'What ___ they ___ (do) for the past hour?',
              'a': 'have / been doing',
              'options': ['are / doing', 'have / been doing', 'did / do'],
              'type': 'Interrogative',
              'mm': 'ပြီးခဲ့တဲ့ တစ်နာရီလုံး သူတို့ ဘာတွေလုပ်နေကြတာလဲ။',
            },
            {
              'q': '___ it ___ (rain) all day?',
              'a': 'Has / been raining',
              'options': ['Is / raining', 'Has / been raining', 'Does / rain'],
              'type': 'Interrogative',
              'mm': 'တစ်နေကုန် မိုးရွာနေတာလား။',
            },
            {
              'q': 'How long ___ she ___ (stay) at this hotel?',
              'a': 'has / been staying',
              'options': ['is / staying', 'has / been staying', 'does / stay'],
              'type': 'Interrogative',
              'mm': 'သူမ ဒီဟိုတယ်မှာ တည်းနေတာ ဘယ်လောက်ကြာပြီလဲ။',
            },

            // --- Negative Sentences ---
            {
              'q': 'I ___ (not/feel) very well lately.',
              'a': 'have not been feeling',
              'options': [
                'am not feeling',
                'have not been feeling',
                'not been feeling',
              ],
              'type': 'Negative',
              'mm': 'ဒီရက်ပိုင်း ကျွန်တော် နေလို့ သိပ်မကောင်းဘူး။',
            },
            {
              'q': 'He ___ (not/take) his medicine regularly.',
              'a': 'has not been taking',
              'options': [
                'is not taking',
                'has not been taking',
                'not has taken',
              ],
              'type': 'Negative',
              'mm': 'သူ ဆေးကို ပုံမှန် မသောက်ဖြစ်ဘူး။',
            },
            {
              'q': 'We ___ (not/talk) to each other for a while.',
              'a': 'have not been talking',
              'options': [
                'don\'t talk',
                'are not talking',
                'have not been talking',
              ],
              'type': 'Negative',
              'mm': 'ကျွန်တော်တို့ စကားမပြောဖြစ်တာ ခဏရှိပြီ။',
            },
            {
              'q': 'They ___ (not/exercise) much these days.',
              'a': 'have not been exercising',
              'options': [
                'not exercising',
                'have not been exercising',
                'don\'t exercise',
              ],
              'type': 'Negative',
              'mm': 'သူတို့ ဒီရက်ပိုင်း လေ့ကျင့်ခန်း သိပ်မလုပ်ဖြစ်ကြဘူး။',
            },
            {
              'q': 'She ___ (not/read) as much as she used to.',
              'a': 'has not been reading',
              'options': [
                'is not reading',
                'has not been reading',
                'not has read',
              ],
              'type': 'Negative',
              'mm': 'သူမ အရင်ကလောက် စာမဖတ်ဖြစ်တော့ဘူး။',
            },

            // --- Visible Results & Exclamatory (The "Proof" Category) ---
            {
              'q': 'You are out of breath! ___ you ___ (run)?',
              'a': 'Have / been running',
              'options': ['Do / run', 'Are / running', 'Have / been running'],
              'type': 'Interrogative',
              'mm': 'မင်း အမောတကော ဖြစ်နေပါလား။ ပြေးနေခဲ့တာလား။',
            },
            {
              'q': 'Your clothes are wet! ___ you ___ (swim)?',
              'a': 'Have / been swimming',
              'options': [
                'Have / been swimming',
                'Are / swimming',
                'Did / swim',
              ],
              'type': 'Exclamatory',
              'mm': 'မင်းအင်္ကျီတွေ စိုနေပါလား။ ရေကူးနေခဲ့တာလား။',
            },
            {
              'q': 'Look at the garden! It ___ (rain) hard.',
              'a': 'has been raining',
              'options': ['is raining', 'has been raining', 'rains'],
              'type': 'Exclamatory',
              'mm': 'ဥယျာဉ်ထဲကို ကြည့်ဦး! မိုးတွေ အပြင်းအထန် ရွာထားတာပဲ။',
            },
            {
              'q': 'The kitchen smells great! Mom ___ (bake).',
              'a': 'has been baking',
              'options': ['is baking', 'bakes', 'has been baking'],
              'type': 'Exclamatory',
              'mm': 'မီးဖိုချောင်ထဲမှာ မွှေးနေတာပဲ! အမေ မုန့်ဖုတ်နေခဲ့တာနေမှာ။',
            },
            {
              'q': 'My eyes hurt because I ___ (use) the phone too much.',
              'a': 'have been using',
              'options': ['am using', 'have been using', 'used'],
              'type': 'Declarative',
              'mm': 'ဖုန်းအကြည့်များနေလို့ ကျွန်တော့်မျက်လုံးတွေ အောင့်နေတယ်။',
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
          'quizzes': [
            // --- Declarative (Completed Actions) ---
            {
              'q': 'I ___ (visit) my grandmother last Sunday.',
              'a': 'visited',
              'options': ['visit', 'visited', 'was visit'],
              'type': 'Declarative',
              'mm': 'ပြီးခဲ့တဲ့ တနင်္ဂနွေနေ့က အဘွားဆီ သွားလည်ခဲ့တယ်။',
            },
            {
              'q': 'They ___ (buy) a new house in 2020.',
              'a': 'bought',
              'options': ['buy', 'buyed', 'bought'],
              'type': 'Declarative',
              'mm': 'သူတို့ ၂၀၂၀ မှာ အိမ်အသစ်တစ်လုံး ဝယ်ခဲ့တယ်။',
            },
            {
              'q': 'The bus ___ (leave) five minutes ago.',
              'a': 'left',
              'options': ['leave', 'left', 'leaves'],
              'type': 'Declarative',
              'mm': 'ဘတ်စ်ကားက လွန်ခဲ့တဲ့ ၅ မိနစ်က ထွက်သွားပြီ။',
            },
            {
              'q': 'He ___ (be) a famous singer in the 90s.',
              'a': 'was',
              'options': ['is', 'was', 'were'],
              'type': 'Declarative',
              'mm':
                  'သူက ကိုးဆယ်ကျော်ကာလတွေမှာ နာမည်ကြီးအဆိုတော်တစ်ယောက် ဖြစ်ခဲ့တယ်။',
            },
            {
              'q': 'We ___ (eat) dinner at a fancy restaurant yesterday.',
              'a': 'ate',
              'options': ['eat', 'eaten', 'ate'],
              'type': 'Declarative',
              'mm':
                  'မနေ့က ကျွန်တော်တို့ ဆိုင်ကောင်းကောင်းတစ်ခုမှာ ညစာစားခဲ့ကြတယ်။',
            },

            // --- Interrogative (Did + V1) ---
            {
              'q': '___ you ___ (see) the news this morning?',
              'a': 'Did / see',
              'options': ['Did / saw', 'Did / see', 'Do / see'],
              'type': 'Interrogative',
              'mm': 'ဒီမနက် သတင်းကြည့်ခဲ့လား။',
            },
            {
              'q': 'Where ___ she ___ (go) after the party?',
              'a': 'did / go',
              'options': ['did / go', 'did / went', 'does / go'],
              'type': 'Interrogative',
              'mm': 'ပါတီပြီးတော့ သူမ ဘယ်သွားခဲ့လဲ။',
            },
            {
              'q': '___ they ___ (finish) the work on time?',
              'a': 'Did / finish',
              'options': ['Did / finish', 'Do / finish', 'Did / finished'],
              'type': 'Interrogative',
              'mm': 'သူတို့ အလုပ်ကို အချိန်မီ ပြီးခဲ့ကြလား။',
            },
            {
              'q': 'What time ___ the movie ___ (start)?',
              'a': 'did / start',
              'options': ['did / start', 'does / start', 'did / started'],
              'type': 'Interrogative',
              'mm': 'ရုပ်ရှင် ဘယ်အချိန်မှာ စခဲ့တာလဲ။',
            },
            {
              'q': '___ he ___ (call) you yesterday?',
              'a': 'Did / call',
              'options': ['Did / call', 'Did / called', 'Does / call'],
              'type': 'Interrogative',
              'mm': 'သူ မနေ့က မင်းကို ဖုန်းဆက်ခဲ့လား။',
            },

            // --- Negative Sentences (Did not + V1) ---
            {
              'q': 'I ___ (not/sleep) well last night.',
              'a': 'did not sleep',
              'options': ['did not slept', 'not sleep', 'did not sleep'],
              'type': 'Negative',
              'mm': 'မနေ့ညက ကျွန်တော် ကောင်းကောင်း အိပ်မပျော်ခဲ့ဘူး။',
            },
            {
              'q': 'She ___ (not/like) the food at the wedding.',
              'a': 'did not like',
              'options': ['did not liked', 'not liked', 'did not like'],
              'type': 'Negative',
              'mm': 'မင်္ဂလာဆောင်က အစားအစာကို သူမ မကြိုက်ခဲ့ဘူး။',
            },
            {
              'q': 'They ___ (not/come) to the meeting.',
              'a': 'did not come',
              'options': ['did not came', 'not come', 'did not come'],
              'type': 'Negative',
              'mm': 'သူတို့ အစည်းအဝေးကို မလာခဲ့ကြဘူး။',
            },
            {
              'q': 'We ___ (not/have) enough time to talk.',
              'a': 'did not have',
              'options': ['did not had', 'not have', 'did not have'],
              'type': 'Negative',
              'mm': 'ကျွန်တော်တို့ စကားပြောဖို့ အချိန်အလုံအလောက် မရခဲ့ဘူး။',
            },
            {
              'q': 'The cat ___ (not/catch) the mouse.',
              'a': 'did not catch',
              'options': ['did not caught', 'not catch', 'did not catch'],
              'type': 'Negative',
              'mm': 'ကြောင်က ကြွက်ကို မမိခဲ့ဘူး။',
            },

            // --- Imperative & Exclamatory (Narrative / Strong Emotion) ---
            {
              'q': 'Wait! You ___ (forget) your umbrella!',
              'a': 'forgot',
              'options': ['forgot', 'forget', 'forgotten'],
              'type': 'Exclamatory',
              'mm': 'နေဦး! မင်း ထီးကျန်ခဲ့ပြီ (မေ့ခဲ့ပြီ)။',
            },
            {
              'q': 'Help! That man ___ (steal) my bag!',
              'a': 'stole',
              'options': ['steal', 'stolen', 'stole'],
              'type': 'Exclamatory',
              'mm': 'ကယ်ကြပါဦး! ဟိုလူ ကျွန်တော့်အိတ်ကို ခိုးသွားပြီ။',
            },
            {
              'q': 'Don\'t worry, I ___ (lock) the door before leaving.',
              'a': 'locked',
              'options': ['lock', 'locked', 'was lock'],
              'type': 'Imperative',
              'mm': 'မစိုးရိမ်နဲ့၊ မထွက်ခင် ကျွန်တော် တံခါးပိတ်ခဲ့ပါတယ်။',
            },
            {
              'q': 'Oh no! The vase ___ (break)!',
              'a': 'broke',
              'options': ['break', 'broken', 'broke'],
              'type': 'Exclamatory',
              'mm': 'ဒုက္ခပါပဲ! ပန်းအိုး ကွဲသွားပြီ။',
            },
            {
              'q': 'Stop! I ___ (tell) you not to do that!',
              'a': 'told',
              'options': ['tell', 'told', 'telled'],
              'type': 'Imperative',
              'mm': 'ရပ်လိုက်! အဲ့ဒါမလုပ်ဖို့ ငါ မင်းကို ပြောခဲ့တယ်နော်။',
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
          'quizzes': [
            // --- Declarative (Actions in Progress) ---
            {
              'q': 'I ___ (watch) TV when you called me.',
              'a': 'was watching',
              'options': ['watched', 'was watching', 'were watching'],
              'type': 'Declarative',
              'mm': 'မင်းဖုန်းဆက်တဲ့အချိန်မှာ ငါတီဗွီကြည့်နေခဲ့တာ။',
            },
            {
              'q': 'The birds ___ (sing) at 6 AM this morning.',
              'a': 'were singing',
              'options': ['was singing', 'were singing', 'sang'],
              'type': 'Declarative',
              'mm': 'ဒီမနက် ၆ နာရီမှာ ငှက်လေးတွေ သီချင်းဆိုနေခဲ့ကြတယ်။',
            },
            {
              'q': 'She ___ (wear) a beautiful dress at the party.',
              'a': 'was wearing',
              'options': ['is wearing', 'was wearing', 'were wearing'],
              'type': 'Declarative',
              'mm': 'ပါတီမှာ သူမ ဝတ်စုံလှလှလေးတစ်ထည် ဝတ်ထားခဲ့တယ်။',
            },
            {
              'q': 'It ___ (rain) while we were driving home.',
              'a': 'was raining',
              'options': ['was raining', 'were raining', 'rained'],
              'type': 'Declarative',
              'mm': 'ကျွန်တော်တို့ အိမ်ပြန်မောင်းနေတုန်း မိုးရွာနေခဲ့တယ်။',
            },
            {
              'q': 'They ___ (play) football when the rain started.',
              'a': 'were playing',
              'options': ['was playing', 'were playing', 'played'],
              'type': 'Declarative',
              'mm': 'မိုးစရွာတဲ့အချိန်မှာ သူတို့ ဘောလုံးကစားနေခဲ့ကြတယ်။',
            },

            // --- Interrogative (Was/Were + Subject + V-ing) ---
            {
              'q': '___ you ___ (sleep) when I knocked on the door?',
              'a': 'Were / sleeping',
              'options': ['Was / sleeping', 'Were / sleeping', 'Did / sleep'],
              'type': 'Interrogative',
              'mm': 'ငါ တံခါးခေါက်တဲ့အချိန်မှာ မင်း အိပ်နေခဲ့တာလား။',
            },
            {
              'q': 'What ___ she ___ (do) at 10 PM last night?',
              'a': 'was / doing',
              'options': ['was / doing', 'were / doing', 'is / doing'],
              'type': 'Interrogative',
              'mm': 'မနေ့ည ၁၀ နာရီမှာ သူမ ဘာလုပ်နေခဲ့တာလဲ။',
            },
            {
              'q': '___ the sun ___ (shine) when you woke up?',
              'a': 'Was / shining',
              'options': ['Was / shining', 'Were / shining', 'Did / shine'],
              'type': 'Interrogative',
              'mm': 'မင်းနိုးလာတဲ့အချိန်မှာ နေသာနေခဲ့လား။',
            },
            {
              'q': 'Where ___ they ___ (go) when we saw them?',
              'a': 'were / going',
              'options': ['was / going', 'were / going', 'did / go'],
              'type': 'Interrogative',
              'mm':
                  'ငါတို့ သူတို့ကို မြင်လိုက်တဲ့အချိန်မှာ သူတို့ ဘယ်သွားနေခဲ့တာလဲ။',
            },
            {
              'q': '___ I ___ (snore) last night?',
              'a': 'Was / snoring',
              'options': ['Was / snoring', 'Were / snoring', 'Am / snoring'],
              'type': 'Interrogative',
              'mm': 'မနေ့ညက ငါ ဟောက်နေခဲ့သလား။',
            },

            // --- Negative (Was not / Were not + V-ing) ---
            {
              'q': 'I ___ (not/work) when the boss walked in.',
              'a': 'was not working',
              'options': ['were not working', 'was not working', 'not working'],
              'type': 'Negative',
              'mm': 'မန်နေဂျာဝင်လာတဲ့အချိန်မှာ ကျွန်တော် အလုပ်မလုပ်နေခဲ့ဘူး။',
            },
            {
              'q': 'We ___ (not/listening) to the teacher.',
              'a': 'were not listening',
              'options': [
                'was not listening',
                'were not listening',
                'didn\'t listening',
              ],
              'type': 'Negative',
              'mm': 'ကျွန်တော်တို့ ဆရာပြောတာကို နားမထောင်နေခဲ့ကြဘူး။',
            },
            {
              'q': 'He ___ (not/driving) fast when the accident happened.',
              'a': 'was not driving',
              'options': [
                'was not driving',
                'were not driving',
                'isn\'t driving',
              ],
              'type': 'Negative',
              'mm': 'မတော်တဆဖြစ်တဲ့အချိန်မှာ သူ ကားကို အမြန်မမောင်းနေခဲ့ပါဘူး။',
            },
            {
              'q': 'The kids ___ (not/making) noise while the baby slept.',
              'a': 'were not making',
              'options': ['was not making', 'were not making', 'not making'],
              'type': 'Negative',
              'mm': 'ကလေးအိပ်နေတုန်းမှာ တခြားကလေးတွေက ဆူညံမနေခဲ့ကြဘူး။',
            },
            {
              'q': 'She ___ (not/feeling) well yesterday afternoon.',
              'a': 'was not feeling',
              'options': [
                'were not feeling',
                'was not feeling',
                'wasn\'t feel',
              ],
              'type': 'Negative',
              'mm': 'မနေ့က နေ့လယ်ပိုင်းမှာ သူမ နေလို့သိပ်မကောင်းနေခဲ့ဘူး။',
            },

            // --- Two Actions Happening Simultaneously (While) ---
            {
              'q': 'While I was cooking, my husband ___ (set) the table.',
              'a': 'was setting',
              'options': ['set', 'was setting', 'were setting'],
              'type': 'Declarative',
              'mm':
                  'ကျွန်မ ဟင်းချက်နေတုန်း ကျွန်မအမျိုးသားက စားပွဲပြင်နေခဲ့တယ်။',
            },
            {
              'q': 'They ___ (dance) while the band was playing.',
              'a': 'were dancing',
              'options': ['danced', 'were dancing', 'was dancing'],
              'type': 'Declarative',
              'mm': 'တီးဝိုင်းက တီးနေတုန်း သူတို့ ကနေခဲ့ကြတယ်။',
            },
            {
              'q': 'What were you doing while it ___ (snow)?',
              'a': 'was snowing',
              'options': ['snowed', 'was snowing', 'were snowing'],
              'type': 'Interrogative',
              'mm': 'နှင်းတွေကျနေတုန်း မင်း ဘာလုပ်နေခဲ့တာလဲ။',
            },
            {
              'q': 'I ___ (study) while they were partying next door.',
              'a': 'was studying',
              'options': ['was studying', 'were studying', 'studied'],
              'type': 'Declarative',
              'mm':
                  'ဘေးခန်းမှာ သူတို့ ပါတီလုပ်နေတုန်း ကျွန်တော်ကတော့ စာဖတ်နေခဲ့တယ်။',
            },
            {
              'q': 'Look! Even though it was late, he ___ (still/work).',
              'a': 'was still working',
              'options': ['is still working', 'was still working', 'worked'],
              'type': 'Exclamatory',
              'mm':
                  'ကြည့်စမ်း! အချိန်နှောင်းနေပြီဆိုရင်တောင် သူကတော့ အလုပ်လုပ်နေတုန်းပဲ။',
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
          'quizzes': [
            // --- Declarative (The First of Two Actions) ---
            {
              'q':
                  'When I arrived at the station, the train ___ (already/leave).',
              'a': 'had already left',
              'options': ['has already left', 'had already left', 'left'],
              'type': 'Declarative',
              'mm':
                  'ကျွန်တော် ဘူတာရုံရောက်တဲ့အချိန်မှာ ရထားက ထွက်သွားနှင့်ပြီ။',
            },
            {
              'q': 'She failed the test because she ___ (not/study).',
              'a': 'had not studied',
              'options': [
                'has not studied',
                'did not study',
                'had not studied',
              ],
              'type': 'Declarative',
              'mm': 'သူမ စာမလုပ်ခဲ့လို့ စာမေးပွဲကျခဲ့တာ။',
            },
            {
              'q': 'I ___ (finish) my work before the boss arrived.',
              'a': 'had finished',
              'options': ['had finished', 'have finished', 'finished'],
              'type': 'Declarative',
              'mm': 'မန်နေဂျာမလာခင် ကျွန်တော့်အလုပ်တွေ ပြီးနှင့်နေပြီ။',
            },
            {
              'q': 'By the time we got home, the rain ___ (stop).',
              'a': 'had stopped',
              'options': ['has stopped', 'had stopped', 'was stopped'],
              'type': 'Declarative',
              'mm': 'ကျွန်တော်တို့ အိမ်ရောက်တဲ့အချိန်မှာ မိုးတိတ်သွားပြီ။',
            },
            {
              'q': 'He told me that he ___ (see) the movie before.',
              'a': 'had seen',
              'options': ['has seen', 'had seen', 'saw'],
              'type': 'Declarative',
              'mm':
                  'သူက အဲ့ဒီရုပ်ရှင်ကို အရင်က မြင်ဖူးတယ်လို့ ကျွန်တော့်ကို ပြောခဲ့တယ်။',
            },

            // --- Interrogative (Checking the First Action) ---
            {
              'q': '___ he ___ (eat) dinner before you called him?',
              'a': 'Had / eaten',
              'options': ['Has / eaten', 'Had / eaten', 'Did / eat'],
              'type': 'Interrogative',
              'mm': 'မင်းဖုန်းမဆက်ခင် သူ ညစာစားပြီးပြီလား။',
            },
            {
              'q': '___ she ___ (live) in London before moving to Yangon?',
              'a': 'Had / lived',
              'options': ['Has / lived', 'Had / lived', 'Did / live'],
              'type': 'Interrogative',
              'mm': 'ရန်ကုန်ကို မပြောင်းခင် သူမ လန်ဒန်မှာ နေခဲ့ဖူးလား။',
            },
            {
              'q': 'How many times ___ you ___ (visit) Paris before 2020?',
              'a': 'had / visited',
              'options': ['have / visited', 'had / visited', 'did / visit'],
              'type': 'Interrogative',
              'mm': '၂၀၂၀ မတိုင်ခင် ပဲရစ်ကို မင်းဘယ်နှစ်ခါရောက်ဖူးလဲ။',
            },
            {
              'q': '___ the meeting ___ (start) when you arrived?',
              'a': 'Had / started',
              'options': ['Had / started', 'Has / started', 'Was / starting'],
              'type': 'Interrogative',
              'mm': 'မင်းရောက်တဲ့အချိန်မှာ အစည်းအဝေး စနေပြီလား။',
            },
            {
              'q': 'What ___ they ___ (do) before the police came?',
              'a': 'had / done',
              'options': ['have / done', 'had / done', 'did / do'],
              'type': 'Interrogative',
              'mm': 'ရဲတွေမလာခင် သူတို့ ဘာတွေလုပ်ခဲ့ကြတာလဲ။',
            },

            // --- Negative (Action had not happened yet) ---
            {
              'q': 'We ___ (not/hear) the news until you told us.',
              'a': 'had not heard',
              'options': ['have not heard', 'did not hear', 'had not heard'],
              'type': 'Negative',
              'mm':
                  'မင်းပြောမှပဲ အဲ့ဒီသတင်းကို ကျွန်တော်တို့ သိရတာ (အရင်က မကြားဖူးဘူး)။',
            },
            {
              'q': 'The plants died because it ___ (not/rain) for weeks.',
              'a': 'had not rained',
              'options': [
                'has not rained',
                'had not rained',
                'was not raining',
              ],
              'type': 'Negative',
              'mm':
                  'အပင်တွေ သေကုန်တယ်၊ ဘာလို့လဲဆိုတော့ အပတ်ပေါင်းများစွာ မိုးမရွာခဲ့လို့ပဲ။',
            },
            {
              'q': 'I ___ (not/meet) him before the party last night.',
              'a': 'had not met',
              'options': ['have not met', 'did not meet', 'had not met'],
              'type': 'Negative',
              'mm': 'မနေ့ညက ပါတီမတိုင်ခင် သူ့ကို ကျွန်တော် တစ်ခါမှ မဆုံဖူးဘူး။',
            },
            {
              'q': 'She ___ (not/finish) her coffee when the taxi arrived.',
              'a': 'had not finished',
              'options': [
                'has not finished',
                'had not finished',
                'was not finishing',
              ],
              'type': 'Negative',
              'mm': 'တက္ကစီရောက်လာတော့ သူမ ကော်ဖီ မသောက်ရသေးဘူး။',
            },
            {
              'q': 'They ___ (not/booked) the hotel, so they stayed with us.',
              'a': 'had not booked',
              'options': ['had not booked', 'have not booked', 'not booked'],
              'type': 'Negative',
              'mm':
                  'သူတို့ ဟိုတယ် မကြိုတင်ထားခဲ့လို့ ကျွန်တော်တို့နဲ့အတူ တည်းခဲ့ကြတယ်။',
            },

            // --- Conditional & Reported Speech (Complex Uses) ---
            {
              'q': 'If I ___ (know) you were coming, I would have cooked.',
              'a': 'had known',
              'options': ['knew', 'had known', 'have known'],
              'type': 'Declarative',
              'mm': 'မင်းလာမယ်ဆိုတာသာ ငါသိခဲ့ရင် ငါ ချက်ထားမှာပေါ့။',
            },
            {
              'q': 'I wished I ___ (study) harder for the exam.',
              'a': 'had studied',
              'options': ['studied', 'had studied', 'have studied'],
              'type': 'Exclamatory',
              'mm':
                  'ငါ စာမေးပွဲအတွက် ပိုကြိုးစားခဲ့ရင် ကောင်းမှာလို့ ဆန္ဒရှိခဲ့တယ်။',
            },
            {
              'q': 'The teacher asked if we ___ (do) our homework.',
              'a': 'had done',
              'options': ['have done', 'had done', 'did'],
              'type': 'Declarative',
              'mm': 'ဆရာက ငါတို့ အိမ်စာလုပ်ပြီးပြီလားလို့ မေးခဲ့တယ်။',
            },
            {
              'q': 'I couldn\'t pay because I ___ (forget) my wallet.',
              'a': 'had forgotten',
              'options': ['forgot', 'had forgotten', 'forgotten'],
              'type': 'Declarative',
              'mm': 'ပိုက်ဆံအိတ် မေ့ခဲ့လို့ ကျွန်တော် ပိုက်ဆံမပေးနိုင်ခဲ့ဘူး။',
            },
            {
              'q': 'The thief ___ (escape) before the police arrived!',
              'a': 'had escaped',
              'options': ['has escaped', 'had escaped', 'escaped'],
              'type': 'Exclamatory',
              'mm': 'ရဲတွေမရောက်ခင် သူခိုးက လွတ်သွားနှင့်ပြီ။',
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
          'quizzes': [
            // --- Declarative (Duration before a Past Point) ---
            {
              'q': 'He was exhausted because he ___ (work) for twelve hours.',
              'a': 'had been working',
              'options': [
                'has been working',
                'had been working',
                'was working',
              ],
              'type': 'Declarative',
              'mm':
                  'သူ ၁၂ နာရီကြာအောင် အလုပ်လုပ်နေခဲ့လို့ အရမ်းပင်ပန်းနေခဲ့တာ။',
            },
            {
              'q': 'The ground was wet because it ___ (rain) all night.',
              'a': 'had been raining',
              'options': [
                'had been raining',
                'has been raining',
                'was raining',
              ],
              'type': 'Declarative',
              'mm': 'တစ်ညလုံး မိုးရွာနေခဲ့လို့ မြေကြီးတွေ စိုနေခဲ့တာ။',
            },
            {
              'q': 'I ___ (wait) for an hour when the bus finally arrived.',
              'a': 'had been waiting',
              'options': ['was waiting', 'had waited', 'had been waiting'],
              'type': 'Declarative',
              'mm':
                  'ဘတ်စ်ကားရောက်လာတဲ့အချိန်မှာ ကျွန်တော် စောင့်နေတာ တစ်နာရီရှိနေပြီ။',
            },
            {
              'q':
                  'She ___ (study) English for years before she moved to London.',
              'a': 'had been studying',
              'options': [
                'had been studying',
                'has been studying',
                'was studying',
              ],
              'type': 'Declarative',
              'mm':
                  'လန်ဒန်ကို မပြောင်းခင် သူမ အင်္ဂလိပ်စာကို နှစ်ပေါင်းများစွာ သင်ယူနေခဲ့တာ။',
            },
            {
              'q': 'They ___ (talk) for over an hour before Tony arrived.',
              'a': 'had been talking',
              'options': ['were talking', 'had been talking', 'had talked'],
              'type': 'Declarative',
              'mm': 'တိုနီရောက်မလာခင် သူတို့ စကားပြောနေကြတာ တစ်နာရီကျော်နေပြီ။',
            },

            // --- Interrogative (How long / Questions) ---
            {
              'q': 'How long ___ you ___ (wait) when the doctor called you?',
              'a': 'had / been waiting',
              'options': [
                'had / been waiting',
                'were / waiting',
                'have / been waiting',
              ],
              'type': 'Interrogative',
              'mm': 'ဆရာဝန်ခေါ်တဲ့အချိန်မှာ မင်းစောင့်နေတာ ဘယ်လောက်ကြာပြီလဲ။',
            },
            {
              'q': '___ he ___ (drive) for long before the car broke down?',
              'a': 'Had / been driving',
              'options': [
                'Was / driving',
                'Has / been driving',
                'Had / been driving',
              ],
              'type': 'Interrogative',
              'mm': 'ကားမပျက်ခင် သူ ကားမောင်းနေတာ ကြာပြီလား။',
            },
            {
              'q': '___ she ___ (cry) before you apologized?',
              'a': 'Had / been crying',
              'options': [
                'Had / been crying',
                'Was / crying',
                'Has / been crying',
              ],
              'type': 'Interrogative',
              'mm': 'မင်းတောင်းပန်ခြင်းမပြုခင် သူမ ငိုနေခဲ့တာလား။',
            },
            {
              'q': 'Where ___ they ___ (live) before they bought this house?',
              'a': 'had / been living',
              'options': [
                'were / living',
                'had / been living',
                'have / been living',
              ],
              'type': 'Interrogative',
              'mm': 'ဒီအိမ်ကိုမဝယ်ခင် သူတို့ ဘယ်မှာ နေထိုင်နေခဲ့ကြတာလဲ။',
            },
            {
              'q': '___ the birds ___ (sing) before the sun rose?',
              'a': 'Had / been singing',
              'options': ['Had / been singing', 'Were / singing', 'Did / sing'],
              'type': 'Interrogative',
              'mm': 'နေမထွက်ခင် ငှက်လေးတွေ သီချင်းဆိုနေခဲ့ကြတာလား။',
            },

            // --- Negative (Duration not happening) ---
            {
              'q': 'I ___ (not/feel) well for days before I saw a doctor.',
              'a': 'had not been feeling',
              'options': [
                'was not feeling',
                'had not been feeling',
                'not been feeling',
              ],
              'type': 'Negative',
              'mm':
                  'ဆရာဝန်နဲ့မပြခင် ရက်အတော်ကြာ ကျွန်တော် နေလို့မကောင်းဖြစ်နေခဲ့တာ။',
            },
            {
              'q': 'We ___ (not/expect) any visitors that day.',
              'a': 'had not been expecting',
              'options': [
                'were not expecting',
                'had not been expecting',
                'not expected',
              ],
              'type': 'Negative',
              'mm':
                  'အဲ့ဒီနေ့က ဘယ်သူမှလာလည်လိမ့်မယ်လို့ ကျွန်တော်တို့ မမျှော်လင့်ထားခဲ့ဘူး။',
            },
            {
              'q': 'He ___ (not/working) there for very long when he quit.',
              'a': 'had not been working',
              'options': [
                'was not working',
                'had not been working',
                'has not been working',
              ],
              'type': 'Negative',
              'mm': 'သူ အလုပ်ထွက်တဲ့အချိန်မှာ ဟိုမှာ လုပ်နေတာ သိပ်မကြာသေးဘူး။',
            },
            {
              'q': 'She ___ (not/practicing) enough before the competition.',
              'a': 'had not been practicing',
              'options': [
                'had not been practicing',
                'was not practicing',
                'didn\'t practice',
              ],
              'type': 'Negative',
              'mm':
                  'ပြိုင်ပွဲမတိုင်ခင် သူမ လုံလုံလောက်လောက် လေ့ကျင့်မနေခဲ့ဘူး။',
            },
            {
              'q':
                  'They ___ (not/living) together for long when they split up.',
              'a': 'had not been living',
              'options': [
                'were not living',
                'had not been living',
                'not lived',
              ],
              'type': 'Negative',
              'mm': 'သူတို့ လမ်းခွဲတဲ့အချိန်မှာ အတူနေလာတာ သိပ်မကြာသေးဘူး။',
            },

            // --- Causality & Emphasis (Why things were a certain way) ---
            {
              'q': 'The kitchen was a mess because the kids ___ (cook).',
              'a': 'had been cooking',
              'options': [
                'were cooking',
                'had been cooking',
                'have been cooking',
              ],
              'type': 'Declarative',
              'mm':
                  'ကလေးတွေ ဟင်းချက်နေခဲ့ကြလို့ မီးဖိုချောင်တစ်ခုလုံး ရှုပ်ပွနေခဲ့တာ။',
            },
            {
              'q': 'Her eyes were red because she ___ (smoke).',
              'a': 'had been smoking',
              'options': ['was smoking', 'had been smoking', 'had smoked'],
              'type': 'Declarative',
              'mm': 'သူမ ဆေးလိပ်သောက်နေခဲ့လို့ မျက်လုံးတွေ နီနေခဲ့တာ။',
            },
            {
              'q': 'Oh! So you ___ (hide) from me all this time!',
              'a': 'had been hiding',
              'options': ['were hiding', 'had been hiding', 'have been hiding'],
              'type': 'Exclamatory',
              'mm':
                  'အော်! ဒါဆို မင်း တစ်ချိန်လုံး ငါ့ဆီကနေ ပုန်းနေခဲ့တာပေါ့လေ။',
            },
            {
              'q': 'He was out of breath! He ___ (run) for miles!',
              'a': 'had been running',
              'options': ['was running', 'had been running', 'ran'],
              'type': 'Exclamatory',
              'mm':
                  'သူ အမောတကော ဖြစ်နေတယ်! သူ မိုင်ပေါင်းများစွာ ပြေးလာခဲ့တာဖြစ်မယ်။',
            },
            {
              'q': 'We were so tired! We ___ (travel) for 24 hours straight.',
              'a': 'had been traveling',
              'options': [
                'had been traveling',
                'were traveling',
                'had traveled',
              ],
              'type': 'Declarative',
              'mm':
                  'ကျွန်တော်တို့ တအားပင်ပန်းနေပြီ! ၂၄ နာရီဆက်တိုက် ခရီးသွားနေခဲ့ကြလို့ပါ။',
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
          'quizzes': [
            // --- Declarative (Predictions & Facts) ---
            {
              'q':
                  'I think artificial intelligence ___ (change) the world even more.',
              'a': 'will change',
              'options': ['changes', 'will change', 'is change'],
              'type': 'Declarative',
              'mm':
                  'AI က ကမ္ဘာကြီးကို ပိုပြီး ပြောင်းလဲစေလိမ့်မယ်လို့ ကျွန်တော်ထင်တယ်။',
            },
            {
              'q': 'The sun ___ (rise) at 6:30 AM tomorrow.',
              'a': 'will rise',
              'options': ['will rise', 'rises', 'will rose'],
              'type': 'Declarative',
              'mm': 'မနက်ဖြန် မနက် ၆ နာရီခွဲမှာ နေထွက်လိမ့်မယ်။',
            },
            {
              'q': 'One day, people ___ (travel) to Mars.',
              'a': 'will travel',
              'options': ['travel', 'will travel', 'travelled'],
              'type': 'Declarative',
              'mm': 'တစ်နေ့မှာ လူတွေ အင်္ဂါဂြိုဟ်ကို ခရီးသွားကြလိမ့်မယ်။',
            },
            {
              'q': 'The price of iPhones ___ (go) up next year.',
              'a': 'will go',
              'options': ['goes', 'will go', 'will gone'],
              'type': 'Declarative',
              'mm': 'လာမယ့်နှစ်မှာ iPhone ဈေးတွေ တက်လိမ့်မယ်။',
            },
            {
              'q': 'I ___ (be) at the office by 9 o\'clock.',
              'a': 'will be',
              'options': ['will be', 'am', 'was'],
              'type': 'Declarative',
              'mm': 'ကိုးနာရီမှာ ကျွန်တော် ရုံးမှာ ရှိနေပါလိမ့်မယ်။',
            },

            // --- Interrogative (Asking for Favors & Predictions) ---
            {
              'q': '___ you ___ (help) me with this heavy box?',
              'a': 'Will / help',
              'options': ['Do / help', 'Will / help', 'Are / help'],
              'type': 'Interrogative',
              'mm': 'ဒီလေးတဲ့သေတ္တာကို သယ်ဖို့ ကူညီမလား။',
            },
            {
              'q': 'When ___ the package ___ (arrive)?',
              'a': 'will / arrive',
              'options': ['does / arrive', 'will / arrive', 'is / arriving'],
              'type': 'Interrogative',
              'mm': 'ပါဆယ်က ဘယ်တော့ ရောက်မှာလဲ။',
            },
            {
              'q': '___ it ___ (be) cold in London next week?',
              'a': 'Will / be',
              'options': ['Is / be', 'Will / be', 'Does / be'],
              'type': 'Interrogative',
              'mm': 'လာမယ့်အပတ် လန်ဒန်မှာ အေးမလား။',
            },
            {
              'q': 'Who ___ (win) the match tonight, do you think?',
              'a': 'will win',
              'options': ['wins', 'will win', 'winning'],
              'type': 'Interrogative',
              'mm': 'ဒီညပွဲစဉ်မှာ ဘယ်သူနိုင်မယ်လို့ မင်းထင်သလဲ။',
            },
            {
              'q': '___ you ___ (send) me the link via Viber?',
              'a': 'Will / send',
              'options': ['Do / send', 'Will / send', 'Are / send'],
              'type': 'Interrogative',
              'mm': 'ငါ့ကို Viber ကနေ လင့်ခ်ပို့ပေးမလား။',
            },

            // --- Negative (Won't / Refusal) ---
            {
              'q': 'I ___ (not/tell) anyone your secret, I promise!',
              'a': 'will not tell',
              'options': ['am not tell', 'don\'t tell', 'will not tell'],
              'type': 'Negative',
              'mm':
                  'မင်းရဲ့လျှို့ဝှက်ချက်ကို ဘယ်သူ့ကိုမှ မပြောပါဘူး၊ ကတိပေးတယ်။',
            },
            {
              'q': 'The car ___ (not/start); I think the battery is dead.',
              'a': 'will not start',
              'options': ['doesn\'t start', 'will not start', 'not start'],
              'type': 'Negative',
              'mm':
                  'ကားက စက်နှိုးလို့မရဘူး (နှိုးမှာမဟုတ်ဘူး)၊ ဘက်ထရီကုန်နေပြီထင်တယ်။',
            },
            {
              'q': 'They ___ (not/agree) to these terms.',
              'a': 'will not agree',
              'options': ['won\'t agree', 'don\'t agree', 'not agree'],
              'type': 'Negative',
              'mm': 'သူတို့ ဒီအချက်အလက်တွေကို သဘောတူမှာ မဟုတ်ဘူး။',
            },
            {
              'q': 'We ___ (not/have) enough time to visit the museum.',
              'a': 'will not have',
              'options': ['won\'t have', 'don\'t have', 'not have'],
              'type': 'Negative',
              'mm':
                  'ပြတိုက်ကို လည်ပတ်ဖို့ ကျွန်တော်တို့မှာ အချိန်အလုံအလောက် ရှိမှာမဟုတ်ဘူး။',
            },
            {
              'q': 'She ___ (not/forget) what you did for her.',
              'a': 'will not forget',
              'options': ['won\'t forget', 'doesn\'t forget', 'not forget'],
              'type': 'Negative',
              'mm':
                  'မင်းသူမအတွက် လုပ်ပေးခဲ့တာတွေကို သူမ ဘယ်တော့မှ မေ့မှာမဟုတ်ဘူး။',
            },

            // --- Instant Decisions & Promises (Real World Usage) ---
            {
              'q': 'The phone is ringing. I ___ (get) it!',
              'a': 'will get',
              'options': ['get', 'will get', 'am getting'],
              'type': 'Declarative',
              'mm': 'ဖုန်းမြည်နေတယ်၊ ငါသွားကိုင်လိုက်မယ်။',
            },
            {
              'q': 'I\'m hungry. I think I ___ (order) a pizza.',
              'a': 'will order',
              'options': ['order', 'will order', 'am order'],
              'type': 'Declarative',
              'mm': 'ဗိုက်ဆာလိုက်တာ၊ ပီဇာတစ်လုံး မှာလိုက်တော့မယ်။',
            },
            {
              'q': 'Wait! I ___ (drive) you to the airport.',
              'a': 'will drive',
              'options': ['drive', 'will drive', 'am driving'],
              'type': 'Declarative',
              'mm': 'နေဦး! လေဆိပ်ကို ငါလိုက်ပို့ပေးမယ်။',
            },
            {
              'q': 'I ___ (text) you when I get home.',
              'a': 'will text',
              'options': ['text', 'will text', 'am texting'],
              'type': 'Declarative',
              'mm': 'အိမ်ရောက်ရင် ဖုန်းလှမ်းဆက်လိုက်မယ် (စာပို့လိုက်မယ်)။',
            },
            {
              'q': 'Don\'t worry! I ___ (pay) for the coffee today.',
              'a': 'will pay',
              'options': ['pay', 'will pay', 'paid'],
              'type': 'Declarative',
              'mm': 'စိတ်မပူနဲ့! ဒီနေ့ ကော်ဖီဖိုး ငါရှင်းလိုက်မယ်။',
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
          'quizzes': [
            // --- Declarative (Future Progress) ---
            {
              'q': 'This time tomorrow, I ___ (fly) to Singapore.',
              'a': 'will be flying',
              'options': ['will fly', 'will be flying', 'am flying'],
              'type': 'Declarative',
              'mm':
                  'မနက်ဖြန် ဒီအချိန်ဆိုရင် ကျွန်တော် စင်ကာပူကို လေယာဉ်နဲ့ သွားနေမှာပါ။',
            },
            {
              'q': 'Don\'t call me at 8 PM. I ___ (watch) my favorite show.',
              'a': 'will be watching',
              'options': ['will be watching', 'will watch', 'watch'],
              'type': 'Declarative',
              'mm':
                  'ည ၈ နာရီမှာ ဖုန်းမဆက်ပါနဲ့ဦး။ ကျွန်တော် ကြိုက်တဲ့ အစီအစဉ် ကြည့်နေမှာမို့လို့ပါ။',
            },
            {
              'q': 'They ___ (stay) at the Hilton Hotel during the trip.',
              'a': 'will be staying',
              'options': ['will stay', 'will be staying', 'staying'],
              'type': 'Declarative',
              'mm':
                  'ခရီးစဉ်အတွင်းမှာ သူတို့ ဟေလ်တန်ဟိုတယ်မှာ တည်းခိုနေပါလိမ့်မယ်။',
            },
            {
              'q': 'At midnight, most of the city ___ (sleep).',
              'a': 'will be sleeping',
              'options': ['will be sleeping', 'will sleep', 'is sleep'],
              'type': 'Declarative',
              'mm':
                  'သန်းခေါင်ယံအချိန်မှာ မြို့သူမြို့သားအများစု အိပ်ပျော်နေကြမှာပါ။',
            },
            {
              'q': 'She ___ (work) in the garden all afternoon.',
              'a': 'will be working',
              'options': ['will work', 'will be working', 'works'],
              'type': 'Declarative',
              'mm': 'သူမ တစ်နေကုန် ဥယျာဉ်ထဲမှာ အလုပ်လုပ်နေပါလိမ့်မယ်။',
            },

            // --- Interrogative (Polite Inquiries) ---
            {
              'q': '___ you ___ (use) your car tomorrow?',
              'a': 'Will / be using',
              'options': ['Will / use', 'Will / be using', 'Are / use'],
              'type': 'Interrogative',
              'mm': 'မနက်ဖြန် မင်းရဲ့ကားကို သုံးနေမှာလား (သုံးဖို့ရှိသလား)။',
            },
            {
              'q': 'What ___ you ___ (do) this time next year?',
              'a': 'will / be doing',
              'options': ['will / do', 'will / be doing', 'are / doing'],
              'type': 'Interrogative',
              'mm': 'လာမယ့်နှစ် ဒီအချိန်မှာ မင်း ဘာတွေလုပ်နေမှာလဲ။',
            },
            {
              'q': '___ they ___ (join) us for dinner later?',
              'a': 'Will / be joining',
              'options': ['Will / join', 'Will / be joining', 'Do / join'],
              'type': 'Interrogative',
              'mm': 'ခဏနေရင် သူတို့ ငါတို့နဲ့အတူ ညစာစားဖို့ လာပူးပေါင်းမှာလား။',
            },
            {
              'q': 'Where ___ he ___ (live) after graduation?',
              'a': 'will / be living',
              'options': ['will / be living', 'will / live', 'is / living'],
              'type': 'Interrogative',
              'mm': 'ဘွဲ့ရပြီးရင် သူ ဘယ်မှာ နေထိုင်နေမှာလဲ။',
            },
            {
              'q': '___ it ___ (rain) when we arrive?',
              'a': 'Will / be raining',
              'options': ['Will / rain', 'Will / be raining', 'Is / raining'],
              'type': 'Interrogative',
              'mm': 'ငါတို့ရောက်တဲ့အချိန်မှာ မိုးရွာနေမှာလား။',
            },

            // --- Negative (Planned Absence of Action) ---
            {
              'q': 'I ___ (not/doing) anything special this weekend.',
              'a': 'will not be doing',
              'options': [
                'won\'t be doing',
                'not will be doing',
                'am not doing',
              ],
              'type': 'Negative',
              'mm':
                  'ဒီအပတ်ပိတ်ရက်မှာ ကျွန်တော် ထူးထူးခြားခြား ဘာမှလုပ်နေမှာ မဟုတ်ပါဘူး။',
            },
            {
              'q': 'She ___ (not/coming) to the party tonight.',
              'a': 'will not be coming',
              'options': ['won\'t be coming', 'doesn\'t come', 'not coming'],
              'type': 'Negative',
              'mm': 'သူမ ဒီညပါတီကို လာနေမှာ မဟုတ်ဘူး။',
            },
            {
              'q': 'They ___ (not/working) on Monday because it\'s a holiday.',
              'a': 'will not be working',
              'options': ['won\'t be working', 'not work', 'won\'t working'],
              'type': 'Negative',
              'mm':
                  'တနင်္လာနေ့က ရုံးပိတ်ရက်ဖြစ်လို့ သူတို့ အလုပ်လုပ်နေမှာ မဟုတ်ဘူး။',
            },
            {
              'q': 'We ___ (not/using) the meeting room tomorrow morning.',
              'a': 'will not be using',
              'options': ['won\'t be using', 'won\'t use', 'not use'],
              'type': 'Negative',
              'mm':
                  'မနက်ဖြန်မနက်မှာ ကျွန်တော်တို့ အစည်းအဝေးခန်းကို သုံးနေမှာ မဟုတ်ပါဘူး။',
            },
            {
              'q': 'The children ___ (not/going) to school during the summer.',
              'a': 'will not be going',
              'options': ['won\'t be going', 'won\'t go', 'not going'],
              'type': 'Negative',
              'mm': 'နွေရာသီမှာ ကလေးတွေ ကျောင်းသွားနေမှာ မဟုတ်ဘူး။',
            },

            // --- Predicting Future Atmospheres (Real World) ---
            {
              'q': 'Wait! If you go now, everyone ___ (have) lunch.',
              'a': 'will be having',
              'options': ['will have', 'will be having', 'is having'],
              'type': 'Declarative',
              'mm': 'နေဦး! အခုသွားမယ်ဆိုရင် အားလုံးက နေ့လယ်စာ စားနေကြမှာ။',
            },
            {
              'q': 'I suspect the team ___ (celebrate) their win right now.',
              'a': 'will be celebrating',
              'options': [
                'will be celebrating',
                'celebrates',
                'will celebrate',
              ],
              'type': 'Declarative',
              'mm':
                  'အခုအချိန်ဆို အဖွဲ့သားတွေ သူတို့အောင်ပွဲကို အောင်ပွဲခံနေကြမှာလို့ ငါထင်တယ်။',
            },
            {
              'q':
                  'Don\'t go there! The construction workers ___ (make) a lot of noise.',
              'a': 'will be making',
              'options': ['will be making', 'make', 'will make'],
              'type': 'Declarative',
              'mm':
                  'ဟိုကိုမသွားနဲ့! ဆောက်လုပ်ရေးသမားတွေက ဆူညံသံတွေ အများကြီး ထွက်နေမှာ။',
            },
            {
              'q': 'In 2050, we ___ (ride) flying cars.',
              'a': 'will be riding',
              'options': ['will ride', 'will be riding', 'are riding'],
              'type': 'Declarative',
              'mm':
                  '၂၀၅၀ ခုနှစ်မှာ ငါတို့ ပျံသန်းနိုင်တဲ့ကားတွေကို စီးနေကြမှာပါ။',
            },
            {
              'q': 'I promise I ___ (think) of you while I am away.',
              'a': 'will be thinking',
              'options': ['will be thinking', 'will think', 'am thinking'],
              'type': 'Declarative',
              'mm':
                  'ခရီးသွားနေတဲ့အချိန်မှာ မင်းအကြောင်းကို ငါတွေးနေမှာပါလို့ ကတိပေးတယ်။',
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
          'quizzes': [
            // --- Declarative (Deadlines & Milestones) ---
            {
              'q': 'By next month, I ___ (save) enough money for a new laptop.',
              'a': 'will have saved',
              'options': ['will save', 'will have saved', 'have saved'],
              'type': 'Declarative',
              'mm':
                  'နောက်လဆိုရင် ကျွန်တော် လပ်တော့ပ်အသစ်အတွက် ပိုက်ဆံ လုံလုံလောက်လောက် စုမိပြီးသား ဖြစ်လိမ့်မယ်။',
            },
            {
              'q': 'The movie ___ (start) by the time we get to the cinema.',
              'a': 'will have started',
              'options': ['will start', 'will have started', 'starts'],
              'type': 'Declarative',
              'mm':
                  'ကျွန်တော်တို့ ရုပ်ရှင်ရုံရောက်တဲ့အချိန်ဆို ရုပ်ရှင်က စနှင့်နေပြီ ဖြစ်လိမ့်မယ်။',
            },
            {
              'q': 'By 2030, scientists ___ (find) a cure for many diseases.',
              'a': 'will have found',
              'options': ['will find', 'will have found', 'found'],
              'type': 'Declarative',
              'mm':
                  '၂၀၃၀ ခုနှစ်လောက်ဆိုရင် သိပ္ပံပညာရှင်တွေ ရောဂါအတော်များများအတွက် ကုထုံးကို ရှာဖွေတွေ့ရှိပြီးသား ဖြစ်လိမ့်မယ်။',
            },
            {
              'q': 'I ___ (finish) this report by Friday afternoon.',
              'a': 'will have finished',
              'options': ['will have finished', 'will finish', 'finish'],
              'type': 'Declarative',
              'mm':
                  'သောကြာနေ့ နေ့လယ်ဆိုရင် ကျွန်တော် ဒီအစီရင်ခံစာကို အပြီးသတ်ပြီးသား ဖြစ်လိမ့်မယ်။',
            },
            {
              'q': 'They ___ (leave) before you arrive at the airport.',
              'a': 'will have left',
              'options': ['will leave', 'will have left', 'leave'],
              'type': 'Declarative',
              'mm':
                  'မင်းလေဆိပ်ရောက်တဲ့အချိန်မှာ သူတို့က ထွက်သွားနှင့်ပြီးသား ဖြစ်လိမ့်မယ်။',
            },

            // --- Interrogative (Checking Completion) ---
            {
              'q': '___ you ___ (do) your homework by dinner time?',
              'a': 'Will / have done',
              'options': ['Will / do', 'Will / have done', 'Have / done'],
              'type': 'Interrogative',
              'mm': 'ညစာမစားခင် မင်းအိမ်စာတွေ ပြီးနှင့်မှာလား။',
            },
            {
              'q': 'How many books ___ she ___ (write) by the end of the year?',
              'a': 'will / have written',
              'options': [
                'will / write',
                'will / have written',
                'does / write',
              ],
              'type': 'Interrogative',
              'mm': 'ဒီနှစ်ကုန်ရင် သူမ စာအုပ်ဘယ်နှစ်အုပ် ရေးပြီးသား ဖြစ်နေမလဲ။',
            },
            {
              'q': '___ the rain ___ (stop) by tomorrow morning?',
              'a': 'Will / have stopped',
              'options': [
                'Will / stop',
                'Will / have stopped',
                'Is / stopping',
              ],
              'type': 'Interrogative',
              'mm': 'မနက်ဖြန်မနက်ဆို မိုးက တိတ်သွားပြီးသား ဖြစ်နေမလား။',
            },
            {
              'q': '___ you ___ (live) here for ten years by next July?',
              'a': 'Will / have lived',
              'options': ['Will / have lived', 'Will / live', 'Do / live'],
              'type': 'Interrogative',
              'mm':
                  'လာမယ့် ဇူလိုင်ဆိုရင် မင်းဒီမှာနေတာ ၁၀ နှစ် ပြည့်သွားပြီလား။',
            },
            {
              'q': 'When ___ the workers ___ (complete) the bridge?',
              'a': 'will / have completed',
              'options': [
                'will / complete',
                'will / have completed',
                'are / completing',
              ],
              'type': 'Interrogative',
              'mm':
                  'အလုပ်သမားတွေက တံတားကို ဘယ်အချိန်မှာ အပြီးသတ်ပြီးသား ဖြစ်မလဲ။',
            },

            // --- Negative (Expected Non-Completion) ---
            {
              'q': 'I ___ (not/finish) the project by tomorrow morning.',
              'a': 'will not have finished',
              'options': [
                'won\'t have finished',
                'won\'t finish',
                'not finished',
              ],
              'type': 'Negative',
              'mm':
                  'မနက်ဖြန်မနက်အထိတော့ ကျွန်တော် ဒီပရောဂျက်ကို အပြီးသတ်နိုင်ဦးမှာ မဟုတ်ဘူး။',
            },
            {
              'q': 'She ___ (not/read) the whole book by the deadline.',
              'a': 'will not have read',
              'options': ['won\'t have read', 'won\'t read', 'not reading'],
              'type': 'Negative',
              'mm':
                  'သတ်မှတ်ရက်အမီ သူမ စာအုပ်တစ်အုပ်လုံးကို ဖတ်ပြီးသား ဖြစ်မှာမဟုတ်ဘူး။',
            },
            {
              'q': 'They ___ (not/return) from vacation until next week.',
              'a': 'will not have returned',
              'options': [
                'won\'t have returned',
                'won\'t return',
                'not return',
              ],
              'type': 'Negative',
              'mm':
                  'နောက်အပတ်အထိ သူတို့က အားလပ်ရက်ကနေ ပြန်ရောက်ဦးမှာ မဟုတ်ဘူး။',
            },
            {
              'q': 'We ___ (not/save) enough money by the end of this year.',
              'a': 'will not have saved',
              'options': ['won\'t have saved', 'won\'t save', 'not save'],
              'type': 'Negative',
              'mm':
                  'ဒီနှစ်ကုန်အထိတော့ ကျွန်တော်တို့ ပိုက်ဆံ လုံလုံလောက်လောက် စုမိဦးမှာ မဟုတ်ဘူး။',
            },
            {
              'q': 'He ___ (not/receive) the package by the time he leaves.',
              'a': 'will not have received',
              'options': [
                'won\'t have received',
                'won\'t receive',
                'doesn\'t receive',
              ],
              'type': 'Negative',
              'mm': 'သူ ထွက်မသွားခင်အထိ ပါဆယ်ကို ရရှိဦးမှာ မဟုတ်ဘူး။',
            },

            // --- Real World: Estimates & Accomplishments ---
            {
              'q': 'By the time you wake up, I ___ (already/arrive) in London.',
              'a': 'will have already arrived',
              'options': [
                'will have already arrived',
                'will already arrive',
                'already arrived',
              ],
              'type': 'Declarative',
              'mm':
                  'မင်းနိုးလာတဲ့အချိန်ဆိုရင် ငါ လန်ဒန်ကို ရောက်နှင့်ပြီးသား ဖြစ်နေလိမ့်မယ်။',
            },
            {
              'q': 'I ___ (cook) dinner by the time you get home.',
              'a': 'will have cooked',
              'options': ['will cook', 'will have cooked', 'am cooking'],
              'type': 'Declarative',
              'mm':
                  'မင်းအိမ်ပြန်ရောက်တဲ့အချိန်ဆိုရင် ငါ ညစာ ချက်ပြီးသား ဖြစ်နေပါလိမ့်မယ်။',
            },
            {
              'q': 'Within two hours, the sun ___ (set).',
              'a': 'will have set',
              'options': ['will set', 'will have set', 'sets'],
              'type': 'Declarative',
              'mm': 'နှစ်နာရီအတွင်းမှာ နေက ဝင်သွားပြီးသား ဖြစ်လိမ့်မယ်။',
            },
            {
              'q': 'I hope you ___ (recover) from your cold by the party.',
              'a': 'will have recovered',
              'options': ['will have recovered', 'will recover', 'recover'],
              'type': 'Declarative',
              'mm':
                  'ပါတီမတိုင်ခင် မင်း အအေးမိတာ သက်သာပြီးသား ဖြစ်လိမ့်မယ်လို့ ငါ မျှော်လင့်ပါတယ်။',
            },
            {
              'q': 'The construction ___ (end) before the rainy season starts.',
              'a': 'will have ended',
              'options': ['will end', 'will have ended', 'ends'],
              'type': 'Declarative',
              'mm':
                  'မိုးရာသီမစခင် ဆောက်လုပ်ရေး အလုပ်တွေ ပြီးဆုံးသွားပြီးသား ဖြစ်လိမ့်မယ်။',
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
          'quizzes': [
            // --- Declarative (Duration at a Future Point) ---
            {
              'q': 'By next year, I ___ (live) in Yangon for ten years.',
              'a': 'will have been living',
              'options': [
                'will have been living',
                'will be living',
                'will have lived',
              ],
              'type': 'Declarative',
              'mm':
                  'လာမယ့်နှစ်ဆိုရင် ကျွန်တော် ရန်ကုန်မှာ နေလာတာ ၁၀ နှစ် ပြည့်သွားပါလိမ့်မယ်။',
            },
            {
              'q': 'By 5 PM, she ___ (work) for eight hours straight.',
              'a': 'will have been working',
              'options': [
                'will be working',
                'will have been working',
                'has been working',
              ],
              'type': 'Declarative',
              'mm':
                  'ညနေ ၅ နာရီဆိုရင် သူမ အလုပ်လုပ်နေတာ မနားတမ်း ၈ နာရီ ရှိသွားပါလိမ့်မယ်။',
            },
            {
              'q': 'At the end of this month, we ___ (date) for two years.',
              'a': 'will have been dating',
              'options': [
                'will have been dating',
                'will be dating',
                'have been dating',
              ],
              'type': 'Declarative',
              'mm': 'ဒီလကုန်ရင် ကျွန်တော်တို့ တွဲလာတာ ၂ နှစ် ပြည့်ပါပြီ။',
            },
            {
              'q':
                  'By the time the plane lands, they ___ (fly) for twelve hours.',
              'a': 'will have been flying',
              'options': [
                'will be flying',
                'will have flying',
                'will have been flying',
              ],
              'type': 'Declarative',
              'mm':
                  'လေယာဉ်ဆင်းသက်တဲ့အချိန်မှာ သူတို့ ပျံသန်းနေခဲ့တာ ၁၂ နာရီ ရှိသွားပါလိမ့်မယ်။',
            },
            {
              'q': 'He ___ (study) for three hours by the time you arrive.',
              'a': 'will have been studying',
              'options': [
                'will have been studying',
                'will be studying',
                'is studying',
              ],
              'type': 'Declarative',
              'mm':
                  'မင်းရောက်လာတဲ့အချိန်ဆိုရင် သူ စာဖတ်နေတာ ၃ နာရီ ရှိသွားပါလိမ့်မယ်။',
            },

            // --- Interrogative (Asking about Duration) ---
            {
              'q': 'How long ___ you ___ (wait) when the bus finally arrives?',
              'a': 'will / have been waiting',
              'options': [
                'will / be waiting',
                'will / have been waiting',
                'are / waiting',
              ],
              'type': 'Interrogative',
              'mm':
                  'ဘတ်စ်ကားရောက်လာတဲ့အချိန်မှာ မင်းစောင့်နေတာ ဘယ်လောက်ကြာသွားပြီ ဖြစ်မလဲ။',
            },
            {
              'q':
                  '___ she ___ (teach) for thirty years by the time she retires?',
              'a': 'Will / have been teaching',
              'options': [
                'Will / be teaching',
                'Will / have been teaching',
                'Is / teaching',
              ],
              'type': 'Interrogative',
              'mm':
                  'သူမ အငြိမ်းစားယူတဲ့အချိန်မှာ စာသင်လာတာ နှစ် ၃၀ ရှိသွားပြီလား။',
            },
            {
              'q':
                  'By next January, ___ they ___ (renovate) this house for a year?',
              'a': 'will / have been renovating',
              'options': [
                'will / be renovating',
                'will / have been renovating',
                'do / renovate',
              ],
              'type': 'Interrogative',
              'mm':
                  'လာမယ့် ဇန်နဝါရီဆိုရင် သူတို့ ဒီအိမ်ကို ပြင်ဆင်နေတာ ၁ နှစ် ရှိသွားပြီလား။',
            },
            {
              'q':
                  'How long ___ he ___ (play) for this team by the end of the season?',
              'a': 'will / have been playing',
              'options': [
                'will / play',
                'will / be playing',
                'will / have been playing',
              ],
              'type': 'Interrogative',
              'mm':
                  'ရာသီကုန်တဲ့အချိန်မှာ သူ ဒီအသင်းအတွက် ကစားပေးနေတာ ဘယ်လောက်ကြာသွားပြီလဲ။',
            },
            {
              'q':
                  '___ we ___ (drive) for five hours by the time we reach Bagan?',
              'a': 'Will / have been driving',
              'options': [
                'Will / be driving',
                'Will / have been driving',
                'Are / driving',
              ],
              'type': 'Interrogative',
              'mm':
                  'ပုဂံရောက်တဲ့အချိန်မှာ ငါတို့ ကားမောင်းနေတာ ၅ နာရီ ရှိသွားမှာလား။',
            },

            // --- Negative (Duration not reached) ---
            {
              'q':
                  'I ___ (not/working) here for very long by the time I leave.',
              'a': 'will not have been working',
              'options': [
                'won\'t have been working',
                'won\'t be working',
                'not working',
              ],
              'type': 'Negative',
              'mm':
                  'ကျွန်တော် ထွက်သွားတဲ့အချိန်မှာ ဒီမှာ အလုပ်လုပ်သက်က သိပ်မကြာသေးဘူး ဖြစ်လိမ့်မယ်။',
            },
            {
              'q':
                  'She ___ (not/living) in London for a year yet by next week.',
              'a': 'will not have been living',
              'options': [
                'won\'t have been living',
                'won\'t be living',
                'not lived',
              ],
              'type': 'Negative',
              'mm':
                  'လာမယ့်အပတ်ဆိုရင် သူမ လန်ဒန်မှာ နေတာ ၁ နှစ် မပြည့်သေးပါဘူး။',
            },
            {
              'q': 'They ___ (not/practicing) for long before the show starts.',
              'a': 'will not have been practicing',
              'options': [
                'won\'t have been practicing',
                'won\'t practice',
                'don\'t practice',
              ],
              'type': 'Negative',
              'mm': 'ပွဲမစခင် သူတို့ လေ့ကျင့်နေတာ သိပ်မကြာသေးပါဘူး။',
            },
            {
              'q':
                  'We ___ (not/traveling) for even a day by the time we get there.',
              'a': 'will not have been traveling',
              'options': [
                'won\'t have been traveling',
                'won\'t be traveling',
                'not travel',
              ],
              'type': 'Negative',
              'mm':
                  'ဟိုကိုရောက်တဲ့အချိန်ဆိုရင် ကျွန်တော်တို့ ခရီးသွားနေတာ တစ်ရက်တောင် မပြည့်သေးပါဘူး။',
            },
            {
              'q': 'He ___ (not/sleeping) for long when the alarm goes off.',
              'a': 'will not have been sleeping',
              'options': [
                'won\'t have been sleeping',
                'won\'t sleep',
                'isn\'t sleeping',
              ],
              'type': 'Negative',
              'mm':
                  'အချက်ပေးသံမြည်တဲ့အချိန်မှာ သူ အိပ်ပျော်နေတာ သိပ်မကြာသေးပါဘူး။',
            },

            // --- Realistic Scenarios: Milestones & Effort ---
            {
              'q':
                  'By the time I finish this course, I ___ (learn) English for six months.',
              'a': 'will have been learning',
              'options': [
                'will have been learning',
                'will be learning',
                'learned',
              ],
              'type': 'Declarative',
              'mm':
                  'ဒီသင်တန်းပြီးတဲ့အချိန်မှာ ကျွန်တော် အင်္ဂလိပ်စာ သင်ယူနေတာ ၆ လ ရှိသွားပါလိမ့်မယ်။',
            },
            {
              'q':
                  'You ___ (stand) in the queue for an hour before you get a ticket.',
              'a': 'will have been standing',
              'options': [
                'will be standing',
                'will have been standing',
                'stood',
              ],
              'type': 'Declarative',
              'mm':
                  'လက်မှတ်မရခင်အထိ မင်း တန်းစီစောင့်နေရတာ ၁ နာရီလောက် ရှိသွားလိမ့်မယ်။',
            },
            {
              'q': 'My parents ___ (marry) for 40 years next December.',
              'a': 'will have been married',
              'options': [
                'will have been marrying',
                'will have been married',
                'will marry',
              ],
              'type': 'Declarative',
              'mm':
                  'လာမယ့် ဒီဇင်ဘာဆိုရင် ကျွန်တော့်မိဘတွေ အိမ်ထောင်သက် ၄၀ ရှိပါပြီ။',
            },
            {
              'q': 'I ___ (wait) for you for ages by the time you arrive!',
              'a': 'will have bpeen waiting',
              'options': [
                'will be waiting',
                'will have been waiting',
                'waited',
              ],
              'type': 'Exclamatory',
              'mm':
                  'မင်းရောက်လာတဲ့အချိန်ဆိုရင် ငါ စောင့်နေတာ ကမ္ဘာပျက်မတတ် ကြာနေလိမ့်မယ်။',
            },
            {
              'q':
                  'By next year, the team ___ (develop) this app for two years.',
              'a': 'will have been developing',
              'options': [
                'will have been developing',
                'will be developing',
                'developed',
              ],
              'type': 'Declarative',
              'mm':
                  'လာမယ့်နှစ်ဆိုရင် အဖွဲ့သားတွေ ဒီ App ကို ဖန်တီးနေတာ ၂ နှစ် ရှိသွားပါလိမ့်မယ်။',
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizLessonPage(
              quizData: tense['quizzes'],
              tenseTitle: tense['title'],
            ),
          ),
        ),
        label: const Text("Take a Quiz"),
        icon: const Icon(Icons.play_arrow),
      ),
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
