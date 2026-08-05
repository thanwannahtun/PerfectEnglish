import 'package:flutter/material.dart';
import 'package:perfect_english/services/auth_service.dart';
import 'package:perfect_english/ui/auth_dialog.dart';
import 'package:perfect_english/ui/screens/feedback_screen.dart';
import 'package:perfect_english/ui/screens/need_custom_app_screen.dart';
import 'package:perfect_english/ui/screens/privacy_screen.dart';
import 'tts_settings_page.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Drawer(
      child: ListenableBuilder(
        listenable: AuthService.instance,
        builder: (context, _) {
          final auth = AuthService.instance;
          final isLoggedIn = auth.isLoggedIn;

          return ListView(
            padding: EdgeInsets.zero,
            children: [
              // User Account / Brand Header
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  image: const DecorationImage(
                    image: AssetImage('assets/images/perfect_english_logo.png'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black38,
                      BlendMode.darken,
                    ),
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: theme.colorScheme.primary,
                  child: Text(
                    isLoggedIn ? auth.userName[0].toUpperCase() : 'G',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
                accountName: Text(
                  isLoggedIn ? auth.userName : 'Guest User (ဧည့်သည်)',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [Shadow(color: Colors.black, blurRadius: 4)],
                  ),
                ),
                accountEmail: Text(
                  isLoggedIn ? auth.userEmail : 'Sign in to unlock AI features',
                  style: const TextStyle(
                    color: Colors.white70,
                    shadows: [Shadow(color: Colors.black, blurRadius: 4)],
                  ),
                ),
              ),

              // Auth Action Tile
              if (!isLoggedIn)
                ListTile(
                  leading: const Icon(Icons.auto_awesome, color: Colors.amber),
                  title: const Text(
                    'Sign In / Register (အကောင့်ဝင်ရန်)',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text('Unlock AI features & track progress'),
                  onTap: () {
                    Navigator.pop(context);
                    AuthDialog.show(context);
                  },
                )
              else
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.redAccent),
                  title: const Text(
                    'Sign Out (အကောင့်ထွက်မည်)',
                    style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
                  ),
                  onTap: () async {
                    Navigator.pop(context);
                    await AuthService.instance.logout();
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Logged out successfully')),
                      );
                    }
                  },
                ),

              const Divider(),

              ...List.generate(destinations.length, (index) {
                final dest = destinations[index];
                return ListTile(
                  leading: Icon(
                    dest.icon,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  title: Text(
                    dest.label,
                    style: theme.textTheme.bodyMedium,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => dest.routeName),
                    );
                  },
                );
              }),
            ],
          );
        },
      ),
    );
  }
}

class Destination {
  const Destination(
    this.icon,
    this.label,
    this.selectedIcon, {
    required this.routeName,
  });

  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final Widget routeName;
}

const List<Destination> destinations = <Destination>[
  Destination(
    Icons.tune,
    'Tts Settings',
    Icons.tune,
    routeName: TtsSettingsPage(),
  ),
  Destination(
    Icons.privacy_tip_outlined,
    'Privacy',
    Icons.privacy_tip,
    routeName: PrivacyScreen(),
  ),
  Destination(
    Icons.feedback_outlined,
    'Feedback',
    Icons.feedback_rounded,
    routeName: FeedbackScreen(),
  ),
  Destination(
    Icons.app_shortcut_outlined,
    'Need Custom App',
    Icons.app_shortcut_rounded,
    routeName: NeedCustomAppScreen(),
  ),
];
