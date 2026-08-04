import 'package:flutter/material.dart';
import 'package:perfect_english/data/future_in_5_situations_data.dart';
import 'package:perfect_english/widgets/speak_button.dart';
import 'package:perfect_english/grammer_section/quiz_lesson_page.dart';

/// FutureTenseIn5DifferentSituations Screen
/// ─────────────────────────────────────────
/// Teaches the 5 contexts in which future tense is used in English:
///   1. Future Plans (Definite) → Present Continuous
///   2. Future Plans (Intention) → be going to + V1
///   3. Predictions (Evidence)  → be going to + V1
///   4. On-the-Spot Decisions   → will + V1
///   5. Offers & Promises       → will + V1
///
/// Each section shows:
///   • Burmese description of the concept
///   • Formula chip (highlighted)
///   • Usage note
///   • Labelled example sentences (with TTS)
///
/// A floating "Take a Quiz" button leads to QuizLessonPage.
class FutureTenseIn5DifferentSituations extends StatelessWidget {
  const FutureTenseIn5DifferentSituations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Tense in 5 Situations'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'future5-quiz',
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizLessonPage(
              quizData: future5SituationsQuizData,
              tenseTitle: 'Future Tense in 5 Situations',
            ),
          ),
        ),
        label: const Text('Take a Quiz'),
        icon: const Icon(Icons.quiz_outlined),
      ),
      body: ListView(
        padding: EdgeInsets.only(
          top: 16,
          bottom: 100, // leave space for FAB
          left: MediaQuery.sizeOf(context).width * 0.05,
          right: MediaQuery.sizeOf(context).width * 0.05,
        ),
        children: [
          _buildOverviewCard(context),
          const SizedBox(height: 20),
          _buildQuickComparisonTable(context),
          const SizedBox(height: 20),
          ...future5SituationsData.map(
            (data) => _buildSituationCard(data, context),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  Overview Banner
  // ─────────────────────────────────────────────
  Widget _buildOverviewCard(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Card(
      color: scheme.primaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.lightbulb_outline, color: scheme.onPrimaryContainer),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Future Tense ၅ မျိုး',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: scheme.onPrimaryContainer,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'အင်္ဂလိပ်ဘာသာတွင် "အနာဂတ်ကို" ပြောဆိုရန် နည်းလမ်း တစ်ခုတည်းသာ မဟုတ်ဘဲ ၅ မျိုး ရှိသည်! '
              'မည်သည့်ပုံစံ (structure) ကို မည်သည့်အခြေအနေတွင် သုံးရမည်ဆိုသည်ကို '
              'ဤသင်ခန်းစာတွင် လေ့လာကြရအောင်။\n\n'
              '📌 Present Continuous → ကြိုတင်ချိန်းဆိုပြီးသောအစီအစဉ်\n'
              '📌 be going to + V1 → ကြိုတင်ရည်ရွယ်ချက် / မြင်နေရသော ခန့်မှန်းချက်\n'
              '📌 will + V1 → ချက်ချင်းဆုံးဖြတ်မှု / ကမ်းလှမ်းချက် / ကတိ',
              style: TextStyle(
                color: scheme.onPrimaryContainer,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  Quick Comparison Table
  // ─────────────────────────────────────────────
  Widget _buildQuickComparisonTable(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Card(
      color: scheme.onPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quick Comparison Table',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            // Header
            Row(
              children: [
                _tableHeader(context, 'Situation', flex: 3),
                _tableHeader(context, 'Structure', flex: 3),
                _tableHeader(context, 'မြန်မာ', flex: 3),
              ],
            ),
            const Divider(height: 8),
            ...future5SituationsTableRows.map(
              (r) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        r[0],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: scheme.primary,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 3),
                        decoration: BoxDecoration(
                          color: scheme.onPrimaryContainer.withAlpha(20),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          r[1],
                          style: TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 11,
                            color: scheme.onPrimaryContainer,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      flex: 3,
                      child: Text(
                        r[3],
                        style: const TextStyle(fontSize: 11),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tableHeader(BuildContext context, String label, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  Individual Situation Card
  // ─────────────────────────────────────────────
  Widget _buildSituationCard(
      Map<String, dynamic> data, BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final examples = data['examples'] as List<Map<String, dynamic>>;
    final situation = data['situation'] as String;

    // Colour coding by situation number
    final situationNumber =
        int.tryParse(situation.replaceAll(RegExp(r'[^0-9]'), '')) ?? 1;
    final Color badgeColor = _situationColor(situationNumber, scheme);
    final Color badgeTextColor = _situationTextColor(situationNumber, scheme);

    return Card(
      color: scheme.onPrimary,
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Situation Badge ──────────────────────────────
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: badgeColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    situation,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: badgeTextColor,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    data['title'],
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),

            // ── Burmese Title ──────────────────────────────
            Text(
              data['titleMm'],
              style: TextStyle(
                color: scheme.primary,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),

            // ── Formula chip ─────────────────────────────
            Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: scheme.onPrimaryContainer.withAlpha(22),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: scheme.onPrimaryContainer.withAlpha(60),
                ),
              ),
              child: Text(
                '${data['formula']}',
                style: TextStyle(
                  fontFamily: 'monospace',
                  fontWeight: FontWeight.bold,
                  color: scheme.onPrimaryContainer,
                  fontSize: 13,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // ── English Explanation ───────────────────────
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.info_outline, size: 16, color: scheme.primary),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    data['explanation'],
                    style: TextStyle(
                      fontSize: 12.5,
                      color: scheme.onSurfaceVariant,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // ── Burmese Description ───────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: scheme.secondaryContainer.withAlpha(80),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                data['desc'],
                style: TextStyle(
                  fontSize: 12.5,
                  color: scheme.onSecondaryContainer,
                  height: 1.6,
                ),
              ),
            ),
            const SizedBox(height: 8),

            // ── Tip ──────────────────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: scheme.tertiaryContainer.withAlpha(70),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                data['tip'],
                style: TextStyle(
                  fontSize: 12,
                  color: scheme.onTertiaryContainer,
                  height: 1.5,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),

            const Divider(height: 28),

            // ── Examples ─────────────────────────────────
            Text(
              'ဥပမာများ (Examples)',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: scheme.primary),
            ),
            const SizedBox(height: 10),
            ...examples.map((ex) => _buildExampleTile(ex, context)),
          ],
        ),
      ),
    );
  }

  Color _situationColor(int n, ColorScheme s) {
    switch (n) {
      case 1:
        return s.secondaryContainer;
      case 2:
        return s.tertiaryContainer;
      case 3:
        return s.primaryContainer;
      case 4:
        return const Color(0xFFFF8F00).withAlpha(35); // amber
      case 5:
        return s.errorContainer.withAlpha(120);
      default:
        return s.secondaryContainer;
    }
  }

  Color _situationTextColor(int n, ColorScheme s) {
    switch (n) {
      case 1:
        return s.onSecondaryContainer;
      case 2:
        return s.onTertiaryContainer;
      case 3:
        return s.onPrimaryContainer;
      case 4:
        return const Color(0xFFFF8F00);
      case 5:
        return s.onErrorContainer;
      default:
        return s.onSecondaryContainer;
    }
  }

  // ─────────────────────────────────────────────
  //  Example Sentence Tile
  // ─────────────────────────────────────────────
  Widget _buildExampleTile(
      Map<String, dynamic> ex, BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: scheme.onPrimary,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: scheme.outline.withAlpha(60)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // English sentence + TTS
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  ex['en'],
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    height: 1.4,
                  ),
                ),
              ),
              SpeakButton(text: ex['en']),
            ],
          ),
          const SizedBox(height: 6),

          // Breakdown (bracketed pattern highlighting)
          _buildBreakdown(ex['breakdown'], context),
          const SizedBox(height: 6),

          // Burmese translation
          Text(
            ex['mm'],
            style: TextStyle(
              color: scheme.onSurfaceVariant,
              fontSize: 13,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  Breakdown Text with highlighted [brackets]
  // ─────────────────────────────────────────────
  Widget _buildBreakdown(String breakdown, BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final spans = <InlineSpan>[];
    final regex = RegExp(r'\[([^\]]+)\]|([^\[]+)');
    for (final match in regex.allMatches(breakdown)) {
      if (match.group(1) != null) {
        // bracketed content → highlighted chip
        spans.add(
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
              decoration: BoxDecoration(
                color: scheme.primaryContainer,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                match.group(1)!,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: scheme.onPrimaryContainer,
                ),
              ),
            ),
          ),
        );
      } else if (match.group(2) != null) {
        spans.add(
          TextSpan(
            text: match.group(2),
            style: TextStyle(fontSize: 12, color: scheme.onSurfaceVariant),
          ),
        );
      }
    }
    return RichText(text: TextSpan(children: spans));
  }
}
