import 'package:akrom_malik_flutter/models/book/book.dart';
import 'package:flutter/material.dart';

class ReadingBookPage extends StatefulWidget {
  const ReadingBookPage({super.key});

  @override
  State<ReadingBookPage> createState() => _ReadingBookPageState();
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
            itemCount: 1,
            itemBuilder: (context, index) {
              Book book = Book();
              return Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            book.page.toString(),
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
                          book.content,
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
    List<String> elements = book.content.split('\n\n');
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
