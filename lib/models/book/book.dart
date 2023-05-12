/*

  Created by: Bakhromjon Polat
  Created on: May 12 2023 23:44:09
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:freezed_annotation/freezed_annotation.dart';
part 'book.freezed.dart';

@freezed
class Book with _$Book {
  const factory Book({
    @Default('') String id,
    @Default('') String content,
    @Default(0) int page,
  }) = _Book;
}
