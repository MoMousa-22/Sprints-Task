import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductGrid extends StatelessWidget {
  final List<Product> products;
  final VoidCallback onAddToCart;

  const ProductGrid({
    super.key,
    required this.products,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: .8,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (_, i) {
        final p = products[i];
        return Card(
          child: Column(
            children: [
              Expanded(child: Image.network(p.image, fit: BoxFit.cover)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(child: Text(p.title)),
                    IconButton(
                      onPressed: onAddToCart,
                      icon: const Icon(Icons.add_shopping_cart),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
