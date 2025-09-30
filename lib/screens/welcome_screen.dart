import 'package:flutter/material.dart';
import 'package:sprints_task/screens/signin_screen.dart';
import 'package:sprints_task/screens/signup_screen.dart';

import '../l10n/app_localizations.dart';
import '../main.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void _changeLanguage(BuildContext context) {
    final locale = Localizations.localeOf(context);
    Locale newLocale;

    if (locale.languageCode == 'en') {
      newLocale = const Locale('ar');
    } else {
      newLocale = const Locale('en');
    }

    MyApp.setLocale(context, newLocale);
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          loc.appTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () => _changeLanguage(context),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/friendship.png",
                  width: 120,
                  height: 120,
                ),
                const SizedBox(width: 20),
                Image.network(
                  "https://picsum.photos/200/200",
                  width: 120,
                  height: 120,
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              loc.appTitle,
              style: const TextStyle(
                fontFamily: 'Suwannaphum',
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SignUpScreen()),
                );
              },
              child: Text(loc.signUp),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SignInScreen()),
                );
              },
              child: Text(loc.signIn),
            ),
          ],
        ),
      ),
    );
  }
}
