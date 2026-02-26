import 'package:flutter/material.dart';
import 'package:perfect_english/ui/screens/feedback_screen.dart';
import 'package:perfect_english/ui/screens/need_custom_app_screen.dart';
import 'package:perfect_english/ui/screens/privacy_screen.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ///
          DrawerHeader(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/perfect_english_logo.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: SizedBox(),
          ),

          ...List.generate(destinations.length, (index) {
            final dest = destinations[index];
            // final isSelected = index == widget.selectedDestinationIndex;
            final isSelected = false;
            return ListTile(
              leading: Icon(
                dest.icon,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              title: Text(
                dest.label,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              selected: isSelected,
              selectedColor: Theme.of(context).colorScheme.primary,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => dest.routeName),
                );
              },
              selectedTileColor: Theme.of(context).colorScheme.onSecondary,
            );
          }),
        ],
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
