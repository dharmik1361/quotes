import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes/modal/quote_modal.dart';
import 'package:quotes/provider/quote_provider.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Make your quotes'),
        actions: [
          Consumer<QuoteProvider>(
            builder: (context, value, child) => IconButton(
                onPressed: () {
                  value.resetAll();
                },
                icon: const Icon(Icons.restart_alt)),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Consumer<QuoteProvider>(
              builder: (context, value, child) => RepaintBoundary(
                key: value.repaintBoundary,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 10,
                  child: Container(
                    height: 400,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: value.chooseBgColor,
                      image: DecorationImage(
                        image: NetworkImage(value.chooseImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Text(
                      quotes[index].quotes,
                      style: TextStyle(
                        fontSize: 24,
                        color: value.chooseColor,
                        fontFamily: value.chooseFontFamily,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Change Font Color",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Card(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: Colors.primaries.map(
                    (e) {
                      return Consumer<QuoteProvider>(
                          builder: (context, value, child) {
                        return InkWell(
                          onTap: () {
                            value.changeColor(e);
                          },
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: e,
                            ),
                          ),
                        );
                      });
                    },
                  ).toList(),
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "Change Background Color",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Card(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: Colors.accents.map(
                    (e) {
                      return Consumer<QuoteProvider>(
                          builder: (context, value, child) {
                        return InkWell(
                          onTap: () {
                            value.changeBgColor(e);
                          },
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: e,
                            ),
                          ),
                        );
                      });
                    },
                  ).toList(),
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "Change Font Family",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Card(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Consumer<QuoteProvider>(
                  builder: (context, value, child) => Row(
                    mainAxisSize: MainAxisSize.max,
                    children: value.family.map(
                      (e) {
                        return InkWell(
                          onTap: () {
                            value.changeFontFamily(e.fontFamily!);
                          },
                          child: Card(
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              height: 80,
                              width: 80,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "Aa",
                                style: e,
                              ),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Change Background Image",
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 12),
            Card(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Consumer<QuoteProvider>(
                  builder: (context, value, child) => Row(
                    mainAxisSize: MainAxisSize.max,
                    children: value.img.map(
                      (e) {
                        return InkWell(
                          onTap: () {
                            value.changeBgImage(e);
                          },
                          child: Card(
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: NetworkImage(e),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Consumer<QuoteProvider>(
        builder: (context, value, child) =>
        FloatingActionButton(
          onPressed: () {
            value.shareImage();
          },
          child: const Icon(Icons.ios_share_outlined),
        ),
      ),
    );
  }
}
