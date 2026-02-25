import 'dart:async';

import 'package:flutter/material.dart';
import 'package:perfect_english/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<double> _scale;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void delayAndNavigateHomeScreen() {
    _timer = Timer.periodic(
      const Duration(milliseconds: 1500),
      (timer) => Navigator.of(
        context,
        // ).pushNamedAndRemoveUntil(RouteNames.app, (route) => false),
      ).push(MaterialPageRoute(builder: (context) => BaseApplication())),
    );
  }

  @override
  void initState() {
    super.initState();
    // delayAndNavigateHomeScreen();

    /// Animation Setup
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _scale = Tween<double>(
      begin: 0.85,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _controller.forward();

    /// Navigate based on token existence

    Future.delayed(const Duration(seconds: 3), () async {
      if (!mounted) return;

      // final token = await SharePreference.instance.getString(Env.accessToken);
      //
      // if (!mounted) {
      //   return;
      // }
      //
      // if (token != null) {
      //   context.pushNamedAndRemoveUntil(RouteNames.app, (_) => false);
      // } else {
      //   context.pushNamedAndRemoveUntil(RouteNames.loginScreen, (_) => false);
      // }
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => BaseApplication()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _fade,
          child: ScaleTransition(
            scale: _scale,
            child: Text(
              "NaYa Group",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w900,
                color: Colors.blue.shade900,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
