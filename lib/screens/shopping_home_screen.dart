import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../models/offer.dart';
import '../models/product.dart';
import '../widgets/offer_list.dart';
import '../widgets/product_grid.dart';
import 'welcome_screen.dart';

class ShoppingHomeScreen extends StatelessWidget {
  const ShoppingHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    final products = [
      Product(
        title: loc.product1,
        image: 'https://picsum.photos/seed/prod1/300/200',
      ),
      Product(
        title: loc.product2,
        image: 'https://picsum.photos/seed/prod2/300/200',
      ),
      Product(
        title: loc.product3,
        image: 'https://picsum.photos/seed/prod3/300/200',
      ),
      Product(
        title: loc.product4,
        image: 'https://picsum.photos/seed/prod4/300/200',
      ),
      Product(
        title: loc.product5,
        image: 'https://picsum.photos/seed/prod5/300/200',
      ),
      Product(
        title: loc.product6,
        image: 'https://picsum.photos/seed/prod6/300/200',
      ),
    ];

    final offers = [
      Offer(
        title: loc.offer1Title,
        desc: loc.offer1Desc,
        image: 'https://picsum.photos/seed/offer1/400/150',
      ),
      Offer(
        title: loc.offer2Title,
        desc: loc.offer2Desc,
        image: 'https://picsum.photos/seed/offer2/400/150',
      ),
      Offer(
        title: loc.offer3Title,
        desc: loc.offer3Desc,
        image: 'https://picsum.photos/seed/offer3/400/150',
      ),
      Offer(
        title: loc.offer4Title,
        desc: loc.offer4Desc,
        image: 'https://picsum.photos/seed/offer4/400/150',
      ),
      Offer(
        title: loc.offer5Title,
        desc: loc.offer5Desc,
        image: 'https://picsum.photos/seed/offer5/400/150',
      ),
    ];

    void addToCart() {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(loc.addToCartMsg)));
    }

    void logout() {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const WelcomeScreen()),
        (route) => false,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.ourProducts),
        actions: [
          IconButton(
            onPressed: logout,
            icon: const Icon(Icons.logout),
            tooltip: loc.logout,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          // Featured
          SizedBox(
            height: 180,
            child: PageView.builder(
              itemCount: products.length,
              controller: PageController(viewportFraction: 0.9),
              itemBuilder: (_, i) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(products[i].image, fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          ProductGrid(products: products, onAddToCart: addToCart),
          const SizedBox(height: 16),

          Text(loc.hotOffers, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),

          OfferList(offers: offers),
        ],
      ),
    );
  }
}
