/*

  Created by: Bakhromjon Polat
  Created on: May 14 2023 08:51:09
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/
import 'package:akrom_malik_flutter/screens/books/components/book_item.dart';
import 'package:flutter/material.dart';

class BooksPage extends StatelessWidget {
  const BooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        BookItem(),
      ],
    );
  }
}
