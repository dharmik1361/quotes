import 'package:flutter/material.dart';
import 'package:quotes/constant/routes.dart';

import '../modal/quote_modal.dart';

class QuoteGrid extends StatelessWidget {
  const QuoteGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: quotes.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 0.8),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () =>
              Navigator.pushNamed(context, editScreen, arguments: index),
          child: Card(
            elevation: 5,
            shadowColor: Colors.grey,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(quotes[index].quotes,
                      style: const TextStyle(
                        fontSize: 15,
                        // fontWeight: FontWeight.bold,
                      )),
                  Text(quotes[index].quotesWriter,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
