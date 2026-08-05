import 'package:flutter/material.dart';
import 'package:perfect_english/services/auth_service.dart';

class AuthDialog extends StatefulWidget {
  const AuthDialog({super.key});

  /// Shows the AuthDialog as a Modal Bottom Sheet.
  /// Returns `true` if authentication succeeded, `false` otherwise.
  static Future<bool> show(BuildContext context) async {
    final result = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const AuthDialog(),
    );
    return result ?? false;
  }

  @override
  State<AuthDialog> createState() => _AuthDialogState();
}

class _AuthDialogState extends State<AuthDialog> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Login Form
  final _loginEmailController = TextEditingController();
  final _loginPasswordController = TextEditingController();
  bool _loginLoading = false;
  String? _loginError;

  // Register Form
  final _regNameController = TextEditingController();
  final _regEmailController = TextEditingController();
  final _regPasswordController = TextEditingController();
  bool _regLoading = false;
  String? _regError;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _loginEmailController.dispose();
    _loginPasswordController.dispose();
    _regNameController.dispose();
    _regEmailController.dispose();
    _regPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    final email = _loginEmailController.text.trim();
    final password = _loginPasswordController.text;

    if (email.isEmpty || password.isEmpty) {
      setState(() => _loginError = 'ကျေးဇူးပြု၍ အီးမေးလ်နှင့် စကားဝှက် ထည့်သွင်းပါ။ (Please enter email & password)');
      return;
    }

    setState(() {
      _loginLoading = true;
      _loginError = null;
    });

    final res = await AuthService.instance.login(email: email, password: password);

    if (!mounted) return;
    setState(() => _loginLoading = false);

    if (res['success'] == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('အကောင့်ဝင်ရောက်မှု အောင်မြင်ပါသည်။ (Login successful!)'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.of(context).pop(true);
    } else {
      setState(() => _loginError = res['error'] as String? ?? 'Login failed');
    }
  }

  Future<void> _handleRegister() async {
    final name = _regNameController.text.trim();
    final email = _regEmailController.text.trim();
    final password = _regPasswordController.text;

    if (email.isEmpty || password.isEmpty) {
      setState(() => _regError = 'ကျေးဇူးပြု၍ အီးမေးလ်နှင့် စကားဝှက် ထည့်သွင်းပါ။ (Please enter email & password)');
      return;
    }

    if (password.length < 6) {
      setState(() => _regError = 'စကားဝှက်သည် အနည်းဆုံး ၆ လုံး ရှိရပါမည်။ (Password must be at least 6 characters)');
      return;
    }

    setState(() {
      _regLoading = true;
      _regError = null;
    });

    final res = await AuthService.instance.register(
      email: email,
      password: password,
      name: name.isNotEmpty ? name : null,
    );

    if (!mounted) return;
    setState(() => _regLoading = false);

    if (res['success'] == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('အကောင့်သစ် ပြုလုပ်ခြင်း အောင်မြင်ပါသည်။ (Registration successful!)'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.of(context).pop(true);
    } else {
      setState(() => _regError = res['error'] as String? ?? 'Registration failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      margin: EdgeInsets.only(top: 60, bottom: bottomInset),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Handle bar
                Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),

                // Title Banner
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.auto_awesome, color: theme.colorScheme.primary),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "AI Features Sign In",
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "AI ဝန်ဆောင်မှုများ အသုံးပြုရန် အကောင့်ဝင်ပါ",
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(false),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Tab Bar
                TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(text: "Sign In (အကောင့်ဝင်ရန်)"),
                    Tab(text: "Register (အကောင့်သစ်)"),
                  ],
                ),
                const SizedBox(height: 16),

                // Tab Views
                SizedBox(
                  height: 330,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildLoginForm(theme),
                      _buildRegisterForm(theme),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_loginError != null)
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.red.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.red.shade300),
            ),
            child: Row(
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    _loginError!,
                    style: const TextStyle(color: Colors.red, fontSize: 13),
                  ),
                ),
              ],
            ),
          ),

        TextField(
          controller: _loginEmailController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            labelText: 'Email Address (အီးမေးလ်)',
            prefixIcon: Icon(Icons.email_outlined),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 14),

        TextField(
          controller: _loginPasswordController,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'Password (စကားဝှက်)',
            prefixIcon: Icon(Icons.lock_outline),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 24),

        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: theme.colorScheme.onPrimary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            onPressed: _loginLoading ? null : _handleLogin,
            icon: _loginLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                  )
                : const Icon(Icons.login),
            label: Text(
              _loginLoading ? "Signing in..." : "Sign In (အကောင့်ဝင်မည်)",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterForm(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_regError != null)
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.red.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.red.shade300),
            ),
            child: Row(
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    _regError!,
                    style: const TextStyle(color: Colors.red, fontSize: 13),
                  ),
                ),
              ],
            ),
          ),

        TextField(
          controller: _regNameController,
          decoration: const InputDecoration(
            labelText: 'Full Name (အမည် - optional)',
            prefixIcon: Icon(Icons.person_outline),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),

        TextField(
          controller: _regEmailController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            labelText: 'Email Address (အီးမေးလ်)',
            prefixIcon: Icon(Icons.email_outlined),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),

        TextField(
          controller: _regPasswordController,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'Password (စကားဝှက် - အနည်းဆုံး ၆ လုံး)',
            prefixIcon: Icon(Icons.lock_outline),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),

        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: theme.colorScheme.onPrimary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            onPressed: _regLoading ? null : _handleRegister,
            icon: _regLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                  )
                : const Icon(Icons.person_add_outlined),
            label: Text(
              _regLoading ? "Registering..." : "Create Account (အကောင့်ပြုလုပ်မည်)",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
