import 'package:flutter/material.dart';
import 'package:perfect_english/parts_of_speech.dart';
import 'package:perfect_english/services/auth_service.dart';
import 'package:perfect_english/services/sound_service.dart';
import 'package:perfect_english/speaking/speaking_categories.dart';
import 'package:perfect_english/ui/auth_dialog.dart';
import 'package:perfect_english/widgets/app_drawer.dart';
import 'ai_conversation_simulator_screen.dart';
import 'ai_grammar_reviewer_screen.dart';
import 'pronounciation_practice_screen.dart';
import 'certification/certification_quiz_screen.dart';
import 'grammer_section/grammer_hub.dart';
import 'services/tts_download_notification_service.dart';
import 'splash_screen.dart';
import 'spoken_pattern/spoken_pattern_screen.dart';
import 'talk_to_me_screen.dart';
import 'widgets/naya_group.dart';

import 'package:sherpa_onnx/sherpa_onnx.dart' as sherpa;
import 'services/kokoro_tts_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Auth state
  await AuthService.instance.initialize();

  // Initialize notification service once at app start
  await TtsDownloadNotificationService.instance.initialize();

  //Initialize sherpa_onnx native libraries
  sherpa.initBindings();

  // Try to initialize TTS if model already downloaded (non-blocking)
  final tts = KokoroTtsService.instance;
  if (await tts.isModelDownloaded()) {
    await tts.initialize();
  }

  await SoundService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfect English',
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: buildLightTheme(),
      darkTheme: buildDarkTheme(),
    );
  }
}

ThemeData buildDarkTheme() {
  final colorScheme = ColorScheme.fromSeed(
    seedColor: Colors.green,
    brightness: Brightness.dark,
  );

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: colorScheme,
    appBarTheme: AppBarTheme(backgroundColor: colorScheme.onPrimary),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: colorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: colorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
    ),
    fontFamily: "Pyidaungsu",
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Colors.black87,
      contentTextStyle: TextStyle(color: Colors.green),
    ),
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(4),
      ),
      textStyle: const TextStyle(color: Colors.green),
    ),
  );
}

ThemeData buildLightTheme() {
  final colorScheme = ColorScheme.fromSeed(
    seedColor: Colors.green,
    brightness: Brightness.light,
  );
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: colorScheme,
    appBarTheme: AppBarTheme(backgroundColor: colorScheme.onPrimary),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: colorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: colorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
    ),
    fontFamily: "Pyidaungsu",
  );
}

class BaseApplication extends StatelessWidget {
  const BaseApplication({super.key});

  Future<void> _navigateToAiScreen(BuildContext context, Widget screen) async {
    if (!AuthService.instance.isLoggedIn) {
      final success = await AuthDialog.show(context);
      if (!success || !AuthService.instance.isLoggedIn) {
        return;
      }
    }
    if (context.mounted) {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => screen));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Perfect English'),
        actions: [
          ListenableBuilder(
            listenable: AuthService.instance,
            builder: (context, _) {
              final auth = AuthService.instance;
              if (auth.isLoggedIn) {
                return PopupMenuButton<String>(
                  icon: CircleAvatar(
                    radius: 14,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Text(
                      auth.userName[0].toUpperCase(),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                  onSelected: (value) async {
                    if (value == 'logout') {
                      await auth.logout();
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Logged out successfully'),
                          ),
                        );
                      }
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      enabled: false,
                      child: Text('Signed in as: ${auth.userName}'),
                    ),
                    const PopupMenuDivider(),
                    const PopupMenuItem(
                      value: 'logout',
                      child: Row(
                        children: [
                          Icon(Icons.logout, color: Colors.red, size: 18),
                          SizedBox(width: 8),
                          Text('Sign Out (အကောင့်ထွက်မည်)'),
                        ],
                      ),
                    ),
                  ],
                );
              }

              return TextButton.icon(
                onPressed: () => AuthDialog.show(context),
                icon: const Icon(Icons.login, size: 18),
                label: const Text("Sign In"),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: MediaQuery.sizeOf(context).width * 0.05,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                color: Theme.of(context).colorScheme.onPrimary,
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.grey.shade800),
                ),
                elevation: 0.0,
                child: ListTile(
                  title: Text(
                    "ဝါစင်္ဂ ၈ မျိုး (8 Parts Of Speech)",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PartOfSpeechs(),
                    ),
                  ),
                ),
              ),
              Card(
                color: Theme.of(context).colorScheme.onPrimary,
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.grey.shade800),
                ),
                elevation: 0.0,
                child: ListTile(
                  title: Text(
                    "သဒ္ဒါ (Grammar)",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const GrammarHubScreen(),
                    ),
                  ),
                ),
              ),
              Card(
                color: Theme.of(context).colorScheme.onPrimary,
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.grey.shade800),
                ),
                elevation: 0.0,
                child: ListTile(
                  title: Text(
                    "စကားပြောပုံစံများ (Spoken Patterns)",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SpokenPatternsScreen(),
                    ),
                  ),
                ),
              ),
              Card(
                color: Theme.of(context).colorScheme.onPrimary,
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.grey.shade800),
                ),
                elevation: 0.0,
                child: ListTile(
                  title: Text(
                    "မှတ်သားစရာများ (Speakings Essentials)",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SpeakingCategories(),
                    ),
                  ),
                ),
              ),
              Card(
                color: Theme.of(context).colorScheme.onPrimary,
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.grey.shade800),
                ),
                elevation: 0.0,
                child: ListTile(
                  title: Text(
                    "အောင်မှတ်လက်မှတ် စစ်ဆေးမှု (Certification Quiz)",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CertificationQuizScreen(),
                    ),
                  ),
                ),
              ),
              Card(
                color: Theme.of(context).colorScheme.onPrimary,
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.grey.shade800),
                ),
                elevation: 0.0,
                child: ListTile(
                  title: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Talk to me (Let's talk for 5 minutes.)",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Icon(
                        Icons.auto_awesome,
                        color: Colors.amber,
                        size: 18,
                      ),
                    ],
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () =>
                      _navigateToAiScreen(context, const TalkToMeScreen()),
                ),
              ),
              Card(
                color: Theme.of(context).colorScheme.onPrimary,
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.grey.shade800),
                ),
                elevation: 0.0,
                child: ListTile(
                  title: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "AI Conversation Simulator (Real Time Conversation with AI)",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      const Icon(
                        Icons.auto_awesome,
                        color: Colors.amber,
                        size: 18,
                      ),
                    ],
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _navigateToAiScreen(
                    context,
                    AiConversationSimulatorScreen(),
                  ),
                ),
              ),
              Card(
                color: Theme.of(context).colorScheme.onPrimary,
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.grey.shade800),
                ),
                elevation: 0.0,
                child: ListTile(
                  title: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Pronunciation Practice (Direct Speech-to-Text Practice)",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      const Icon(
                        Icons.auto_awesome,
                        color: Colors.amber,
                        size: 18,
                      ),
                    ],
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _navigateToAiScreen(
                    context,
                    const PronounciationPracticeScreen(),
                  ),
                ),
              ),
              Card(
                color: Theme.of(context).colorScheme.onPrimary,
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.grey.shade800),
                ),
                elevation: 0.0,
                child: ListTile(
                  title: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "AI Grammar Reviewer (Fix, Explain, Translate, and Suggest)",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      const Icon(
                        Icons.auto_awesome,
                        color: Colors.amber,
                        size: 18,
                      ),
                    ],
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _navigateToAiScreen(
                    context,
                    const AiGrammarReviewerScreen(),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const NayaGroup(),
            ],
          ),
        ),
      ),
    );
  }
}
