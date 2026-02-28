import 'package:flutter/material.dart';
import 'package:perfect_english/parts_of_speech.dart';
import 'package:perfect_english/services/sound_service.dart';
import 'package:perfect_english/widgets/app_drawer.dart';
import 'certification/certification_quiz_screen.dart';
import 'grammer_section/grammer_hub.dart';
import 'splash_screen.dart';
import 'widgets/naya_group.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.onPrimary,
      // foregroundColor: Colors.white,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: colorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: colorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
      // ...
    ),
    // ...
    fontFamily: "Pyidaungsu",
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Colors.black87,
      contentTextStyle: TextStyle(color: Colors.green),
    ),
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(4),
      ),
      textStyle: TextStyle(color: Colors.green),
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
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.onPrimary,
      // foregroundColor: Colors.amber,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: colorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: colorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
      // ...
    ),
    fontFamily: "Pyidaungsu",
  );
}

class BaseApplication extends StatelessWidget {
  const BaseApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text('Perfect English'),
        actionsPadding: EdgeInsets.only(
          right: MediaQuery.sizeOf(context).width * 0.05,
        ),
        actions: [Text("v1.0.0")],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: MediaQuery.sizeOf(context).width * 0.05,
        ),
        child: Column(
          children: [
            ListTile(
              title: Text(
                "ဝါစင်္ဂ ၈ မျိုး (8 Parts Of Speech)",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => PartOfSpeechs())),
            ),
            Divider(height: 0.1, color: Colors.grey.shade800),
            ListTile(
              title: Text(
                "သဒ္ဒါ (Grammar)",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => GrammarHubScreen()),
              ),
            ),
            // Divider(height: 0.1),
            Divider(height: 0.1, color: Colors.grey.shade800),

            ListTile(
              title: Text(
                "အောင်မှတ်လက်မှတ် စစ်ဆေးမှု (Certification Quiz)",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CertificationQuizScreen(),
                ),
              ),
            ),
            // Divider(height: 0.1),
            Divider(height: 0.1, color: Colors.grey.shade800),

            Spacer(),
            NayaGroup(),
          ],
        ),
      ),
    );
  }
}
