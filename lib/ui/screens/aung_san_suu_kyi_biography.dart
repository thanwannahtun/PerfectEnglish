import 'package:flutter/material.dart';
import 'package:perfect_english/widgets/speak_button.dart';

final String aungSanSuuKyiBiography =
    """This is the life story of Aung San Suu Kyi, a narrative woven from the facts of her journey from a daughter of a national hero to a global icon of democracy, and eventually to a figure of intense international debate.

The Daughter of the Rising Sun
The story begins on June 19, 1945, in Rangoon, British Burma. Aung San Suu Kyi was born into history; her father, Bogyoke Aung San, was the architect of Myanmar’s independence. But tragedy struck early. When Suu Kyi was only two years old, her father was assassinated by political rivals. Growing up as the daughter of a martyr, she carried a name that was synonymous with the spirit of the nation: "Aung San" from her father, "Suu" from her grandmother, and "Kyi" from her mother, Khin Kyi.

Her childhood was spent between the quiet gardens of Inya Lake and the bustling streets of New Delhi, where her mother served as an ambassador. Suu Kyi became a citizen of the world, learning four languages and eventually finding herself at the University of Oxford. It was there she met Michael Aris, a scholar of Tibetan culture. They married in 1972 and raised two sons, Alexander and Kim, living a quiet, academic life in England. For years, she was a wife and mother, but the shadow of Burma always lingered.

The Call of the Homeland
In 1988, the quiet life ended. Suu Kyi returned to Rangoon to care for her dying mother. She arrived in the middle of a political firestorm. The country was erupting in the "8888 Uprising" against the military junta. As the daughter of the nation’s founder, the people looked to her.

Standing before half a million people at the Shwedagon Pagoda, she spoke of a "second struggle for national independence." She helped found the National League for Democracy (NLD) and embraced the philosophy of non-violence, inspired by Mahatma Gandhi and her Buddhist faith. The military, fearing her influence, placed her under house arrest in 1989.

The Iron Orchid
For much of the next two decades, Suu Kyi’s world was confined to her crumbling lakeside villa. She became a symbol of peaceful resistance—the "Iron Orchid." In 1990, while she was detained, her party won a landslide election, but the military ignored the results.

In 1991, she was awarded the Nobel Peace Prize. Because she could not leave the country (fearing she would never be allowed back), her son Alexander accepted it on her behalf. Her personal life was marked by immense sacrifice; when her husband, Michael, was dying of cancer in the UK in 1999, the military refused him a visa to see her, and she refused to leave, knowing she would be exiled forever. He died without a final goodbye.

From Prisoner to Power
The winds of change finally blew in 2010. Released from house arrest, Suu Kyi entered formal politics. By 2015, the NLD won a historic landslide victory. Because the constitution (written by the military) barred anyone with foreign-citizen children from being President, a new role was created for her: State Counsellor. She was now the de facto leader of Myanmar.

However, the transition from icon to politician was fraught. Her tenure was clouded by the Rohingya crisis. Once the darling of the West, she faced intense international condemnation for defending the military’s actions at the International Court of Justice in 2019. The world saw a different Suu Kyi—one who chose the complexities of national governance over the purity of activism.

The Final Chapter (Ongoing)
The fragile democracy lasted only a few years. In February 2021, the military seized power in a coup d'état, claiming election fraud. Suu Kyi was arrested once again. In a series of closed-door trials that the UN described as politically motivated, she was sentenced to a total of 33 years (later reduced to 27) for various charges, including corruption and violating state secrets.

Today, at 80 years old, the woman who once spent 15 years in detention is back behind bars or in "protective custody," her exact location often unknown. Her journey remains one of the most complex political stories of the 21st century—a story of a daughter’s legacy, a nation’s struggle, and the heavy price of power.

Quick Fact Summary
Born: June 19, 1945 (Rangoon, Burma)

Education: University of Delhi, University of Oxford (Philosophy, Politics, and Economics).

Key Role: General Secretary of the National League for Democracy (NLD).

Political Office: State Counsellor of Myanmar (2016–2021).

Major Award: Nobel Peace Prize (1991).

Detention: Spent nearly 15 years under house arrest between 1989 and 2010; currently imprisoned following the 2021 coup.

Family: Daughter of Aung San; widow of Michael Aris; mother of two sons.""";

class AungSanSuuKyiBiography extends StatelessWidget {
  const AungSanSuuKyiBiography({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('အောင်ဆန်းဆုကြည် အထုပ္ပတ္တိ (Aung San Suu Kyi Biography)'),
        actions: [SpeakButton(text: aungSanSuuKyiBiography)],
        actionsPadding: EdgeInsets.only(right: 16.0),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: MediaQuery.sizeOf(context).width * 0.05,
        ),
        child: Text(
          aungSanSuuKyiBiography,
          // style: TextStyle(),
          style: Theme.of(context).textTheme.titleMedium
        ),
      ),
    );
  }
}
