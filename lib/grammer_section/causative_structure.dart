import 'package:flutter/material.dart';
import 'package:perfect_english/data/causative_data.dart';
import 'package:perfect_english/widgets/speak_button.dart';
import 'quiz_lesson_page.dart';

/// CausativeStructure Screen
/// ─────────────────────────
/// Teaches the 6 causative verbs in English:
///   Active  : Let, Make, Have, Get, Help
///   Passive : Have/Get + Object + V3
///
/// Advanced section covers:
///   • Experiential causatives (accidents & misfortunes)
///   • Advanced verbs of influence (authorize, compel, prompt…)
///   • Emotional causatives (get + adjective)
///   • High-level passive causatives for abstract concepts
///
/// Each section shows:
///   • Burmese description of the concept
///   • Formula chip (highlighted)
///   • Usage note
///   • Labelled example sentences (with TTS)
///
/// A floating "Take a Quiz" button leads to QuizLessonPage.
class CausativeStructure extends StatelessWidget {
  const CausativeStructure({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Causative Structures')),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'causative-quiz',
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizLessonPage(
              quizData: causativeQuizData,
              tenseTitle: 'Causative Structures',
            ),
          ),
        ),
        label: const Text('Take a Quiz'),
        icon: const Icon(Icons.play_arrow),
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
          _buildComparisonTable(context),
          const SizedBox(height: 20),
          ...causativeData.map(
            (data) => _buildCausativeCard(data, context, level: 'basic'),
          ),

          // ── Advanced Section ─────────────────────────
          _buildSectionDivider(context),
          const SizedBox(height: 20),
          _buildAdvancedIntroCard(context),
          const SizedBox(height: 20),
          ...advancedCausativeData.map(
            (data) => _buildCausativeCard(data, context, level: 'advanced'),
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
                Text(
                  'Causative Verbs သဘောတရား',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: scheme.onPrimaryContainer,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Causative verbs ဟူသည် "တစ်ဦးတစ်ယောက်ကို တစ်ခုခုပြုလုပ်စေခြင်း" ကို '
              'ဖော်ပြသောကြိယာများဖြစ်သည်။ '
              'မြန်မာဘာသာဖြင့် "ခိုင်းစေသည်၊ ပြုလုပ်ခွင့်ပေးသည်၊ ကူညီသည်" '
              'ဟူ၍ ပြောဆိုနိုင်သည်။\n\n'
              'အဓိက Causative Verbs: '
              'LET · MAKE · HAVE · GET · HELP\n'
              'Passive Causative: HAVE/GET + Object + V3',
              style: TextStyle(color: scheme.onPrimaryContainer, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  Quick Comparison Table
  // ─────────────────────────────────────────────
  Widget _buildComparisonTable(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    const rows = [
      ['Let', 'Person + V1', 'ခွင့်ပြုသည်', 'Let me go.'],
      ['Make', 'Person + V1', 'အတင်းခိုင်းသည်', 'She made him cry.'],
      ['Have', 'Person + V1', 'တာဝန်ပေးသည်', 'I had him call you.'],
      ['Get', 'Person + to V1', 'ဆွဲဆောင်သည်', 'I got her to agree.'],
      ['Help', 'Person + (to) V1', 'ကူညီသည်', 'Help me carry this.'],
      ['Have/Get (Passive)', 'Object + V3', 'ခိုင်းခံရသည်', 'I got it fixed.'],
    ];

    return Card(
      color: Theme.of(context).colorScheme.onPrimary,
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
            // Header row
            Row(
              children: [
                _tableHeader(context, 'Verb', flex: 2),
                _tableHeader(context, 'Structure', flex: 3),
                _tableHeader(context, 'မြန်မာ', flex: 2),
              ],
            ),
            const Divider(height: 8),
            ...rows.map(
              (r) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        r[0],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: scheme.primary,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: scheme.onPrimaryContainer.withAlpha(20),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          r[1],
                          style: TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 12,
                            color: scheme.onPrimaryContainer,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 2,
                      child: Text(r[2], style: const TextStyle(fontSize: 12)),
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
  //  Individual Causative Card
  // ─────────────────────────────────────────────
  // ─────────────────────────────────────────────
  //  Advanced Section Divider Banner
  // ─────────────────────────────────────────────
  Widget _buildSectionDivider(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        Expanded(child: Divider(color: scheme.outline.withAlpha(80))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFFF8F00).withAlpha(22),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color(0xFFFF8F00).withAlpha(120),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.auto_awesome,
                  size: 14,
                  color: Color(0xFFFF8F00),
                ),
                const SizedBox(width: 6),
                Text(
                  'ADVANCED LEVEL',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFFF8F00),
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(child: Divider(color: scheme.outline.withAlpha(80))),
      ],
    );
  }

  // ─────────────────────────────────────────────
  //  Advanced Intro Card
  // ─────────────────────────────────────────────
  Widget _buildAdvancedIntroCard(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFFFF8F00).withAlpha(30),
            const Color(0xFFFF6F00).withAlpha(15),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFFF8F00).withAlpha(100)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.workspace_premium,
                  color: Color(0xFFFF8F00),
                  size: 22,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Advanced Causatives – Real-World Usage',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: const Color(0xFFFF8F00),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _advancedIntroPoint(
              context,
              Icons.warning_amber_rounded,
              'Accidents & Misfortunes',
              'Same Have/Get + Object + V3 formula — but now the subject is a '
                  'VICTIM, not the person in control. '
                  '(ခိုင်းသူမဟုတ်ဘဲ ကြုံတွေ့ခံစားလိုက်ရသူဖြစ်သည်)',
            ),
            _advancedIntroPoint(
              context,
              Icons.account_balance,
              'Formal Verbs of Influence',
              'Replace basic "make/have/get" with precise academic and business '
                  'verbs: authorize, compel, prompt, oblige, empower, provoke. '
                  '(တရားဝင်အသုံးအနှုန်း — formal English)',
            ),
            _advancedIntroPoint(
              context,
              Icons.psychology,
              'Emotional Causatives',
              'Use Get + Person + Adjective/V3 to describe psychological '
                  'impact — not just physical tasks. '
                  '(စိတ်ပိုင်းဆိုင်ရာ အကျိုးသက်ရောက်မှုကို ဖော်ပြသည်)',
            ),
            _advancedIntroPoint(
              context,
              Icons.business_center,
              'Abstract Passive Causatives',
              'In business writing, the "object" is no longer a physical thing — '
                  'it\'s a budget, a policy, or a deadline. '
                  '(ရုပ်ဝတ္ထုမဟုတ်သော အယူအဆများကို ခိုင်းစေသည်)',
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFFF8F00).withAlpha(18),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '💡  Pro Tip: Advanced causatives use the SAME structures as '
                'basic ones — what changes is the CONTEXT and VOCABULARY. '
                'Master the patterns below to sound like a native professional.\n'
                'Pro Tip: Advanced causative များသည် အခြေခံပုံစံတူပင်ဖြစ်သော်လည်း '
                'context နှင့် ဝေါဟာရရွေးချယ်မှုသာ ကွဲပြားသည်။',
                style: TextStyle(
                  fontSize: 12,
                  height: 1.6,
                  color: scheme.onSurface.withAlpha(200),
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _advancedIntroPoint(
    BuildContext context,
    IconData icon,
    String title,
    String body,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: const Color(0xFFFF8F00)),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style.copyWith(
                  fontSize: 12.5,
                  height: 1.5,
                ),
                children: [
                  TextSpan(
                    text: '$title  ',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF8F00),
                    ),
                  ),
                  TextSpan(text: body),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  Individual Causative Card
  // ─────────────────────────────────────────────
  Widget _buildCausativeCard(
    Map<String, dynamic> data,
    BuildContext context, {
    String level = 'basic',
  }) {
    final scheme = Theme.of(context).colorScheme;
    final examples = data['examples'] as List<Map<String, dynamic>>;
    final isPassive = (data['type'] as String).contains('Passive');
    final isAdvanced = level == 'advanced';
    final isExperiential =
        isAdvanced && (data['type'] as String).contains('Experiential');
    final isEmotional =
        isAdvanced && (data['type'] as String).contains('Emotional');
    final isInfluence =
        isAdvanced && (data['type'] as String).contains('Influence');
    final isAbstract =
        isAdvanced && (data['type'] as String).contains('Abstract');

    return Card(
      color: scheme.onPrimary,
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Type Badge ──────────────────────────────
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: isAdvanced
                        ? const Color(0xFFFF8F00).withAlpha(30)
                        : isPassive
                            ? scheme.tertiaryContainer
                            : scheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(20),
                    border: isAdvanced
                        ? Border.all(
                            color: const Color(0xFFFF8F00).withAlpha(160),
                          )
                        : null,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isAdvanced) ...[
                        const Icon(
                          Icons.auto_awesome,
                          size: 10,
                          color: Color(0xFFFF8F00),
                        ),
                        const SizedBox(width: 3),
                      ],
                      Text(
                        isAdvanced
                            ? isExperiential
                                ? 'EXPERIENTIAL'
                                : isEmotional
                                    ? 'EMOTIONAL'
                                    : isInfluence
                                        ? 'INFLUENCE'
                                        : isAbstract
                                            ? 'ABSTRACT'
                                            : 'ADVANCED'
                            : isPassive
                                ? 'PASSIVE'
                                : 'ACTIVE',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: isAdvanced
                              ? const Color(0xFFFF8F00)
                              : isPassive
                                  ? scheme.onTertiaryContainer
                                  : scheme.onSecondaryContainer,
                          letterSpacing: isAdvanced ? 0.8 : 0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    data['type'],
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // ── Burmese description ──────────────────────
            Text(
              data['desc'],
              style: TextStyle(
                color: scheme.onSurfaceVariant,
                fontSize: 13,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 12),

            // ── Formula chip ─────────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: scheme.onPrimaryContainer.withAlpha(22),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: scheme.onPrimaryContainer.withAlpha(60),
                ),
              ),
              child: Text(
                '📐  ${data['formula']}',
                style: TextStyle(
                  fontFamily: 'monospace',
                  fontWeight: FontWeight.bold,
                  color: scheme.onPrimaryContainer,
                  fontSize: 13,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // ── Usage note ────────────────────────────────
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.info_outline, size: 16, color: scheme.primary),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    data['usage'],
                    style: TextStyle(
                      fontSize: 12.5,
                      color: scheme.onSurfaceVariant,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),

            const Divider(height: 28),

            // ── Examples ─────────────────────────────────
            Text(
              'ဥပမာများ (Examples)',
              style: Theme.of(
                context,
              ).textTheme.labelLarge?.copyWith(color: scheme.primary),
            ),
            const SizedBox(height: 10),
            ...examples.map((ex) => _buildExampleTile(ex, context)),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  Example Sentence Tile
  // ─────────────────────────────────────────────
  Widget _buildExampleTile(Map<String, dynamic> ex, BuildContext context) {
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

          // Breakdown (bracketed pattern)
          _buildBreakdown(ex['breakdown'], context),
          const SizedBox(height: 6),

          // Burmese translation
          Row(
            children: [
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  ex['mm'],
                  style: TextStyle(
                    color: scheme.onSurfaceVariant,
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
              ),
            ],
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
    // Split on [ and ] to highlight causative verbs
    final regex = RegExp(r'\[([^\]]+)\]|([^\[]+)');
    for (final match in regex.allMatches(breakdown)) {
      if (match.group(1) != null) {
        // bracketed content → highlighted
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
