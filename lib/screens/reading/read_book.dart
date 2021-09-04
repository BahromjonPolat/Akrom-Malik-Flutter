import 'package:akrom_malik_flutter/data/warrior.dart';
import 'package:akrom_malik_flutter/models/book_model.dart';
import 'package:flutter/material.dart';

class ReadingBookPage extends StatefulWidget {
  @override
  _ReadingBookPageState createState() => _ReadingBookPageState();
}

class _ReadingBookPageState extends State<ReadingBookPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _reedBook(),
      ),
    );
  }

  _reedBook() => Container(
        color: Color.fromARGB(255, 240, 230, 192),
        child: PageView.builder(
            itemCount: bookWarrior.length,
            itemBuilder: (context, index) {
              Book book = bookWarrior[index];
              return Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          book.page,
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          book.body,
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      );
}
