import 'package:flutter/material.dart';

import 'quiz_lesson_page.dart';

class PassiveVoiceScreen extends StatelessWidget {
  const PassiveVoiceScreen({super.key});

  final List<Map<String, dynamic>> passiveVoiceData = const [
    {
      'group':
          'Commonly Used Passive Forms (အသုံးများသော Passive ပုံစံ ၈ မျိုး)',
      'items': [
        {
          'title': 'Present Simple Passive',
          'formula': 'Am / Is / Are + V3',
          'usage':
              'ပုံမှန်လုပ်ဆောင်လေ့ရှိသော အခြေအနေများ သို့မဟုတ် အမှန်တရားများကို Passive ပုံစံဖြင့် ဖော်ပြရာတွင် သုံးသည်။',
          'examples': [
            {
              'active': 'Farmers grow rice in Myanmar.',
              'active_mm':
                  'လယ်သမားများသည် မြန်မာနိုင်ငံတွင် ဆန်စပါးကို စိုက်ပျိုးကြသည်။',
              'passive': 'Rice is grown in Myanmar by farmers.',
              'passive_mm':
                  'မြန်မာနိုင်ငံတွင် ဆန်စပါးကို လယ်သမားများက စိုက်ပျိုးကြသည် (စိုက်ပျိုးခြင်းခံရသည်)။',
            },
            {
              'active': 'The staff sends emails every day.',
              'active_mm': 'ဝန်ထမ်းများသည် နေ့တိုင်း အီးမေးလ်များ ပို့ကြသည်။',
              'passive': 'Emails are sent every day by the staff.',
              'passive_mm':
                  'အီးမေးလ်များကို ဝန်ထမ်းများက နေ့တိုင်း ပေးပို့ကြသည် (ပေးပို့ခြင်းခံရသည်)။',
            },
            {
              'active': 'People speak English all over the world.',
              'active_mm':
                  'လူများသည် တစ်ကမ္ဘာလုံးတွင် အင်္ဂလိပ်စာကို ပြောဆိုကြသည်။',
              'passive': 'English is spoken all over the world.',
              'passive_mm':
                  'အင်္ဂလိပ်စာကို တစ်ကမ္ဘာလုံးတွင် ပြောဆိုကြသည် (ပြောဆိုခြင်းခံရသည်)။',
            },
            {
              'active': 'The manager trains new employees.',
              'active_mm': 'မန်နေဂျာသည် ဝန်ထမ်းအသစ်များကို လေ့ကျင့်ပေးသည်။',
              'passive': 'New employees are trained by the manager.',
              'passive_mm':
                  'ဝန်ထမ်းအသစ်များသည် မန်နေဂျာ၏ လေ့ကျင့်ပေးခြင်းကို ခံရသည်။',
            },
            {
              'active': 'We lock the office at 6 PM.',
              'active_mm': 'ကျွန်ုပ်တို့သည် ရုံးကို ညနေ ၆ နာရီတွင် ပိတ်သည်။',
              'passive': 'The office is locked at 6 PM.',
              'passive_mm': 'ရုံးသည် ညနေ ၆ နာရီတွင် ပိတ်သည် (ပိတ်ခြင်းခံရသည်)။',
            },
          ],
          'quizzes': [
            {
              'q': 'Many movies ___ (produce) in Hollywood.',
              'a': 'are produced',
              'options': ['is produced', 'are produced', 'are producing'],
              'type': 'Present Simple Passive',
              'mm': 'ဟောလိဝုဒ်မှာ ရုပ်ရှင်အများအပြား ထုတ်လုပ်ပါတယ်။',
            },
            {
              'q': 'This street ___ (sweep) every day.',
              'a': 'is swept',
              'options': ['is sweep', 'is swept', 'are swept'],
              'type': 'Present Simple Passive',
              'mm': 'ဒီလမ်းကို နေ့တိုင်း တံမြက်လှည်းပါတယ်။',
            },
            {
              'q': 'Paper ___ (make) from wood.',
              'a': 'is made',
              'options': ['is make', 'is made', 'are made'],
              'type': 'Present Simple Passive',
              'mm': 'စက္ကူကို သစ်သားကနေ ပြုလုပ်ပါတယ်။',
            },
            {
              'q': '___ coffee ___ (grow) in Brazil?',
              'a': 'Is coffee grown',
              'options': [
                'Is coffee grown',
                'Are coffee grown',
                'Does coffee grown',
              ],
              'type': 'Passive Question',
              'mm': 'ဘရာဇီးမှာ ကော်ဖီ စိုက်ပျိုးပါသလား။',
            },
            {
              'q': 'The children ___ (not/allow) to play here.',
              'a': 'are not allowed',
              'options': ['is not allowed', 'are not allowed', 'not allow'],
              'type': 'Negative Passive',
              'mm': 'ကလေးတွေကို ဒီမှာ ကစားခွင့် မပြုပါဘူး။',
            },
            {
              'q': 'Millions of text messages ___ (send) every minute.',
              'a': 'are sent',
              'options': ['is sent', 'are sent', 'send'],
              'type': 'Present Simple Passive',
              'mm': 'မိနစ်တိုင်းမှာ စာတိုသန်းပေါင်းများစွာ ပေးပို့နေကြပါတယ်။',
            },
            {
              'q': 'Computers ___ (use) in almost every office.',
              'a': 'are used',
              'options': ['is used', 'are used', 'use'],
              'type': 'Present Simple Passive',
              'mm': 'ကွန်ပျူတာတွေကို ရုံးတိုင်းနီးပါးမှာ အသုံးပြုကြပါတယ်။',
            },
            {
              'q': 'Wine ___ (not/sell) to people under 18.',
              'a': 'is not sold',
              'options': ['is not sold', 'are not sold', 'is not sell'],
              'type': 'Restriction',
              'mm': 'အသက် ၁၈ နှစ်အောက် ကလေးတွေကို ဝိုင်မရောင်းပါဘူး။',
            },
            {
              'q': 'How ___ this word ___ (spell)?',
              'a': 'is this word spelled',
              'options': [
                'is this word spell',
                'is this word spelled',
                'does this word spelled',
              ],
              'type': 'Passive Question',
              'mm': 'ဒီစာလုံးကို အသံထွက် ဘယ်လိုပေါင်းသလဲ။',
            },
            {
              'q': 'New employees ___ (train) by the manager.',
              'a': 'are trained',
              'options': ['is trained', 'are trained', 'trained'],
              'type': 'Business Context',
              'mm': 'ဝန်ထမ်းအသစ်တွေကို မန်နေဂျာက လေ့ကျင့်ပေးပါတယ်။',
            },
          ],
        },
        {
          'title': 'Present Continuous Passive',
          'formula': 'Am / Is / Are + being + V3',
          'usage':
              'ယခုလက်ရှိ လုပ်ဆောင်နေဆဲ အရာတစ်ခုကို အပြုခံရသူဘက်မှ အလေးပေးပြောဆိုရာတွင် သုံးသည်။',
          'examples': [
            {
              'active': 'They are building a new hospital near the park.',
              'active_mm':
                  '၎င်းတို့သည် ပန်းခြံအနီးတွင် ဆေးရုံအသစ်တစ်ရုံကို တည်ဆောက်နေကြသည်။',
              'passive': 'A new hospital is being built near the park.',
              'passive_mm':
                  'ပန်းခြံအနီးတွင် ဆေးရုံအသစ်တစ်ရုံသည် တည်ဆောက်ခြင်းခံနေရသည် (တည်ဆောက်နေဆဲဖြစ်သည်။)။',
            },
            {
              'active': 'The mechanic is repairing my car right now.',
              'active_mm': 'စက်ပြင်ဆရာသည် ကျွန်ုပ်၏ကားကို ယခုပြင်ဆင်နေသည်။',
              'passive': 'My car is being repaired by the mechanic right now.',
              'passive_mm':
                  'ကျွန်ုပ်၏ကားသည် ယခုအချိန်တွင် စက်ပြင်ဆရာ၏ ပြင်ဆင်ခြင်းကို ခံနေရသည်။',
            },
            {
              'active': 'The chef is preparing a special dinner.',
              'active_mm': 'စားဖိုမှူးသည် ထူးရှယ်ညစာတစ်နပ်ကို ပြင်ဆင်နေသည်။',
              'passive': 'A special dinner is being prepared by the chef.',
              'passive_mm':
                  'ထူးရှယ်ညစာတစ်နပ်သည် စားဖိုမှူး၏ ပြင်ဆင်ခြင်းကို ခံနေရသည်။',
            },
            {
              'active': 'The police are questioning the suspect.',
              'active_mm': 'ရဲတပ်ဖွဲ့သည် သံသယရှိသူအား စစ်ဆေးမေးမြန်းနေသည်။',
              'passive': 'The suspect is being questioned by the police.',
              'passive_mm':
                  'သံသယရှိသူသည် ရဲတပ်ဖွဲ့၏ စစ်ဆေးမေးမြန်းခြင်းကို ခံနေရသည်။',
            },
            {
              'active': 'The server is cleaning the tables.',
              'active_mm': 'စားပွဲထိုးသည် စားပွဲများကို သန့်ရှင်းရေးလုပ်နေသည်။',
              'passive': 'The tables are being cleaned by the server.',
              'passive_mm':
                  'စားပွဲများသည် စားပွဲထိုး၏ သန့်ရှင်းရေးပြုလုပ်ခြင်းကို ခံနေရသည်။',
            },
            {
              'active': 'The teacher is checking the exam papers.',
              'active_mm': 'ဆရာမသည် စာမေးပွဲအဖြေလွှာများကို စစ်ဆေးနေသည်။',
              'passive': 'The exam papers are being checked by the teacher.',
              'passive_mm':
                  'စာမေးပွဲအဖြေလွှာများသည် ဆရာမ၏ စစ်ဆေးခြင်းကို ခံနေရသည်။',
            },
            {
              'active': 'They are interviewing the famous actor.',
              'active_mm':
                  '၎င်းတို့သည် နာမည်ကြီးမင်းသားအား လူတွေ့မေးမြန်းနေကြသည်။',
              'passive': 'The famous actor is being interviewed.',
              'passive_mm':
                  'နာမည်ကြီးမင်းသားသည် လူတွေ့မေးမြန်းခြင်းကို ခံနေရသည်။',
            },
            {
              'active': 'The artist is painting a beautiful landscape.',
              'active_mm':
                  'ပန်းချီဆရာသည် လှပသော ရှုခင်းပန်းချီကားတစ်ချပ်ကို ရေးဆွဲနေသည်။',
              'passive':
                  'A beautiful landscape is being painted by the artist.',
              'passive_mm':
                  'လှပသော ရှုခင်းပန်းချီကားတစ်ချပ်သည် ပန်းချီဆရာ၏ ရေးဆွဲခြင်းကို ခံနေရသည်။',
            },
            {
              'active': 'The IT department is updating the software.',
              'active_mm': 'အိုင်တီဌာနသည် ဆော့ဖ်ဝဲကို အဆင့်မြှင့်တင်နေသည်။',
              'passive': 'The software is being updated by the IT department.',
              'passive_mm':
                  'ဆော့ဖ်ဝဲသည် အိုင်တီဌာန၏ အဆင့်မြှင့်တင်ခြင်းကို ခံနေရသည်။',
            },
            {
              'active': 'The kids are watching a cartoon.',
              'active_mm': 'ကလေးများသည် ကာတွန်းကားတစ်ကားကို ကြည့်နေကြသည်။',
              'passive': 'A cartoon is being watched by the kids.',
              'passive_mm':
                  'ကာတွန်းကားတစ်ကားသည် ကလေးများ၏ ကြည့်ရှုခြင်းကို ခံနေရသည်။',
            },
          ],
          'quizzes': [
            {
              'q': 'The documents ___ (print) at the moment.',
              'a': 'are being printed',
              'options': ['is printing', 'are being printed', 'are printed'],
              'type': 'Progressive',
              'mm': 'စာရွက်စာတမ်းများကို ယခုအချိန်တွင် ပရင့်ထုတ်နေပါသည်။',
            },
            {
              'q': 'Listen! A story ___ (tell) by the grandmother.',
              'a': 'is being told',
              'options': ['is telling', 'is being told', 'is told'],
              'type': 'Progressive',
              'mm': 'နားထောင်ပါ။ အဘွားက ပုံပြင်တစ်ပုဒ် ပြောပြနေပါသည်။',
            },
            {
              'q': 'The garden ___ (water) by my father right now.',
              'a': 'is being watered',
              'options': [
                'is watering',
                'is being watered',
                'are being watered',
              ],
              'type': 'Progressive',
              'mm': 'ဖခင်သည် ယခုအချိန်တွင် ဥယျာဉ်ထဲ၌ ရေလောင်းနေပါသည်။',
            },
            {
              'q':
                  'Active: "She is cleaning the floor." -> Passive: The floor ___ (clean).',
              'a': 'is being cleaned',
              'options': ['is cleaning', 'is being cleaned', 'is cleaned'],
              'type': 'Conversion',
              'mm':
                  'သူမသည် ကြမ်းပြင်ကို သန့်ရှင်းရေးလုပ်နေသည်။ -> ကြမ်းပြင်သည် သန့်ရှင်းရေးလုပ်ခြင်းခံနေရသည်။',
            },
            {
              'q': 'Why ___ the old trees ___ (cut down) currently?',
              'a': 'are the old trees being cut down',
              'options': [
                'are the old trees being cut down',
                'is the old tree being cut down',
                'are the old trees cutting down',
              ],
              'type': 'Question',
              'mm':
                  'ဘာကြောင့် သစ်ပင်အိုကြီးများကို လက်ရှိတွင် ခုတ်လှဲနေကြသနည်း။',
            },
            {
              'q': 'A new road ___ (design) by the engineers.',
              'a': 'is being designed',
              'options': [
                'is designing',
                'is being designed',
                'are being designed',
              ],
              'type': 'Progressive',
              'mm': 'လမ်းအသစ်ကို အင်ဂျင်နီယာများက ပုံစံထုတ်နေကြပါသည်။',
            },
            {
              'q': 'The house ___ (not/use) during the renovation.',
              'a': 'is not being used',
              'options': [
                'is not using',
                'is not being used',
                'are not being used',
              ],
              'type': 'Negative',
              'mm': 'ပြုပြင်မွမ်းမံနေစဉ်အတွင်း အိမ်ကို အသုံးမပြုပါ။',
            },
            {
              'q':
                  'Active: "They are serving lunch." -> Passive: Lunch ___ (serve).',
              'a': 'is being served',
              'options': ['is serving', 'is being served', 'is served'],
              'type': 'Conversion',
              'mm':
                  '၎င်းတို့သည် နေ့လယ်စာ ကျွေးမွေးနေကြသည်။ -> နေ့လယ်စာကို တည်ခင်းကျွေးမွေးနေပါသည်။',
            },
            {
              'q': 'The children ___ (take) to the zoo today.',
              'a': 'are being taken',
              'options': ['is being taken', 'are being taken', 'are taking'],
              'type': 'Progressive',
              'mm': 'ကလေးများကို ယနေ့ တိရစ္ဆာန်ရုံသို့ ခေါ်ဆောင်သွားနေပါသည်။',
            },
            {
              'q': 'Wait! Your computer ___ (scan) for viruses.',
              'a': 'is being scanned',
              'options': [
                'is scanning',
                'is being scanned',
                'are being scanned',
              ],
              'type': 'Progressive',
              'mm':
                  'ခဏစောင့်ပါ။ သင်၏ကွန်ပျူတာကို ဗိုင်းရပ်စ်ရှိမရှိ စစ်ဆေးနေပါသည်။',
            },
            {
              'q': 'A lot of money ___ (spend) on this project lately.',
              'a': 'is being spent',
              'options': ['is spending', 'is being spent', 'are being spent'],
              'type': 'Progressive',
              'mm':
                  'ဤစီမံကိန်းတွင် မကြာသေးမီက ငွေအမြောက်အမြား အသုံးပြုနေပါသည်။',
            },
            {
              'q':
                  'Active: "Are they fixed the roof?" -> Passive: ___ the roof ___ (fix)?',
              'a': 'Is the roof being fixed',
              'options': [
                'Is the roof being fixed',
                'Are the roof being fixed',
                'Is the roof fixing',
              ],
              'type': 'Question Conversion',
              'mm':
                  '၎င်းတို့ ခေါင်မိုးကို ပြင်နေသလား။ -> ခေါင်မိုးသည် ပြင်ဆင်ခြင်းခံနေရသလား။',
            },
            {
              'q': 'The suspect ___ (follow) by the detectives.',
              'a': 'is being followed',
              'options': [
                'is following',
                'is being followed',
                'are being followed',
              ],
              'type': 'Progressive',
              'mm':
                  'သံသယရှိသူသည် စုံထောက်များ၏ နောက်ယောင်ခံလိုက်ခြင်းကို ခံနေရသည်။',
            },
            {
              'q': 'New products ___ (develop) by our company.',
              'a': 'are being developed',
              'options': [
                'is being developed',
                'are being developed',
                'are developing',
              ],
              'type': 'Business',
              'mm':
                  'ကျွန်ုပ်တို့ကုမ္ပဏီမှ ထုတ်ကုန်အသစ်များကို ထုတ်လုပ်နေပါသည်။',
            },
            {
              'q': 'The classroom ___ (clean) right now.',
              'a': 'is being cleaned',
              'options': ['is cleaning', 'is being cleaned', 'was cleaned'],
              'type': 'Progressive',
              'mm': 'စာသင်ခန်းကို ယခုအချိန်တွင် သန့်ရှင်းရေးလုပ်နေပါသည်။',
            },
          ],
        },
        {
          'title': 'Present Perfect Passive',
          'formula': 'Have / Has + been + V3',
          'usage':
              'ပြီးစီးသွားသော အပြုအမူတစ်ခုကို အပြုခံရသူဘက်မှ အလေးပေးပြောဆိုရာတွင် သုံးသည်။ (ရလဒ်သည် လက်ရှိအချိန်ထိ သက်ရောက်မှုရှိနေဆဲဖြစ်သည်။)',
          'examples': [
            {
              'active': 'The manager has approved the proposal.',
              'active_mm':
                  'မန်နေဂျာသည် အဆိုပြုလွှာကို အတည်ပြုပေးခဲ့ပြီးဖြစ်သည်။',
              'passive': 'The proposal has been approved by the manager.',
              'passive_mm':
                  'အဆိုပြုလွှာသည် မန်နေဂျာ၏ အတည်ပြုခြင်းကို ခံရပြီးဖြစ်သည်။',
            },
            {
              'active': 'Someone has stolen my bicycle.',
              'active_mm':
                  'တစ်စုံတစ်ယောက်သည် ကျွန်ုပ်၏စက်ဘီးကို ခိုးယူသွားခဲ့သည်။',
              'passive': 'My bicycle has been stolen.',
              'passive_mm': 'ကျွန်ုပ်၏စက်ဘီးသည် ခိုးယူခြင်းခံလိုက်ရသည်။',
            },
            {
              'active': 'The government has changed the law.',
              'active_mm': 'အစိုးရသည် ဥပဒေကို ပြောင်းလဲခဲ့ပြီးဖြစ်သည်။',
              'passive': 'The law has been changed by the government.',
              'passive_mm': 'ဥပဒေသည် အစိုးရ၏ ပြောင်းလဲခြင်းကို ခံခဲ့ရသည်။',
            },
            {
              'active': 'We have finished the project on time.',
              'active_mm':
                  'ကျွန်ုပ်တို့သည် စီမံကိန်းကို အချိန်မီ အပြီးသတ်ခဲ့ကြသည်။',
              'passive': 'The project has been finished on time.',
              'passive_mm': 'စီမံကိန်းသည် အချိန်မီ ပြီးစီးခဲ့ပြီးဖြစ်သည်။',
            },
            {
              'active': 'The company has hired two new designers.',
              'active_mm':
                  'ကုမ္ပဏီသည် ဒီဇိုင်နာအသစ်နှစ်ဦးကို ခန့်အပ်ခဲ့ပြီးဖြစ်သည်။',
              'passive': 'Two new designers have been hired by the company.',
              'passive_mm':
                  'ဒီဇိုင်နာအသစ်နှစ်ဦးသည် ကုမ္ပဏီ၏ ခန့်အပ်ခြင်းကို ခံခဲ့ရသည်။',
            },
            {
              'active': 'The author has written a new book.',
              'active_mm':
                  'စာရေးဆရာသည် စာအုပ်အသစ်တစ်အုပ်ကို ရေးသားခဲ့ပြီးဖြစ်သည်။',
              'passive': 'A new book has been written by the author.',
              'passive_mm':
                  'စာအုပ်အသစ်တစ်အုပ်သည် စာရေးဆရာ၏ ရေးသားခြင်းကို ခံခဲ့ရသည်။',
            },
            {
              'active': 'The cleaners have vacuumed the carpet.',
              'active_mm':
                  'သန့်ရှင်းရေးဝန်ထမ်းများသည် ကော်ဇောကို ဖုန်စုပ်ခဲ့ကြသည်။',
              'passive': 'The carpet has been vacuumed by the cleaners.',
              'passive_mm':
                  'ကော်ဇောသည် သန့်ရှင်းရေးဝန်ထမ်းများ၏ ဖုန်စုပ်သန့်ရှင်းခြင်းကို ခံခဲ့ရသည်။',
            },
            {
              'active': 'They have invited many guests to the wedding.',
              'active_mm':
                  '၎င်းတို့သည် မင်္ဂလာဆောင်သို့ ဧည့်သည်အများအပြားကို ဖိတ်ကြားခဲ့ကြသည်။',
              'passive': 'Many guests have been invited to the wedding.',
              'passive_mm':
                  'ဧည့်သည်အများအပြားသည် မင်္ဂလာဆောင်သို့ ဖိတ်ကြားခြင်းကို ခံခဲ့ရသည်။',
            },
            {
              'active': 'The technician has fixed the internet connection.',
              'active_mm':
                  'ကျွမ်းကျင်သူသည် အင်တာနက်လိုင်းကို ပြင်ဆင်ခဲ့ပြီးဖြစ်သည်။',
              'passive': 'The internet connection has been fixed.',
              'passive_mm': 'အင်တာနက်လိုင်းသည် ပြင်ဆင်ပြီးစီးခဲ့ပြီဖြစ်သည်။',
            },
            {
              'active': 'Scientists have discovered a new planet.',
              'active_mm':
                  'သိပ္ပံပညာရှင်များသည် ဂြိုဟ်အသစ်တစ်ခုကို ရှာဖွေတွေ့ရှိခဲ့ကြသည်။',
              'passive': 'A new planet has been discovered by scientists.',
              'passive_mm':
                  'ဂြိုဟ်အသစ်တစ်ခုကို သိပ္ပံပညာရှင်များက ရှာဖွေတွေ့ရှိခဲ့ကြသည်။',
            },
          ],
          'quizzes': [
            {
              'q': 'The report ___ (finish) by the secretary.',
              'a': 'has been finished',
              'options': [
                'has finished',
                'has been finished',
                'have been finished',
              ],
              'type': 'Perfect Passive',
              'mm': 'အစီရင်ခံစာသည် အတွင်းရေးမှူး၏ အပြီးသတ်ခြင်းကို ခံခဲ့ရသည်။',
            },
            {
              'q': 'All the tickets ___ (sell) already.',
              'a': 'have been sold',
              'options': ['has been sold', 'have been sold', 'have sold'],
              'type': 'Perfect Passive',
              'mm': 'လက်မှတ်အားလုံး ရောင်းချပြီးဖြစ်ပါသည်။',
            },
            {
              'q':
                  'Active: "Someone has opened the window." -> Passive: The window ___ (open).',
              'a': 'has been opened',
              'options': ['has been opened', 'have been opened', 'is opened'],
              'type': 'Conversion',
              'mm':
                  'တစ်စုံတစ်ယောက်သည် ပြတင်းပေါက်ကို ဖွင့်ထားသည်။ -> ပြတင်းပေါက်သည် ဖွင့်ထားခြင်းခံရသည်။',
            },
            {
              'q': '___ the letters ___ (post) yet?',
              'a': 'Have the letters been posted',
              'options': [
                'Has the letters been posted',
                'Have the letters been posted',
                'Have the letters posted',
              ],
              'type': 'Question',
              'mm': 'စာများကို စာတိုက်သို့ ပေးပို့ပြီးပြီလား။',
            },
            {
              'q': 'The meeting ___ (cancel) due to the rain.',
              'a': 'has been cancelled',
              'options': [
                'has cancelled',
                'has been cancelled',
                'is being cancelled',
              ],
              'type': 'Perfect Passive',
              'mm': 'မိုးရွာသွန်းမှုကြောင့် အစည်းအဝေးကို ဖျက်သိမ်းလိုက်ရသည်။',
            },
            {
              'q':
                  'Active: "They have built a new school." -> Passive: A new school ___ (build).',
              'a': 'has been built',
              'options': ['has built', 'has been built', 'was built'],
              'type': 'Conversion',
              'mm':
                  '၎င်းတို့သည် ကျောင်းအသစ်တစ်ကျောင်းကို တည်ဆောက်ခဲ့ကြသည်။ -> ကျောင်းအသစ်တစ်ကျောင်းသည် တည်ဆောက်ပြီးစီးခဲ့ပြီ။',
            },
            {
              'q': 'Many trees ___ (plant) in the park this year.',
              'a': 'have been planted',
              'options': [
                'has been planted',
                'have been planted',
                'have planted',
              ],
              'type': 'Perfect Passive',
              'mm':
                  'ယခုနှစ်အတွင်း ပန်းခြံထဲ၌ သစ်ပင်အများအပြားကို စိုက်ပျိုးခဲ့ကြသည်။',
            },
            {
              'q': 'My password ___ (change) recently.',
              'a': 'has been changed',
              'options': [
                'has been changed',
                'have been changed',
                'was change',
              ],
              'type': 'Perfect Passive',
              'mm': 'ကျွန်ုပ်၏ စကားဝှက်ကို မကြာသေးမီက ပြောင်းလဲခဲ့ပြီးဖြစ်သည်။',
            },
            {
              'q':
                  'Active: "Has he fixed the computer?" -> Passive: ___ the computer ___ (fix)?',
              'a': 'Has the computer been fixed',
              'options': [
                'Has the computer been fixed',
                'Have the computer been fixed',
                'Has the computer fixed',
              ],
              'type': 'Question Conversion',
              'mm':
                  'သူ ကွန်ပျူတာကို ပြင်ပြီးပြီလား။ -> ကွန်ပျူတာသည် ပြင်ဆင်ပြီးစီးပြီလား။',
            },
            {
              'q': 'The suspect ___ (arrest) by the police.',
              'a': 'has been arrested',
              'options': [
                'has been arrested',
                'have been arrested',
                'is arrested',
              ],
              'type': 'Perfect Passive',
              'mm': 'သံသယရှိသူသည် ရဲတပ်ဖွဲ့၏ ဖမ်းဆီးခြင်းကို ခံခဲ့ရသည်။',
            },
            {
              'q': 'Dinner ___ (not/serve) yet.',
              'a': 'has not been served',
              'options': [
                'has not been served',
                'have not been served',
                'is not served',
              ],
              'type': 'Negative',
              'mm': 'ညစာကို တည်ခင်းကျွေးမွေးခြင်း မရှိသေးပါ။',
            },
            {
              'q':
                  'Active: "We have won the match." -> Passive: The match ___ (win).',
              'a': 'has been won',
              'options': ['has been won', 'have been won', 'is won'],
              'type': 'Conversion',
              'mm':
                  'ကျွန်ုပ်တို့သည် ပွဲစဉ်ကို အနိုင်ရရှိခဲ့သည်။ -> ပွဲစဉ်သည် အနိုင်ရရှိခြင်း ခံရသည်။',
            },
            {
              'q': 'The car ___ (wash) thoroughly.',
              'a': 'has been washed',
              'options': ['has washed', 'has been washed', 'is washed'],
              'type': 'Perfect Passive',
              'mm': 'ကားကို သေသေချာချာ ဆေးကြောပြီးဖြစ်ပါသည်။',
            },
            {
              'q': 'Thousands of jobs ___ (lose) during the crisis.',
              'a': 'have been lost',
              'options': ['has been lost', 'have been lost', 'lost'],
              'type': 'Perfect Passive',
              'mm':
                  'အကျပ်အတည်းကာလအတွင်း အလုပ်အကိုင်ပေါင်း ထောင်ချီ ဆုံးရှုံးခဲ့ရသည်။',
            },
            {
              'q': '___ any decision ___ (make) yet?',
              'a': 'Has any decision been made',
              'options': [
                'Has any decision been made',
                'Have any decision been made',
                'Is any decision made',
              ],
              'type': 'Question',
              'mm': 'မည်သည့် ဆုံးဖြတ်ချက်ကိုမဆို ချမှတ်ပြီးပြီလား။',
            },
          ],
        },
        {
          'title': 'Past Simple Passive',
          'formula': 'Was / Were + V3',
          'usage':
              'အတိတ်က ပြီးဆုံးခဲ့သော လုပ်ဆောင်ချက်တစ်ခုကို အပြုခံရသူဘက်မှ အလေးပေးပြောဆိုရာတွင် သုံးသည်။',
          'examples': [
            {
              'active': 'Alexander Graham Bell invented the telephone.',
              'active_mm':
                  'အလက်ဇန်းဒါး ဂရေဟမ်ဘဲလ်သည် တယ်လီဖုန်းကို တီထွင်ခဲ့သည်။',
              'passive': 'The telephone was invented by Alexander Graham Bell.',
              'passive_mm':
                  'တယ်လီဖုန်းသည် အလက်ဇန်းဒါး ဂရေဟမ်ဘဲလ်၏ တီထွင်ခြင်းကို ခံခဲ့ရသည်။',
            },
            {
              'active': 'The storm destroyed several houses.',
              'active_mm':
                  'မုန်တိုင်းသည် အိမ်ခြေအတော်များများကို ဖျက်ဆီးခဲ့သည်။',
              'passive': 'Several houses were destroyed by the storm.',
              'passive_mm':
                  'အိမ်ခြေအတော်များများသည် မုန်တိုင်း၏ ဖျက်ဆီးခြင်းကို ခံခဲ့ရသည်။',
            },
            {
              'active': 'Shakespeare wrote "Hamlet".',
              'active_mm':
                  'ရှေးဟတ်စပီးယားသည် "ဟမ်းလက်" ပြဇာတ်ကို ရေးသားခဲ့သည်။',
              'passive': '"Hamlet" was written by Shakespeare.',
              'passive_mm':
                  '"ဟမ်းလက်" ပြဇာတ်သည် ရှေးဟတ်စပီးယား၏ ရေးသားခြင်းကို ခံခဲ့ရသည်။',
            },
            {
              'active': 'The police caught the thief yesterday.',
              'active_mm': 'ရဲတပ်ဖွဲ့သည် မနေ့က သူခိုးကို ဖမ်းဆီးခဲ့သည်။',
              'passive': 'The thief was caught by the police yesterday.',
              'passive_mm':
                  'သူခိုးသည် မနေ့က ရဲတပ်ဖွဲ့၏ ဖမ်းဆီးခြင်းကို ခံခဲ့ရသည်။',
            },
            {
              'active': 'They invited us to the party.',
              'active_mm':
                  '၎င်းတို့သည် ကျွန်ုပ်တို့ကို ပါတီပွဲသို့ ဖိတ်ကြားခဲ့ကြသည်။',
              'passive': 'We were invited to the party.',
              'passive_mm':
                  'ကျွန်ုပ်တို့သည် ပါတီပွဲသို့ ဖိတ်ကြားခြင်းကို ခံခဲ့ရသည်။',
            },
            {
              'active': 'The company launched a new product last month.',
              'active_mm':
                  'ကုမ္ပဏီသည် ပြီးခဲ့သောလက ထုတ်ကုန်အသစ်တစ်ခုကို မိတ်ဆက်ခဲ့သည်။',
              'passive':
                  'A new product was launched by the company last month.',
              'passive_mm':
                  'ထုတ်ကုန်အသစ်တစ်ခုသည် ပြီးခဲ့သောလက ကုမ္ပဏီ၏ မိတ်ဆက်ခြင်းကို ခံခဲ့ရသည်။',
            },
            {
              'active': 'My grandfather built this house in 1950.',
              'active_mm':
                  'ကျွန်ုပ်၏အဖိုးသည် ဤအိမ်ကို ၁၉၅၀ ခုနှစ်တွင် တည်ဆောက်ခဲ့သည်။',
              'passive': 'This house was built by my grandfather in 1950.',
              'passive_mm':
                  'ဤအိမ်သည် ကျွန်ုပ်၏အဖိုး၏ တည်ဆောက်ခြင်းကို ၁၉၅၀ ခုနှစ်တွင် ခံခဲ့ရသည်။',
            },
            {
              'active': 'Someone stole her purse on the bus.',
              'active_mm':
                  'တစ်စုံတစ်ယောက်သည် ဘတ်စ်ကားပေါ်တွင် သူမ၏ လက်ကိုင်အိတ်ကို ခိုးယူခဲ့သည်။',
              'passive': 'Her purse was stolen on the bus.',
              'passive_mm':
                  'သူမ၏ လက်ကိုင်အိတ်သည် ဘတ်စ်ကားပေါ်တွင် ခိုးယူခြင်းကို ခံခဲ့ရသည်။',
            },
            {
              'active': 'The teacher praised the students.',
              'active_mm': 'ဆရာသည် ကျောင်းသားများကို ချီးကျူးခဲ့သည်။',
              'passive': 'The students were praised by the teacher.',
              'passive_mm':
                  'ကျောင်းသားများသည် ဆရာ၏ ချီးကျူးခြင်းကို ခံခဲ့ရသည်။',
            },
            {
              'active': 'The committee made an important decision.',
              'active_mm':
                  'ကော်မတီသည် အရေးကြီးသော ဆုံးဖြတ်ချက်တစ်ခုကို ချမှတ်ခဲ့သည်။',
              'passive': 'An important decision was made by the committee.',
              'passive_mm':
                  'အရေးကြီးသော ဆုံးဖြတ်ချက်တစ်ခုသည် ကော်မတီ၏ ချမှတ်ခြင်းကို ခံခဲ့ရသည်။',
            },
          ],
          'quizzes': [
            {
              'q': 'The Mona Lisa ___ (paint) by Leonardo da Vinci.',
              'a': 'was painted',
              'options': ['was paint', 'was painted', 'were painted'],
              'type': 'Historical Fact',
              'mm':
                  'မိုနာလီဇာပန်းချီကားကို လီယိုနာဒို ဒါဗင်ချီက ရေးဆွဲခဲ့ခြင်းဖြစ်သည်။',
            },
            {
              'q': 'All the cakes ___ (eat) by the children.',
              'a': 'were eaten',
              'options': ['was eaten', 'were eaten', 'were ate'],
              'type': 'Past Simple Passive',
              'mm': 'ကိတ်မုန့်အားလုံးကို ကလေးများက စားပွဲပစ်ခဲ့ကြသည်။',
            },
            {
              'q':
                  'Active: "Did they fix the window?" -> Passive: ___ the window ___ (fix)?',
              'a': 'Was the window fixed',
              'options': [
                'Was the window fixed',
                'Were the window fixed',
                'Did the window fixed',
              ],
              'type': 'Question Conversion',
              'mm':
                  '၎င်းတို့ ပြတင်းပေါက်ကို ပြင်ခဲ့သလား။ -> ပြတင်းပေါက်သည် ပြင်ဆင်ခြင်းကို ခံခဲ့ရသလား။',
            },
            {
              'q': 'The letter ___ (post) three days ago.',
              'a': 'was posted',
              'options': ['was post', 'was posted', 'is posted'],
              'type': 'Past Simple Passive',
              'mm': 'စာကို လွန်ခဲ့သော သုံးရက်က ပေးပို့ခဲ့သည်။',
            },
            {
              'q': 'The rooms ___ (not/clean) yesterday.',
              'a': 'were not cleaned',
              'options': [
                'was not cleaned',
                'were not cleaned',
                'did not cleaned',
              ],
              'type': 'Negative',
              'mm': 'မနေ့က အခန်းများကို သန့်ရှင်းရေး မလုပ်ခဲ့ကြပါ။',
            },
            {
              'q':
                  'Active: "Someone found the lost key." -> Passive: The lost key ___ (found).',
              'a': 'was found',
              'options': ['was find', 'was found', 'were found'],
              'type': 'Conversion',
              'mm':
                  'တစ်စုံတစ်ယောက်က ပျောက်ဆုံးနေသော သော့ကို တွေ့ရှိခဲ့သည်။ -> ပျောက်ဆုံးနေသော သော့ကို တွေ့ရှိခဲ့သည်။',
            },
            {
              'q': '___ you ___ (tell) about the meeting change?',
              'a': 'Were you told',
              'options': ['Was you told', 'Were you told', 'Did you told'],
              'type': 'Question',
              'mm': 'အစည်းအဝေး အပြောင်းအလဲအကြောင်း သင့်ကို ပြောပြခဲ့သလား။',
            },
            {
              'q': 'The bridge ___ (complete) in 2022.',
              'a': 'was completed',
              'options': ['was completed', 'were completed', 'is completed'],
              'type': 'Past Simple Passive',
              'mm': 'တံတားကို ၂၀၂၂ ခုနှစ်တွင် အပြီးသတ် တည်ဆောက်ခဲ့သည်။',
            },
            {
              'q': 'Many people ___ (injure) in the accident.',
              'a': 'were injured',
              'options': ['was injured', 'were injured', 'were injuring'],
              'type': 'Past Simple Passive',
              'mm': 'မတော်တဆမှုတွင် လူအများအပြား ထိခိုက်ဒဏ်ရာရရှိခဲ့သည်။',
            },
            {
              'q':
                  'Active: "The fire destroyed the building." -> Passive: The building ___ (destroy).',
              'a': 'was destroyed',
              'options': ['was destroy', 'was destroyed', 'is destroyed'],
              'type': 'Conversion',
              'mm':
                  'မီးက အဆောက်အအုံကို ဖျက်ဆီးခဲ့သည်။ -> အဆောက်အအုံသည် မီးလောင်ဖျက်ဆီးခြင်း ခံခဲ့ရသည်။',
            },
            {
              'q': 'My car ___ (repair) last week.',
              'a': 'was repaired',
              'options': ['was repaired', 'were repaired', 'is repaired'],
              'type': 'Past Simple Passive',
              'mm': 'ကျွန်ုပ်၏ကားကို ပြီးခဲ့သော အပတ်က ပြင်ဆင်ခဲ့သည်။',
            },
            {
              'q': 'The winners ___ (choose) by a jury.',
              'a': 'were chosen',
              'options': ['was chosen', 'were chosen', 'were choosed'],
              'type': 'Past Simple Passive',
              'mm': 'အနိုင်ရရှိသူများကို ဂျူရီလူကြီးများက ရွေးချယ်ခဲ့ကြသည်။',
            },
            {
              'q': 'When ___ the first computer ___ (invent)?',
              'a': 'was the first computer invented',
              'options': [
                'was the first computer invented',
                'did the first computer invent',
                'were the first computer invented',
              ],
              'type': 'Question',
              'mm': 'ပထမဆုံး ကွန်ပျူတာကို ဘယ်တုန်းက တီထွင်ခဲ့သလဲ။',
            },
            {
              'q': 'The food ___ (not/cook) well.',
              'a': 'was not cooked',
              'options': ['was not cooked', 'were not cooked', 'did not cook'],
              'type': 'Negative',
              'mm': 'အစားအစာကို ကောင်းမွန်စွာ ချက်ပြုတ်ခဲ့ခြင်း မရှိပါ။',
            },
            {
              'q': 'Thousands of books ___ (print) last year.',
              'a': 'were printed',
              'options': ['was printed', 'were printed', 'are printed'],
              'type': 'Past Simple Passive',
              'mm': 'ပြီးခဲ့သောနှစ်က စာအုပ်ပေါင်း ထောင်ချီ၍ ရိုက်နှိပ်ခဲ့သည်။',
            },
          ],
        },

        {
          'title': 'Past Continuous Passive',
          'formula': 'Was / Were + being + V3',
          'usage':
              'အတိတ်ကာလ တစ်ခုခုတွင် တစ်စုံတစ်ခုသော အရာအား ပြုလုပ်ခြင်းခံနေရဆဲ အခြေအနေကို ဖော်ပြရာတွင် သုံးသည်။',
          'examples': [
            // --- Type 1: Declarative (အတည်ပြုဝါကျ) ---
            {
              'active': 'The workers were repairing the road all afternoon.',
              'active_mm':
                  'အလုပ်သမားများသည် တစ်နေကုန် လမ်းကို ပြုပြင်နေခဲ့ကြသည်။',
              'passive': 'The road was being repaired all afternoon.',
              'passive_mm': 'လမ်းသည် တစ်နေကုန် ပြုပြင်ခြင်းကို ခံနေခဲ့ရသည်။',
            },
            {
              'active':
                  'The chef was preparing the appetizers when we arrived.',
              'active_mm':
                  'ကျွန်ုပ်တို့ ရောက်ရှိလာချိန်တွင် စားဖိုမှူးသည် အမြည်းဟင်းလျာများကို ပြင်ဆင်နေခဲ့သည်။',
              'passive': 'The appetizers were being prepared when we arrived.',
              'passive_mm':
                  'ကျွန်ုပ်တို့ ရောက်ရှိလာချိန်တွင် အမြည်းဟင်းလျာများသည် ပြင်ဆင်ခြင်းကို ခံနေခဲ့ရသည်။',
            },
            {
              'active': 'The students were cleaning the classroom at 4 PM.',
              'active_mm':
                  'ညနေ ၄ နာရီတွင် ကျောင်းသားများသည် စာသင်ခန်းကို သန့်ရှင်းရေးလုပ်နေခဲ့ကြသည်။',
              'passive': 'The classroom was being cleaned at 4 PM.',
              'passive_mm':
                  'ညနေ ၄ နာရီတွင် စာသင်ခန်းသည် သန့်ရှင်းရေးပြုလုပ်ခြင်းကို ခံနေခဲ့ရသည်။',
            },

            // --- Type 2: Negative (အငြင်းဝါကျ) ---
            {
              'active': 'The company was not using the old software anymore.',
              'active_mm':
                  'ကုမ္ပဏီသည် ဟောင်းနွမ်းနေသော ဆော့ဖ်ဝဲကို နောက်ထပ် အသုံးမပြုနေခဲ့တော့ပါ။',
              'passive': 'The old software was not being used anymore.',
              'passive_mm':
                  'ဟောင်းနွမ်းနေသော ဆော့ဖ်ဝဲသည် နောက်ထပ် အသုံးမပြုခြင်းကို ခံနေခဲ့ရတော့ပါ။',
            },
            {
              'active': 'They were not recording the meeting.',
              'active_mm': '၎င်းတို့သည် အစည်းအဝေးကို မှတ်တမ်းတင်မနေခဲ့ကြပါ။',
              'passive': 'The meeting was not being recorded.',
              'passive_mm': 'အစည်းအဝေးသည် မှတ်တမ်းတင်ခြင်းကို ခံမနေခဲ့ရပါ။',
            },

            // --- Type 3: Interrogative (အမေးဝါကျ) ---
            {
              'active': 'Were they recording the concert?',
              'active_mm':
                  '၎င်းတို့သည် ဂီတဖျော်ဖြေပွဲကို မှတ်တမ်းတင်နေခဲ့ကြသလား။',
              'passive': 'Was the concert being recorded?',
              'passive_mm':
                  'ဂီတဖျော်ဖြေပွဲသည် မှတ်တမ်းတင်ခြင်းကို ခံနေခဲ့ရသလား။',
            },
            {
              'active': 'Was the secretary typing the letters?',
              'active_mm': 'အတွင်းရေးမှူးသည် စာများကို ရိုက်နေခဲ့သလား။',
              'passive': 'Were the letters being typed by the secretary?',
              'passive_mm':
                  'စာများသည် အတွင်းရေးမှူး၏ ရိုက်နှိပ်ခြင်းကို ခံနေခဲ့ရသလား။',
            },

            // --- Type 4: Complex Context (အချိန်ပြ ပေါင်းစပ်ဝါကျ) ---
            {
              'active':
                  'While the teacher was explaining the lesson, the bell rang.',
              'active_mm':
                  'ဆရာမက သင်ခန်းစာကို ရှင်းပြနေစဉ်တွင် ခေါင်းလောင်းတီးသံ ထွက်ပေါ်လာခဲ့သည်။',
              'passive': 'While the lesson was being explained, the bell rang.',
              'passive_mm':
                  'သင်ခန်းစာသည် ရှင်းပြခြင်းကို ခံနေရစဉ်အတွင်း ခေါင်းလောင်းတီးသံ ထွက်ပေါ်လာခဲ့သည်။',
            },
            {
              'active':
                  'The gardener was watering the flowers when it started to rain.',
              'active_mm':
                  'မိုးစတင်ရွာသွန်းချိန်တွင် ဥယျာဉ်မှူးသည် ပန်းများကို ရေလောင်းနေခဲ့သည်။',
              'passive':
                  'The flowers were being watered when it started to rain.',
              'passive_mm':
                  'မိုးစတင်ရွာသွန်းချိန်တွင် ပန်းများသည် ရေလောင်းခြင်းကို ခံနေခဲ့ရသည်။',
            },
            {
              'active':
                  'They were interviewing the candidate in the next room.',
              'active_mm':
                  '၎င်းတို့သည် ဘေးခန်းတွင် အလုပ်လျှောက်ထားသူအား လူတွေ့စစ်ဆေးနေခဲ့ကြသည်။',
              'passive':
                  'The candidate was being interviewed in the next room.',
              'passive_mm':
                  'အလုပ်လျှောက်ထားသူသည် ဘေးခန်းတွင် လူတွေ့စစ်ဆေးခြင်းကို ခံနေခဲ့ရသည်။',
            },
          ],
          'quizzes': [
            {
              'q': 'The house ___ (paint) when I saw it last week.',
              'a': 'was being painted',
              'options': [
                'was painting',
                'was being painted',
                'is being painted',
              ],
              'type': 'Past Continuous Passive',
              'mm':
                  'ပြီးခဲ့သောပတ်က ကျွန်ုပ်တွေ့ရှိစဉ်တွင် အိမ်သည် ဆေးသုတ်ခြင်းခံနေရသည်။',
            },
            {
              'q': 'The windows ___ (clean) by the servant all morning.',
              'a': 'were being cleaned',
              'options': [
                'was being cleaned',
                'were being cleaned',
                'were cleaning',
              ],
              'type': 'Past Continuous Passive',
              'mm':
                  'တစ်မနက်လုံး ပြတင်းပေါက်များကို အစေခံက သန့်ရှင်းရေးလုပ်နေခဲ့ပါသည်။',
            },
            {
              'q':
                  'Active: "Was he washing the car?" -> Passive: ___ the car ___ (wash)?',
              'a': 'Was the car being washed',
              'options': [
                'Was the car being washed',
                'Were the car being washed',
                'Is the car being washed',
              ],
              'type': 'Question Conversion',
              'mm':
                  'သူ ကားဆေးနေခဲ့သလား။ -> ကားသည် ဆေးကြောခြင်းကို ခံနေခဲ့ရသလား။',
            },
            {
              'q': 'Delicious food ___ (serve) when the guests arrived.',
              'a': 'was being served',
              'options': ['is being served', 'was being served', 'was served'],
              'type': 'Past Continuous Passive',
              'mm':
                  'ဧည့်သည်များရောက်ရှိလာချိန်တွင် အရသာရှိသော အစားအစာများကို တည်ခင်းနေခဲ့ပါသည်။',
            },
            {
              'q': 'The suspects ___ (not/follow) by the police at that time.',
              'a': 'were not being followed',
              'options': [
                'was not being followed',
                'were not being followed',
                'were not following',
              ],
              'type': 'Negative',
              'mm':
                  'ထိုအချိန်တွင် သံသယရှိသူများသည် ရဲတပ်ဖွဲ့၏ နောက်ယောင်ခံလိုက်ခြင်းကို မခံနေခဲ့ရပါ။',
            },
            {
              'q':
                  'Active: "They were discussing the plan." -> Passive: The plan ___ (discuss).',
              'a': 'was being discussed',
              'options': [
                'was discussing',
                'was being discussed',
                'is being discussed',
              ],
              'type': 'Conversion',
              'mm':
                  '၎င်းတို့သည် အစီအစဉ်ကို ဆွေးနွေးနေခဲ့ကြသည်။ -> အစီအစဉ်သည် ဆွေးနွေးခြင်းခံနေရသည်။',
            },
            {
              'q': 'Why ___ the documents ___ (shred) yesterday?',
              'a': 'were the documents being shredded',
              'options': [
                'was the document being shredded',
                'were the documents being shredded',
                'were the documents shredded',
              ],
              'type': 'Question',
              'mm': 'မနေ့က စာရွက်စာတမ်းများကို ဘာကြောင့် ဖျက်ဆီးနေခဲ့ကြသနည်း။',
            },
            {
              'q': 'A new bridge ___ (build) when the earthquake occurred.',
              'a': 'was being built',
              'options': ['is being built', 'was being built', 'was built'],
              'type': 'Past Continuous Passive',
              'mm': 'ငလျင်လှုပ်ခတ်စဉ်တွင် တံတားအသစ်တစ်စင်း တည်ဆောက်နေခဲ့ပါသည်။',
            },
            {
              'q': 'My laptop ___ (repair) so I couldn’t use it.',
              'a': 'was being repaired',
              'options': [
                'is being repaired',
                'was being repaired',
                'was repaired',
              ],
              'type': 'Past Continuous Passive',
              'mm':
                  'ကျွန်ုပ်၏လက်ပ်တော့သည် ပြင်ဆင်ခြင်းခံနေရသောကြောင့် အသုံးမပြုနိုင်ခဲ့ပါ။',
            },
            {
              'q':
                  'Active: "She was reading a poem." -> Passive: A poem ___ (read) by her.',
              'a': 'was being read',
              'options': ['was being read', 'is being read', 'was reading'],
              'type': 'Conversion',
              'mm':
                  'သူမသည် ကဗျာတစ်ပုဒ်ကို ဖတ်နေခဲ့သည်။ -> ကဗျာတစ်ပုဒ်သည် သူမ၏ ဖတ်ရှုခြင်းကို ခံနေခဲ့ရသည်။',
            },
            {
              'q': 'The children ___ (look after) by their aunt.',
              'a': 'were being looked after',
              'options': [
                'was being looked after',
                'were being looked after',
                'are being looked after',
              ],
              'type': 'Past Continuous Passive',
              'mm':
                  'ကလေးများသည် ၎င်းတို့၏အဒေါ်ဖြစ်သူ၏ စောင့်ရှောက်ခြင်းကို ခံနေခဲ့ရသည်။',
            },
            {
              'q':
                  'Active: "Were they fixing the roof?" -> Passive: ___ the roof ___ (fix)?',
              'a': 'Was the roof being fixed',
              'options': [
                'Was the roof being fixed',
                'Were the roof being fixed',
                'Is the roof being fixed',
              ],
              'type': 'Question Conversion',
              'mm':
                  '၎င်းတို့ ခေါင်မိုးကို ပြင်နေခဲ့ကြသလား။ -> ခေါင်မိုးသည် ပြင်ဆင်ခြင်းကို ခံနေခဲ့ရသလား။',
            },
            {
              'q': 'The thief ___ (watch) by the hidden camera.',
              'a': 'was being watched',
              'options': [
                'was being watched',
                'were being watched',
                'is being watched',
              ],
              'type': 'Past Continuous Passive',
              'mm':
                  'သူခိုးသည် လျှို့ဝှက်ကင်မရာ၏ စောင့်ကြည့်ခြင်းကို ခံနေခဲ့ရသည်။',
            },
            {
              'q': 'New rules ___ (prepare) by the committee last month.',
              'a': 'were being prepared',
              'options': [
                'was being prepared',
                'were being prepared',
                'are being prepared',
              ],
              'type': 'Past Continuous Passive',
              'mm':
                  'ပြီးခဲ့သောလက ကော်မတီသည် စည်းမျဉ်းအသစ်များကို ပြင်ဆင်နေခဲ့ကြပါသည်။',
            },
            {
              'q': 'The patient ___ (operate) on when the power went out.',
              'a': 'was being operated',
              'options': [
                'is being operated',
                'was being operated',
                'was operated',
              ],
              'type': 'Complex',
              'mm': 'မီးပြတ်သွားချိန်တွင် လူနာအား ခွဲစိတ်ကုသနေခဲ့ပါသည်။',
            },
          ],
        },
        {
          'title': 'Past Perfect Passive',
          'formula': 'Had + been + V3',
          'usage':
              'အတိတ်ကာလ တစ်ခုထက်စော၍ ပြီးစီးခဲ့သော အပြုခံရသည့် အဖြစ်အပျက်များအတွက် သုံးသည်။ (အတိတ်က ဖြစ်ရပ်နှစ်ခုတွင် ပိုမိုစောသော ဖြစ်ရပ်ကို ဖော်ပြခြင်းဖြစ်သည်။)',
          'examples': [
            // --- Type 1: Declarative (အတည်ပြုဝါကျ) ---
            {
              'active':
                  'The fire had destroyed the building before the firemen arrived.',
              'active_mm':
                  'မီးသတ်သမားများ မရောက်ရှိမီ မီးသည် အဆောက်အအုံကို ဖျက်ဆီးခဲ့ပြီးဖြစ်သည်။',
              'passive':
                  'The building had been destroyed by the fire before the firemen arrived.',
              'passive_mm':
                  'မီးသတ်သမားများ မရောက်ရှိမီ အဆောက်အအုံသည် မီးဘေးကြောင့် ပျက်စီးခဲ့ပြီးဖြစ်သည်။',
            },
            {
              'active': 'The chef had cooked the meal before the guests came.',
              'active_mm':
                  'ဧည့်သည်များ မလာရောက်မီ စားဖိုမှူးသည် အစားအစာများကို ချက်ပြုတ်ပြီးစီးခဲ့သည်။',
              'passive':
                  'The meal had been cooked by the chef before the guests came.',
              'passive_mm':
                  'ဧည့်သည်များ မလာရောက်မီ အစားအစာများသည် စားဖိုမှူး၏ ချက်ပြုတ်ခြင်းကို ခံခဲ့ရပြီးဖြစ်သည်။',
            },
            {
              'active': 'The company had launched the app before the holiday.',
              'active_mm':
                  'ရုံးပိတ်ရက်မတိုင်မီ ကုမ္ပဏီသည် အက်ပလီကေးရှင်းကို မိတ်ဆက်ခဲ့ပြီးဖြစ်သည်။',
              'passive':
                  'The app had been launched by the company before the holiday.',
              'passive_mm':
                  'ရုံးပိတ်ရက်မတိုင်မီ အက်ပလီကေးရှင်းသည် ကုမ္ပဏီ၏ မိတ်ဆက်ခြင်းကို ခံခဲ့ရပြီးဖြစ်သည်။',
            },

            // --- Type 2: Negative (အငြင်းဝါကျ) ---
            {
              'active':
                  'They had not cleaned the office before the meeting started.',
              'active_mm':
                  'အစည်းအဝေး မစတင်မီ ၎င်းတို့သည် ရုံးခန်းကို သန့်ရှင်းရေး မလုပ်ခဲ့ကြပါ။',
              'passive':
                  'The office had not been cleaned before the meeting started.',
              'passive_mm':
                  'အစည်းအဝေး မစတင်မီ ရုံးခန်းသည် သန့်ရှင်းရေးပြုလုပ်ခြင်းကို မခံခဲ့ရပါ။',
            },
            {
              'active': 'The police had not found the thief until last week.',
              'active_mm':
                  'ပြီးခဲ့သောပတ်အထိ ရဲတပ်ဖွဲ့သည် သူခိုးကို ရှာမတွေ့ခဲ့ပါ။',
              'passive':
                  'The thief had not been found by the police until last week.',
              'passive_mm':
                  'သူခိုးသည် ပြီးခဲ့သောပတ်အထိ ရဲတပ်ဖွဲ့၏ ရှာဖွေတွေ့ရှိခြင်းကို မခံခဲ့ရပါ။',
            },

            // --- Type 3: Interrogative (အမေးဝါကျ) ---
            {
              'active': 'Had the manager signed the contract before he left?',
              'active_mm':
                  'မန်နေဂျာ မထွက်ခွာမီ စာချုပ်ကို လက်မှတ်ရေးထိုးခဲ့သလား။',
              'passive':
                  'Had the contract been signed by the manager before he left?',
              'passive_mm':
                  'မန်နေဂျာ မထွက်ခွာမီ စာချုပ်သည် လက်မှတ်ရေးထိုးခြင်းကို ခံခဲ့ရသလား။',
            },
            {
              'active': 'Had they invited her before the party began?',
              'active_mm': 'ပါတီမစမီ ၎င်းတို့သည် သူမကို ဖိတ်ကြားခဲ့သလား။',
              'passive': 'Had she been invited before the party began?',
              'passive_mm': 'ပါတီမစမီ သူမသည် ဖိတ်ကြားခြင်းကို ခံခဲ့ရသလား။',
            },

            // --- Type 4: Complex Context (အချိန်ပြ ပေါင်းစပ်ဝါကျ) ---
            {
              'active':
                  'By the time I arrived, they had already sold the tickets.',
              'active_mm':
                  'ကျွန်ုပ်ရောက်ရှိချိန်တွင် ၎င်းတို့သည် လက်မှတ်များကို ရောင်းချပြီးဖြစ်နေသည်။',
              'passive':
                  'By the time I arrived, the tickets had already been sold.',
              'passive_mm':
                  'ကျွန်ုပ်ရောက်ရှိချိန်တွင် လက်မှတ်များသည် ရောင်းချပြီးဖြစ်နေသည်။',
            },
            {
              'active': 'The author had finished the book before the deadline.',
              'active_mm':
                  'စာရေးဆရာသည် သတ်မှတ်ရက်မတိုင်မီ စာအုပ်ကို အပြီးသတ်ခဲ့သည်။',
              'passive': 'The book had been finished before the deadline.',
              'passive_mm':
                  'စာအုပ်သည် သတ်မှတ်ရက်မတိုင်မီ အပြီးသတ်ခြင်းကို ခံခဲ့ရသည်။',
            },
            {
              'active': 'Someone had broken the window before we returned.',
              'active_mm':
                  'ကျွန်ုပ်တို့ မပြန်လာမီ တစ်စုံတစ်ယောက်က ပြတင်းပေါက်ကို ခွဲခဲ့သည်။',
              'passive': 'The window had been broken before we returned.',
              'passive_mm':
                  'ကျွန်ုပ်တို့ မပြန်လာမီ ပြတင်းပေါက်သည် ခွဲခြင်းကို ခံခဲ့ရသည်။',
            },
          ],
          'quizzes': [
            {
              'q': 'The letter ___ (send) before he called.',
              'a': 'had been sent',
              'options': ['has been sent', 'had been sent', 'was sent'],
              'type': 'Past Perfect Passive',
              'mm': 'သူ ဖုန်းမဆက်မီ စာကို ပေးပို့ခဲ့ပြီးဖြစ်သည်။',
            },
            {
              'q': 'All the food ___ (eat) by the time the guests arrived.',
              'a': 'had been eaten',
              'options': ['had been eaten', 'has been eaten', 'were eaten'],
              'type': 'Past Perfect Passive',
              'mm':
                  'ဧည့်သည်များ ရောက်ရှိလာချိန်တွင် အစားအစာအားလုံး စားသုံးပြီးဖြစ်နေသည်။',
            },
            {
              'q':
                  'Active: "Had they fixed the car?" -> Passive: ___ the car ___ (fix)?',
              'a': 'Had the car been fixed',
              'options': [
                'Had the car been fixed',
                'Has the car been fixed',
                'Was the car fixed',
              ],
              'type': 'Question Conversion',
              'mm':
                  '၎င်းတို့ ကားကို ပြင်ပြီးခဲ့သလား။ -> ကားသည် ပြင်ဆင်ခြင်းကို ခံခဲ့ရပြီးပြီလား။',
            },
            {
              'q': 'The report ___ (not/prepare) before the meeting.',
              'a': 'had not been prepared',
              'options': [
                'has not been prepared',
                'had not been prepared',
                'was not prepared',
              ],
              'type': 'Negative',
              'mm': 'အစည်းအဝေးမတိုင်မီ အစီရင်ခံစာကို ပြင်ဆင်ခဲ့ခြင်း မရှိပါ။',
            },
            {
              'q': 'The thief ___ (arrest) before he could escape.',
              'a': 'had been arrested',
              'options': [
                'had been arrested',
                'has been arrested',
                'is arrested',
              ],
              'type': 'Past Perfect Passive',
              'mm': 'သူခိုးသည် မထွက်ပြေးနိုင်မီ ဖမ်းဆီးခြင်းကို ခံခဲ့ရသည်။',
            },
            {
              'q':
                  'Active: "Someone had stolen the money." -> Passive: The money ___ (steal).',
              'a': 'had been stolen',
              'options': ['has been stolen', 'had been stolen', 'was stolen'],
              'type': 'Conversion',
              'mm':
                  'တစ်စုံတစ်ယောက်က ငွေကို ခိုးယူခဲ့သည်။ -> ငွေသည် ခိုးယူခြင်းကို ခံခဲ့ရသည်။',
            },
            {
              'q': 'By 2020, the bridge ___ (complete).',
              'a': 'had been completed',
              'options': [
                'was completed',
                'had been completed',
                'has been completed',
              ],
              'type': 'Past Perfect Passive',
              'mm': '၂၀၂၀ ခုနှစ်တွင် တံတားကို အပြီးသတ် တည်ဆောက်ခဲ့ပြီးဖြစ်သည်။',
            },
            {
              'q': '___ the trees ___ (plant) before the storm hit?',
              'a': 'Had the trees been planted',
              'options': [
                'Had the trees been planted',
                'Has the trees been planted',
                'Were the trees planted',
              ],
              'type': 'Question',
              'mm': 'မုန်တိုင်းမတိုက်မီ သစ်ပင်များကို စိုက်ပျိုးခဲ့ပြီးပြီလား။',
            },
            {
              'q': 'The house ___ (sell) before we had a chance to visit.',
              'a': 'had been sold',
              'options': ['had been sold', 'was sold', 'has been sold'],
              'type': 'Past Perfect Passive',
              'mm':
                  'ကျွန်ုပ်တို့ သွားရောက်ကြည့်ရှုခွင့် မရမီကပင် အိမ်သည် ရောင်းချခြင်း ခံခဲ့ရပြီးဖြစ်သည်။',
            },
            {
              'q':
                  'Active: "Had she cleaned the room?" -> Passive: ___ the room ___ (clean)?',
              'a': 'Had the room been cleaned',
              'options': [
                'Had the room been cleaned',
                'Was the room cleaned',
                'Has the room been cleaned',
              ],
              'type': 'Question Conversion',
              'mm':
                  'သူမ အခန်းကို သန့်ရှင်းရေး လုပ်ခဲ့သလား။ -> အခန်းသည် သန့်ရှင်းရေး လုပ်ခဲ့ပြီးပြီလား။',
            },
            {
              'q': 'The documents ___ (hide) in a secret place.',
              'a': 'had been hidden',
              'options': ['has been hidden', 'had been hidden', 'were hidden'],
              'type': 'Past Perfect Passive',
              'mm':
                  'စာရွက်စာတမ်းများကို လျှို့ဝှက်နေရာတစ်ခုတွင် ဝှက်ထားခဲ့ပြီးဖြစ်သည်။',
            },
            {
              'q': 'The project ___ (finish) ahead of schedule.',
              'a': 'had been finished',
              'options': [
                'has been finished',
                'had been finished',
                'was finished',
              ],
              'type': 'Past Perfect Passive',
              'mm': 'စီမံကိန်းကို သတ်မှတ်ချိန်ထက်စော၍ အပြီးသတ်ခဲ့သည်။',
            },
            {
              'q': 'Why ___ the truth ___ (not/tell) earlier?',
              'a': 'had the truth not been told',
              'options': [
                'had the truth not been told',
                'has the truth not been told',
                'was the truth not told',
              ],
              'type': 'Question',
              'mm': 'အမှန်တရားကို ဘာကြောင့် စောစောစီးစီး မပြောခဲ့ကြသနည်း။',
            },
            {
              'q': 'The cake ___ (make) by my mother before the party.',
              'a': 'had been made',
              'options': ['was made', 'has been made', 'had been made'],
              'type': 'Past Perfect Passive',
              'mm': 'ပါတီပွဲမတိုင်မီ မုန့်ကို မိခင်က ပြုလုပ်ခဲ့ပြီးဖြစ်သည်။',
            },
            {
              'q':
                  'Active: "They had not invited him." -> Passive: He ___ (not/invite).',
              'a': 'had not been invited',
              'options': [
                'had not been invited',
                'has not been invited',
                'was not invited',
              ],
              'type': 'Negative Conversion',
              'mm':
                  '၎င်းတို့သည် သူ့ကို ဖိတ်ကြားခဲ့ခြင်း မရှိပါ။ -> သူသည် ဖိတ်ကြားခြင်းကို မခံခဲ့ရပါ။',
            },
          ],
        },
        {
          'title': 'Future Simple (Will) Passive',
          'formula': 'Will + be + V3',
          'usage':
              'အနာဂတ်တွင် ပြုလုပ်ခံရမည့် အရာများ သို့မဟုတ် ဖြစ်ပေါ်လာမည့် အခြေအနေများကို Passive ပုံစံဖြင့် ဖော်ပြရာတွင် သုံးသည်။',
          'examples': [
            // --- Type 1: Declarative (အတည်ပြုဝါကျ) ---
            {
              'active': 'The company will release a new product next month.',
              'active_mm':
                  'ကုမ္ပဏီသည် နောက်လတွင် ထုတ်ကုန်အသစ်တစ်ခုကို ထုတ်ဝေမည်ဖြစ်သည်။',
              'passive':
                  'A new product will be released by the company next month.',
              'passive_mm':
                  'ထုတ်ကုန်အသစ်တစ်ခုသည် နောက်လတွင် ကုမ္ပဏီ၏ ထုတ်ဝေခြင်းကို ခံရမည်ဖြစ်သည်။',
            },
            {
              'active': 'The workers will complete the bridge in 2027.',
              'active_mm':
                  'အလုပ်သမားများသည် ၂၀၂၇ ခုနှစ်တွင် တံတားကို အပြီးသတ်တည်ဆောက်မည်ဖြစ်သည်။',
              'passive': 'The bridge will be completed in 2027.',
              'passive_mm':
                  'တံတားသည် ၂၀၂၇ ခုနှစ်တွင် အပြီးသတ် တည်ဆောက်ခြင်း ခံရမည်ဖြစ်သည်။',
            },
            {
              'active': 'The teacher will mark the exam papers tomorrow.',
              'active_mm':
                  'ဆရာမသည် မနက်ဖြန်တွင် စာမေးပွဲအဖြေလွှာများကို စစ်ဆေးမည်ဖြစ်သည်။',
              'passive':
                  'The exam papers will be marked by the teacher tomorrow.',
              'passive_mm':
                  'စာမေးပွဲအဖြေလွှာများသည် မနက်ဖြန်တွင် ဆရာမ၏ စစ်ဆေးခြင်းကို ခံရမည်ဖြစ်သည်။',
            },

            // --- Type 2: Negative (အငြင်းဝါကျ) ---
            {
              'active': 'They will not hold the meeting on Sunday.',
              'active_mm':
                  '၎င်းတို့သည် တနင်္ဂနွေနေ့တွင် အစည်းအဝေးကို ကျင်းပမည်မဟုတ်ပါ။',
              'passive': 'The meeting will not be held on Sunday.',
              'passive_mm':
                  'အစည်းအဝေးသည် တနင်္ဂနွေနေ့တွင် ကျင်းပခြင်း ခံရမည်မဟုတ်ပါ။',
            },
            {
              'active': 'The government will not increase the taxes this year.',
              'active_mm':
                  'အစိုးရသည် ယခုနှစ်တွင် အခွန်များကို တိုးမြှင့်မည်မဟုတ်ပါ။',
              'passive': 'The taxes will not be increased this year.',
              'passive_mm':
                  'အခွန်များသည် ယခုနှစ်တွင် တိုးမြှင့်ခြင်း ခံရမည်မဟုတ်ပါ။',
            },

            // --- Type 3: Interrogative (အမေးဝါကျ) ---
            {
              'active': 'Will the boss sign the contract today?',
              'active_mm':
                  'အထက်လူကြီးသည် စာချုပ်ကို ယနေ့ လက်မှတ်ရေးထိုးမည်လား။',
              'passive': 'Will the contract be signed by the boss today?',
              'passive_mm':
                  'စာချုပ်သည် ယနေ့တွင် အထက်လူကြီး၏ လက်မှတ်ရေးထိုးခြင်းကို ခံရမည်လား။',
            },
            {
              'active': 'Will they invite all the neighbors to the party?',
              'active_mm':
                  '၎င်းတို့သည် အိမ်နီးချင်းအားလုံးကို ပါတီပွဲသို့ ဖိတ်ကြားမည်လား။',
              'passive': 'Will all the neighbors be invited to the party?',
              'passive_mm':
                  'အိမ်နီးချင်းအားလုံးသည် ပါတီပွဲသို့ ဖိတ်ကြားခြင်းကို ခံရမည်လား။',
            },

            // --- Type 4: Complex Context (အခြေအနေပြ ပေါင်းစပ်ဝါကျ) ---
            {
              'active': 'I will clean your room while you are away.',
              'active_mm':
                  'သင်မရှိခိုက်တွင် ကျွန်ုပ်သည် သင့်အခန်းကို သန့်ရှင်းရေးလုပ်ပေးမည်ဖြစ်သည်။',
              'passive': 'Your room will be cleaned while you are away.',
              'passive_mm':
                  'သင်မရှိခိုက်တွင် သင့်အခန်းသည် သန့်ရှင်းရေးပြုလုပ်ခြင်းကို ခံရမည်ဖြစ်သည်။',
            },
            {
              'active': 'Someone will pick you up at the airport.',
              'active_mm':
                  'တစ်စုံတစ်ယောက်သည် သင့်ကို လေဆိပ်တွင် လာကြိုလိမ့်မည်။',
              'passive': 'You will be picked up at the airport.',
              'passive_mm':
                  'သင်သည် လေဆိပ်တွင် လာရောက်ကြိုဆိုခြင်းကို ခံရလိမ့်မည်။',
            },
            {
              'active': 'The postman will deliver the parcel in two days.',
              'active_mm':
                  'စာပို့သမားသည် ပါဆယ်ထုတ်ကို နှစ်ရက်အတွင်း ပေးပို့လိမ့်မည်။',
              'passive': 'The parcel will be delivered in two days.',
              'passive_mm':
                  'ပါဆယ်ထုတ်သည် နှစ်ရက်အတွင်း ပေးပို့ခြင်းကို ခံရလိမ့်မည်။',
            },
          ],
          'quizzes': [
            {
              'q': 'The decision ___ (make) at the next meeting.',
              'a': 'will be made',
              'options': ['will make', 'will be made', 'is made'],
              'type': 'Future Passive',
              'mm':
                  'နောက်လာမည့် အစည်းအဝေးတွင် ဆုံးဖြတ်ချက်ကို ချမှတ်မည်ဖြစ်သည်။',
            },
            {
              'q': 'All the food ___ (provide) by the hotel.',
              'a': 'will be provided',
              'options': [
                'will be provided',
                'will be provide',
                'are provided',
              ],
              'type': 'Future Passive',
              'mm': 'အစားအစာအားလုံးကို ဟိုတယ်မှ စီစဉ်ပေးမည်ဖြစ်သည်။',
            },
            {
              'q':
                  'Active: "She will write the report." -> Passive: The report ___ (write).',
              'a': 'will be written',
              'options': ['will be write', 'will be written', 'will written'],
              'type': 'Conversion',
              'mm':
                  'သူမသည် အစီရင်ခံစာကို ရေးသားလိမ့်မည်။ -> အစီရင်ခံစာသည် ရေးသားခြင်းကို ခံရမည်ဖြစ်သည်။',
            },
            {
              'q': '___ the bills ___ (pay) by the end of the month?',
              'a': 'Will the bills be paid',
              'options': [
                'Will the bills be paid',
                'Will the bills pay',
                'Shall the bills be paid',
              ],
              'type': 'Question',
              'mm': 'လကုန်တွင် ကျသင့်ငွေများကို ပေးဆောင်ပြီးဖြစ်မည်လား။',
            },
            {
              'q': 'The winners ___ (announce) on live TV.',
              'a': 'will be announced',
              'options': [
                'will be announce',
                'will be announced',
                'will announced',
              ],
              'type': 'Future Passive',
              'mm':
                  'အနိုင်ရရှိသူများကို ရုပ်မြင်သံကြားမှ တိုက်ရိုက်ထုတ်လွှင့် ကြေညာမည်ဖြစ်သည်။',
            },
            {
              'q':
                  'Active: "They will not build the stadium." -> Passive: The stadium ___ (not/build).',
              'a': 'will not be built',
              'options': [
                'will not be build',
                'will not be built',
                'not will be built',
              ],
              'type': 'Negative',
              'mm':
                  '၎င်းတို့သည် အားကစားကွင်းကို တည်ဆောက်မည်မဟုတ်ပါ။ -> အားကစားကွင်းသည် တည်ဆောက်ခြင်းခံရမည်မဟုတ်ပါ။',
            },
            {
              'q': 'Your car ___ (repair) by tomorrow morning.',
              'a': 'will be repaired',
              'options': ['will be repair', 'will be repaired', 'is repaired'],
              'type': 'Future Passive',
              'mm': 'သင့်ကားကို မနက်ဖြန်မနက်တွင် ပြင်ဆင်ပြီးစီးမည်ဖြစ်သည်။',
            },
            {
              'q': '___ you ___ (inform) about the results?',
              'a': 'Will you be informed',
              'options': [
                'Will you be informed',
                'Will you inform',
                'Are you informed',
              ],
              'type': 'Question',
              'mm': 'ရလဒ်များနှင့်ပတ်သက်၍ သင့်အား အကြောင်းကြားမည်လား။',
            },
            {
              'q': 'Active: "We will invite him." -> Passive: He ___ (invite).',
              'a': 'will be invited',
              'options': ['will be invite', 'will be invited', 'will invited'],
              'type': 'Conversion',
              'mm':
                  'ကျွန်ုပ်တို့သည် သူ့ကို ဖိတ်ကြားမည်ဖြစ်သည်။ -> သူသည် ဖိတ်ကြားခြင်းကို ခံရမည်ဖြစ်သည်။',
            },
            {
              'q': 'New rules ___ (implement) starting next year.',
              'a': 'will be implemented',
              'options': [
                'will be implemented',
                'will be implement',
                'are implemented',
              ],
              'type': 'Future Passive',
              'mm':
                  'စည်းမျဉ်းအသစ်များကို နောက်နှစ်မှစ၍ စတင်ကျင့်သုံးမည်ဖြစ်သည်။',
            },
            {
              'q': 'The dinner ___ (not/cook) until 7 PM.',
              'a': 'will not be cooked',
              'options': [
                'will not be cooked',
                'is not cooked',
                'won’t be cook',
              ],
              'type': 'Negative',
              'mm': 'ည ၇ နာရီမတိုင်မီ ညစာကို ချက်ပြုတ်မည်မဟုတ်ပါ။',
            },
            {
              'q':
                  'Active: "Will someone pick me up?" -> Passive: ___ I ___ (pick up)?',
              'a': 'Will I be picked up',
              'options': [
                'Will I be picked up',
                'Shall I pick up',
                'Am I picked up',
              ],
              'type': 'Question Conversion',
              'mm':
                  'တစ်စုံတစ်ယောက် လာကြိုမှာလား။ -> ကျွန်ုပ်သည် လာရောက်ကြိုဆိုခြင်းကို ခံရမည်လား။',
            },
            {
              'q': 'The letters ___ (post) later today.',
              'a': 'will be posted',
              'options': ['will be posted', 'will post', 'are posted'],
              'type': 'Future Passive',
              'mm':
                  'စာများကို ယနေ့ နောက်ပိုင်းတွင် စာတိုက်သို့ ပေးပို့မည်ဖြစ်သည်။',
            },
            {
              'q': 'Thousands of jobs ___ (create) by the new project.',
              'a': 'will be created',
              'options': ['will be created', 'will be create', 'is created'],
              'type': 'Future Passive',
              'mm':
                  'စီမံကိန်းအသစ်ကြောင့် အလုပ်အကိုင်ပေါင်း ထောင်ချီ၍ ပေါ်ပေါက်လာမည်ဖြစ်သည်။',
            },
            {
              'q': 'The packages ___ (check) at the border.',
              'a': 'will be checked',
              'options': ['will be checked', 'will be check', 'are checked'],
              'type': 'Future Passive',
              'mm': 'အထုပ်များကို နယ်စပ်တွင် စစ်ဆေးခြင်းခံရမည်ဖြစ်သည်။',
            },
          ],
        },
        {
          'title': 'Modals Passive',
          'formula': 'Modal (Can/Must/etc.) + be + V3',
          'usage':
              'အကြံပေးခြင်း၊ တာဝန်ရှိခြင်း၊ တတ်နိုင်ခြင်း စသည့် Modal Verbs များကို Passive ပုံစံဖြင့် ဖော်ပြရာတွင် သုံးသည်။',
          'examples': [
            // --- Can / Could (စွမ်းဆောင်နိုင်မှု) ---
            {
              'active': 'You can see the stars clearly tonight.',
              'active_mm':
                  'သင်သည် ယနေ့ညတွင် ကြယ်များကို ရှင်းလင်းစွာ မြင်နိုင်သည်။',
              'passive': 'The stars can be seen clearly tonight.',
              'passive_mm':
                  'ယနေ့ညတွင် ကြယ်များကို ရှင်းလင်းစွာ မြင်တွေ့နိုင်သည်။',
            },
            {
              'active': 'The boy could not lift the heavy box.',
              'active_mm': 'ထိုကလေးသည် လေးလံသောသေတ္တာကို မမနိုင်ခဲ့ပါ။',
              'passive': 'The heavy box could not be lifted by the boy.',
              'passive_mm':
                  'လေးလံသောသေတ္တာသည် ထိုကလေး၏ မခြင်းကို မခံနိုင်ခဲ့ပါ။',
            },
            // --- Must / Should (တာဝန်နှင့် အကြံပေးချက်) ---
            {
              'active': 'Staff must wear a uniform at all times.',
              'active_mm': 'ဝန်ထမ်းများသည် အချိန်ပြည့် ယူနီဖောင်း ဝတ်ဆင်ရမည်။',
              'passive': 'A uniform must be worn by staff at all times.',
              'passive_mm':
                  'ယူနီဖောင်းကို ဝန်ထမ်းများက အချိန်ပြည့် ဝတ်ဆင်ရမည်ဖြစ်သည်။',
            },
            {
              'active': 'We should protect our environment.',
              'active_mm':
                  'ကျွန်ုပ်တို့သည် ပတ်ဝန်းကျင်ကို ထိန်းသိမ်းစောင့်ရှောက်သင့်သည်။',
              'passive': 'Our environment should be protected.',
              'passive_mm':
                  'ကျွန်ုပ်တို့၏ ပတ်ဝန်းကျင်သည် ထိန်းသိမ်းစောင့်ရှောက်ခြင်း ခံရသင့်သည်။',
            },
            // --- May / Might (ဖြစ်နိုင်ခြေ) ---
            {
              'active': 'The rain may delay the match.',
              'active_mm': 'မိုးရွာခြင်းကြောင့် ပွဲစဉ် နောက်ကျနိုင်သည်။',
              'passive': 'The match may be delayed by the rain.',
              'passive_mm':
                  'ပွဲစဉ်သည် မိုးရွာခြင်းကြောင့် နောက်ကျခြင်း ခံရနိုင်သည်။',
            },
            {
              'active': 'They might cancel the flight due to fog.',
              'active_mm':
                  'မြူနှင်းများကြောင့် ၎င်းတို့သည် လေယာဉ်ခရီးစဉ်ကို ဖျက်သိမ်းနိုင်သည်။',
              'passive': 'The flight might be cancelled due to fog.',
              'passive_mm':
                  'လေယာဉ်ခရီးစဉ်သည် မြူနှင်းများကြောင့် ဖျက်သိမ်းခြင်း ခံရနိုင်သည်။',
            },
            // --- Will / Would (အနာဂတ်နှင့် ရည်ရွယ်ချက်) ---
            {
              'active': 'The manager would accept your request.',
              'active_mm': 'မန်နေဂျာသည် သင်၏တောင်းဆိုမှုကို လက်ခံလိမ့်မည်။',
              'passive': 'Your request would be accepted by the manager.',
              'passive_mm':
                  'သင်၏တောင်းဆိုမှုသည် မန်နေဂျာ၏ လက်ခံခြင်းကို ခံရလိမ့်မည်။',
            },
            {
              'active': 'They will solve the problem soon.',
              'active_mm': '၎င်းတို့သည် ပြဿနာကို မကြာမီ ဖြေရှင်းပါလိမ့်မည်။',
              'passive': 'The problem will be solved soon.',
              'passive_mm': 'ပြဿနာသည် မကြာမီ ဖြေရှင်းပြီးစီးလိမ့်မည်။',
            },
            // --- Shall (ကမ်းလှမ်းချက်/စည်းမျဉ်း) ---
            {
              'active': 'We shall keep all secrets.',
              'active_mm':
                  'ကျွန်ုပ်တို့သည် လျှို့ဝှက်ချက်အားလုံးကို ထိန်းသိမ်းရမည်။',
              'passive': 'All secrets shall be kept.',
              'passive_mm': 'လျှို့ဝှက်ချက်အားလုံးသည် ထိန်းသိမ်းခြင်း ခံရမည်။',
            },
            // --- Additional Diverse Examples (Interrogative & Negative) ---
            {
              'active': 'Can anyone solve this puzzle?',
              'active_mm': 'ဤပဟေဠိကို တစ်စုံတစ်ယောက် ဖြေရှင်းနိုင်သလား။',
              'passive': 'Can this puzzle be solved by anyone?',
              'passive_mm':
                  'ဤပဟေဠိသည် တစ်စုံတစ်ယောက်၏ ဖြေရှင်းခြင်းကို ခံနိုင်သလား။',
            },
            {
              'active': 'You must not use mobile phones here.',
              'active_mm': 'သင်သည် ဤနေရာ၌ လက်ကိုင်ဖုန်းများကို မသုံးရပါ။',
              'passive': 'Mobile phones must not be used here.',
              'passive_mm':
                  'ဤနေရာ၌ လက်ကိုင်ဖုန်းများကို အသုံးပြုခြင်း မပြုရပါ။',
            },
            {
              'active': 'Should we inform the principal?',
              'active_mm':
                  'ကျွန်ုပ်တို့ ကျောင်းအုပ်ကြီးကို အကြောင်းကြားသင့်သလား။',
              'passive': 'Should the principal be informed?',
              'passive_mm': 'ကျောင်းအုပ်ကြီးအား အကြောင်းကြားခြင်း ခံရသင့်သလား။',
            },
            {
              'active': 'They could solve the mystery easily.',
              'active_mm':
                  '၎င်းတို့သည် ထိုလျှို့ဝှက်ချက်ကို လွယ်ကူစွာ ဖြေရှင်းနိုင်ခဲ့သည်။',
              'passive': 'The mystery could be solved easily.',
              'passive_mm':
                  'ထိုလျှို့ဝှက်ချက်သည် လွယ်ကူစွာ ဖြေရှင်းခြင်း ခံရနိုင်သည်။',
            },
            {
              'active': 'Applicants may submit their forms online.',
              'active_mm':
                  'လျှောက်ထားသူများသည် ၎င်းတို့၏ ဖောင်များကို အွန်လိုင်းမှ တင်သွင်းနိုင်သည်။',
              'passive': 'The forms may be submitted online by applicants.',
              'passive_mm':
                  'ဖောင်များကို လျှောက်ထားသူများက အွန်လိုင်းမှ တင်သွင်းနိုင်သည်။',
            },
            {
              'active': 'We would respect your decision.',
              'active_mm': 'ကျွန်ုပ်တို့သည် သင်၏ ဆုံးဖြတ်ချက်ကို လေးစားပါမည်။',
              'passive': 'Your decision would be respected.',
              'passive_mm': 'သင်၏ ဆုံးဖြတ်ချက်သည် လေးစားခြင်း ခံရလိမ့်မည်။',
            },
            {
              'active': 'You must wash your hands before eating.',
              'active_mm': 'သင်သည် အစာမစားမီ လက်ကို ဆေးကြောရမည်။',
              'passive': 'Hands must be washed before eating.',
              'passive_mm': 'အစာမစားမီ လက်များကို ဆေးကြောရမည်ဖြစ်သည်။',
            },
            {
              'active': 'The company should offer a refund.',
              'active_mm': 'ကုမ္ပဏီသည် ငွေပြန်အမ်းပေးသင့်သည်။',
              'passive': 'A refund should be offered by the company.',
              'passive_mm': 'ကုမ္ပဏီမှ ငွေပြန်အမ်းပေးခြင်းကို ပြုလုပ်သင့်သည်။',
            },
            {
              'active': 'Nobody can break this record.',
              'active_mm': 'မည်သူမျှ ဤစံချိန်ကို မချိုးဖျက်နိုင်ပါ။',
              'passive': 'This record cannot be broken.',
              'passive_mm': 'ဤစံချိန်သည် ချိုးဖျက်ခြင်းကို မခံနိုင်ပါ။',
            },
            {
              'active': 'The committee might approve the plan.',
              'active_mm':
                  'ကော်မတီသည် အစီအစဉ်ကို အတည်ပြုကောင်း အတည်ပြုလိမ့်မည်။',
              'passive': 'The plan might be approved by the committee.',
              'passive_mm':
                  'အစီအစဉ်သည် ကော်မတီ၏ အတည်ပြုခြင်းကို ခံရကောင်း ခံရလိမ့်မည်။',
            },
            {
              'active': 'Citizens shall follow the law.',
              'active_mm': 'နိုင်ငံသားများသည် ဥပဒေကို လိုက်နာရမည်။',
              'passive': 'The law shall be followed by citizens.',
              'passive_mm': 'ဥပဒေသည် နိုင်ငံသားများ၏ လိုက်နာခြင်းကို ခံရမည်။',
            },
          ],
          'quizzes': [
            {
              'q': 'The problem ___ (can/solve) without a calculator.',
              'a': 'can be solved',
              'options': ['can solve', 'can be solve', 'can be solved'],
              'type': 'Modal Passive',
              'mm': 'ဤပုစ္ဆာကို ဂဏန်းတွက်စက်မပါဘဲ ဖြေရှင်းနိုင်သည်။',
            },
            {
              'q': 'Rules ___ (must/obey) by everyone.',
              'a': 'must be obeyed',
              'options': ['must obey', 'must be obeyed', 'must be obey'],
              'type': 'Modal Passive',
              'mm': 'စည်းကမ်းများကို လူတိုင်း လိုက်နာရမည်။',
            },
            {
              'q':
                  'Active: "You should turn off the lights." -> Passive: The lights ___ (should/turn off).',
              'a': 'should be turned off',
              'options': [
                'should be turn off',
                'should be turned off',
                'should turn off',
              ],
              'type': 'Conversion',
              'mm':
                  'သင် မီးများကို ပိတ်သင့်သည်။ -> မီးများသည် ပိတ်ခြင်းခံရသင့်သည်။',
            },
            {
              'q': '___ this secret ___ (might/discover) by the media?',
              'a': 'Might this secret be discovered',
              'options': [
                'Might this secret be discovered',
                'May this secret discovered',
                'Might this secret discover',
              ],
              'type': 'Question',
              'mm': 'ဤလျှို့ဝှက်ချက်ကို မီဒီယာများက သိရှိသွားနိုင်မလား။',
            },
            {
              'q': 'Errors ___ (must/avoid) at all costs.',
              'a': 'must be avoided',
              'options': ['must avoid', 'must be avoided', 'must be avoid'],
              'type': 'Modal Passive',
              'mm': 'အမှားများကို မည်သည့်နည်းနှင့်မဆို ရှောင်ကြဉ်ရမည်။',
            },
            {
              'q':
                  'Active: "She could not open the door." -> Passive: The door ___ (could not/open).',
              'a': 'could not be opened',
              'options': [
                'could not be open',
                'could not be opened',
                'could not opened',
              ],
              'type': 'Negative Conversion',
              'mm':
                  'သူမသည် တံခါးကို မဖွင့်နိုင်ခဲ့ပါ။ -> တံခါးသည် ဖွင့်ခြင်းကို မခံနိုင်ခဲ့ပါ။',
            },
            {
              'q': 'A doctor ___ (should/consult) immediately.',
              'a': 'should be consulted',
              'options': [
                'should consult',
                'should be consulted',
                'should be consult',
              ],
              'type': 'Advice',
              'mm': 'ဆရာဝန်နှင့် ချက်ချင်း တိုင်ပင်ဆွေးနွေးသင့်သည်။',
            },
            {
              'q': '___ the medicine ___ (must/take) after meals?',
              'a': 'Must the medicine be taken',
              'options': [
                'Must the medicine be taken',
                'Must the medicine take',
                'Should the medicine taken',
              ],
              'type': 'Question',
              'mm': 'ဆေးကို အစာစားပြီးမှ သောက်ရမှာလား။',
            },
            {
              'q':
                  'Active: "They will award the winner." -> Passive: The winner ___ (will/award).',
              'a': 'will be awarded',
              'options': ['will be award', 'will be awarded', 'will awarded'],
              'type': 'Conversion',
              'mm':
                  '၎င်းတို့သည် အနိုင်ရရှိသူကို ဆုချီးမြှင့်မည်။ -> အနိုင်ရရှိသူသည် ဆုချီးမြှင့်ခြင်းကို ခံရမည်။',
            },
            {
              'q': 'The goal ___ (cannot/achieve) without hard work.',
              'a': 'cannot be achieved',
              'options': [
                'cannot achieve',
                'cannot be achieved',
                'cannot be achieve',
              ],
              'type': 'Negative',
              'mm': 'ပန်းတိုင်ကို ကြိုးစားအားထုတ်မှုမပါဘဲ မအောင်မြင်နိုင်ပါ။',
            },
            {
              'q': 'Your passport ___ (may/require) at the entrance.',
              'a': 'may be required',
              'options': ['may require', 'may be required', 'may be require'],
              'type': 'Possibility',
              'mm': 'ဝင်ပေါက်တွင် သင်၏နိုင်ငံကူးလက်မှတ် လိုအပ်နိုင်ပါသည်။',
            },
            {
              'q':
                  'Active: "Would they accept the invitation?" -> Passive: ___ the invitation ___ (would/accept)?',
              'a': 'Would the invitation be accepted',
              'options': [
                'Would the invitation be accepted',
                'Would the invitation accept',
                'Will the invitation accepted',
              ],
              'type': 'Question Conversion',
              'mm':
                  '၎င်းတို့ ဖိတ်ကြားချက်ကို လက်ခံမလား။ -> ဖိတ်ကြားချက်သည် လက်ခံခြင်းကို ခံရမလား။',
            },
            {
              'q': 'The project ___ (should/complete) by Friday.',
              'a': 'should be completed',
              'options': [
                'should complete',
                'should be completed',
                'should be complete',
              ],
              'type': 'Modal Passive',
              'mm': 'စီမံကိန်းကို သောကြာနေ့တွင် အပြီးသတ်သင့်သည်။',
            },
            {
              'q': 'Pets ___ (not/must/allow) inside the restaurant.',
              'a': 'must not be allowed',
              'options': [
                'must not allow',
                'must not be allowed',
                'not must be allowed',
              ],
              'type': 'Negative',
              'mm':
                  'စားသောက်ဆိုင်အတွင်း အိမ်မွေးတိရစ္ဆာန်များကို ခွင့်မပြုရပါ။',
            },
            {
              'q': 'A lot of things ___ (could/improve) in this app.',
              'a': 'could be improved',
              'options': [
                'could improve',
                'could be improved',
                'could be improve',
              ],
              'type': 'Modal Passive',
              'mm': 'ဤအက်ပ်တွင် အရာအများအပြားကို မြှင့်တင်နိုင်သည်။',
            },
          ],
        },
      ],
    },
    {
      'group': 'Rarely Used Passive Forms (အသုံးနည်းသော Passive ပုံစံများ)',
      'items': [
        {
          'title': 'Future Continuous Passive',
          'formula': 'Will + be + being + V3',
          'usage':
              'အနာဂတ် အချိန်တစ်ခုတွင် လုပ်ဆောင်ခံနေရဆဲ ဖြစ်မည့် အခြေအနေ (အလွန်သုံးနှုန်းမှု နည်းပါးသည်)။',
          'examples': [],
          'quizzes': [],
        },
        {
          'title': 'Present Perfect Continuous Passive',
          'formula': 'Have / Has + been + being + V3',
          'usage':
              'အတိတ်မှ ယခုထိ အပြုခံနေရဆဲ အခြေအနေကို အလေးပေးလိုလျှင် သုံးသည်။',
          'examples': [],
          'quizzes': [],
        },
        {
          'title': 'Past Perfect Continuous Passive',
          'formula': 'Had + been + being + V3',
          'usage':
              'အတိတ်ကာလ တစ်ခုမတိုင်မီကပင် အပြုခံနေရဆဲဖြစ်သော အရာများအတွက် သုံးသည်။',
          'examples': [],
          'quizzes': [],
        },
        {
          'title': 'Future Perfect Continuous Passive',
          'formula': 'Will + have + been + being + V3',
          'usage':
              'အနာဂတ် အချိန်တစ်ခုတွင် အချိန်အတိုင်းအတာတစ်ခုထိ အပြုခံရပြီးဖြစ်မည့် အခြေအနေ။',
          'examples': [],
          'quizzes': [],
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Passive Voice')),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: MediaQuery.sizeOf(context).width * 0.05,
        ),
        itemCount: passiveVoiceData.length,
        itemBuilder: (context, index) {
          final group = passiveVoiceData[index];
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
                        builder: (context) =>
                            PassiveVoiceDetailScreen(tense: tense),
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

class PassiveVoiceDetailScreen extends StatelessWidget {
  final Map<String, dynamic> tense;

  const PassiveVoiceDetailScreen({super.key, required this.tense});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tense['title'])),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizLessonPage(
              quizData: tense['quizzes'] ?? [],
              tenseTitle: tense['title'] ?? "Title",
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
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    spacing: 8,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Active: ${ex['active']}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        ex['active_mm'],
                        style: TextStyle(
                          // fontStyle: FontStyle.italic,
                          color: Colors.grey,
                        ),
                      ),
                      Divider(),
                      Text(
                        "Passive: ${ex['passive']}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        ex['passive_mm'],
                        style: TextStyle(
                          // fontStyle: FontStyle.italic,
                          color: Colors.grey,
                        ),
                      ),
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
