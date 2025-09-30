import 'package:flutter/material.dart';

import '../models/offer.dart';

class OfferList extends StatelessWidget {
  final List<Offer> offers;

  const OfferList({super.key, required this.offers});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: offers
          .map(
            (o) => Card(
              child: ListTile(
                leading: Image.network(o.image, width: 80, fit: BoxFit.cover),
                title: Text(o.title),
                subtitle: Text(o.desc),
              ),
            ),
          )
          .toList(),
    );
  }
}
