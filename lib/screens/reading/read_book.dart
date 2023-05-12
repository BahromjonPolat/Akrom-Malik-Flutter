import 'dart:io';

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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            StringBuffer buffer = StringBuffer();
            for (var i = 0; i < bookWarrior.length; i++) {
              final book = bookWarrior[i];
              buffer.write(_bookToFile(book));
            }
            final body = """
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>Jangchi</title>
</head>
<body>
    
    ${buffer.toString()}
</body>
</html>

""";

            final file = File('./books/warrior.html');
            await file.writeAsString(body);
          },
        ),
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
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            book.page,
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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

  String _bookToFile(Book book) {
    List<String> elements = book.body.split('\n\n');
    StringBuffer buffer = StringBuffer();
    for (var e in elements) {
      buffer.write('<p>$e</p>\n');
    }
    return """

    <section style="text-align: center; font-size: 18pt; font-weight: 600;">${book.page}</section>

    ${buffer.toString()}

""";
  }
}
