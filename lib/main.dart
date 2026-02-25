import 'package:flutter/material.dart';
import 'package:perfect_english/parts_of_speech.dart';
import 'package:perfect_english/progress_tracker.dart';
import 'package:perfect_english/sample_sentences.dart';

import 'certification/certification_quiz_screen.dart';
import 'examples_sentences.dart';
import 'grammer_section/grammer_hub.dart';
import 'splash_screen.dart';

void main() {
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
      themeMode: ThemeMode.light,
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
    textTheme: TextTheme(
      titleLarge: TextStyle(color: colorScheme.primary),
      titleMedium: TextStyle(color: colorScheme.primary),
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
    textTheme: TextTheme(
      titleLarge: TextStyle(color: colorScheme.primary),
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
      appBar: AppBar(
        title: const Text('Perfect English Learning'),
        actionsPadding: EdgeInsets.only(right: 16),
        actions: [Text("v0.01")],
      ),
      body: Column(
        children: [
          ListTile(
            title: Text("Parts Of Speech"),
            trailing: Icon(Icons.chevron_right),
            onTap: () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => PartOfSpeechs())),
          ),
          // ListTile(
          //   title: Text("Progress Tracker"),
          //   trailing: Icon(Icons.chevron_right),
          //   onTap: () => Navigator.of(
          //     context,
          //   ).push(MaterialPageRoute(builder: (context) => ProgressTracker())),
          // ),
          ListTile(
            title: Text("Example Sentences v1"),
            trailing: Icon(Icons.chevron_right),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => SampleSentencesExample()),
            ),
          ),
          ListTile(
            title: Text("Example Sentences v2"),
            trailing: Icon(Icons.chevron_right),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ExamplesSentences()),
            ),
          ),
          Divider(),
          ListTile(
            title: Text("Grammar Hub"),
            trailing: Icon(Icons.chevron_right),
            onTap: () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => GrammarHubScreen())),
          ),
          Divider(),
          ListTile(
            title: Text("Take Quiz To Get Certification"),
            trailing: Icon(Icons.chevron_right),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CertificationQuizScreen(),
              ),
            ),
          ),
          Spacer(),
          // powered by NaYa Group
          Container(
            margin: const EdgeInsets.all(16),
            child: RichText(
              text: TextSpan(
                text: 'Powered by ',
                style: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
                children: [
                  TextSpan(
                    text: 'NaYa Group',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
