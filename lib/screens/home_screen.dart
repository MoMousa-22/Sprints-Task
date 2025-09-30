import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../main.dart';
import 'welcome_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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

  void _logout(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const WelcomeScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.ourProducts),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: PageView(
              children: [
                Image.network("https://via.placeholder.com/300x200"),
                Image.network("https://via.placeholder.com/300x200"),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              children: List.generate(4, (index) {
                return Card(
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.network("https://via.placeholder.com/150"),
                      ),
                      Text("Product ${index + 1}"),
                      IconButton(
                        icon: const Icon(Icons.add_shopping_cart),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(loc.addToCartMsg)),
                          );
                        },
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
          Text(
            loc.hotOffers,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (ctx, i) => ListTile(
                leading: const Icon(Icons.local_offer),
                title: Text("${loc.hotOffers} ${i + 1}"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
