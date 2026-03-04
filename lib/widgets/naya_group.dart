import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class NayaGroup extends StatelessWidget {
  const NayaGroup({super.key});

  @override
  Widget build(BuildContext context) {
    void _showLogo(BuildContext context) {
      showGeneralDialog(
        context: context,
        barrierLabel: "Logo",
        barrierDismissible: true,
        barrierColor: Colors.black54,
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (_, __, ___) {
          return Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Container(color: Colors.black26),
              ),
              Center(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: GestureDetector(
                      onTap: null,
                      child: Image.asset(
                        'assets/images/naya_cover.jpg',
                        width: MediaQuery.sizeOf(context).width * 0.8,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 25,
                right: 24,
                child: IconButton.outlined(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close,color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
            ],
          );
          return Center(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset('assets/images/naya_logo.jpg', width: 180),
            ),
          );
        },
        transitionBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutBack,
              ),
              child: child,
            ),
          );
        },
      );
    }

    return Container(
      margin: const EdgeInsets.all(16),
      child: RichText(
        text: TextSpan(
          text: 'Powered by ',
          style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
          children: [
            TextSpan(
              text: 'NaYa Group',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => _showLogo(context),
            ),
          ],
        ),
      ),
    );
  }
}
