import 'package:akrom_malik_flutter/data/warrior.dart';
import 'package:akrom_malik_flutter/models/book_model.dart';
import 'package:akrom_malik_flutter/screens/reading/read_book.dart';
import 'package:flutter/material.dart';

_getBook(BuildContext context) => GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 237, 223, 169),
            borderRadius: BorderRadius.circular(16.0),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://i.pinimg.com/736x/63/af/d9/63afd9e7ca7ccb22c855e46270d01c93.jpg"))),
        child: Column(
          children: [
            Text(
              "AKROM MALIK",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text(
              "Jangchi",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32.0,
                  color: Colors.white),
            ),
            Text(
              "Tarixiy-Badiiy qissa",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  color: Colors.white),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return ReadingBookPage();
        }));
      },
    );

Container getBookPage(BuildContext context) => Container(
        child: GridView.count(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      crossAxisCount: 2,
      childAspectRatio: 0.8,
      children: [
        _getBook(context),
      ],
    ));
