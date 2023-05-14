/*

  Created by: Bakhromjon Polat
  Created on: May 12 2023 23:40:58
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:akrom_malik_flutter/models/book/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart' as parser;

import 'bloc/reading_bloc.dart';

class ReadingBookScreen extends StatefulWidget {
  const ReadingBookScreen({super.key});

  @override
  State<ReadingBookScreen> createState() => _ReadingBookScreenState();
}

class _ReadingBookScreenState extends State<ReadingBookScreen> {
  List<String> _pages = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<ReadingBloc, ReadingState>(
        listener: (context, state) {
          loadBook(state.book);
        },
        builder: (context, state) {
          return PageView.builder(
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              final content = _pages[index];
              return Card(
                margin: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 24.0),
                child: Html(
                  data: content,
                  style: {
                    'body': Style(fontSize: const FontSize(20)),
                    'section': Style(
                      alignment: Alignment.center,
                      fontSize: FontSize(24.0),
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w600,
                    )
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<ReadingBloc>(context).add(
            ReadingEvent.started('books/warrior.html'),
          );
        },
      ),
    );
  }

  void loadBook(Book book) {
    final document = parser.parse(book.content);
    final elements = document.body?.children;
    String text = '';

    for (final element in elements!) {
      final tag = element.localName;
      text += '<$tag>${element.text}</$tag>\n';
    }
    setState(() {
      _pages = _divideTextIntoPages(text, 20);
    });
  }

  List<String> _divideTextIntoPages(String text, double fontSize) {
    // Calculate the available width and height
    final queryData = MediaQuery.of(context);
    final availableWidth = queryData.size.width - 64.0;
    final availableHeight = queryData.size.height;
    print('$availableWidth X $availableHeight');

    final textStyle =
        DefaultTextStyle.of(context).style.copyWith(fontSize: fontSize);
    final textSpan = TextSpan(text: 'A', style: textStyle);
    final textPainter =
        TextPainter(text: textSpan, textDirection: TextDirection.ltr);
    textPainter.layout();
    final charWidth = textPainter.width;
    final charsPerLine = (availableWidth / charWidth).floor();

    // Calculate the number of lines per page
    final lineHeight = textPainter.height;
    final linesPerPage = (availableHeight / lineHeight).floor();
    List<String> pages = [];
    print('Line Height: $lineHeight');
    print('Line per page: $linesPerPage');

    var currentPageText = '';

    var lines = text.split('\n');
    final regex = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    for (var line in lines) {
      int len = line.replaceAll(regex, '').length;
      if (currentPageText.length + len < linesPerPage * charsPerLine) {
        currentPageText += '$line\n';
      } else {
        pages.add(currentPageText);
        currentPageText = '$line\n';
      }
    }

    pages.add(currentPageText);

    return pages;
  }
}
