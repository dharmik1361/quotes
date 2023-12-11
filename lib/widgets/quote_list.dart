import 'package:flutter/material.dart';
import 'package:quotes/constant/routes.dart';
import 'package:quotes/modal/quote_modal.dart';

class QuoteList extends StatelessWidget {
  const QuoteList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: quotes.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return Card(
          elevation: 5,
          margin: const EdgeInsets.only(bottom: 10),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, editScreen, arguments: index);
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.all(10),
                      child: Text(quotes[index].quotes,
                          maxLines: 4, style: const TextStyle(fontSize: 20))),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        quotes[index].quotesWriter,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
