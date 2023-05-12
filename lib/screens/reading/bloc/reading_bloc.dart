import 'dart:convert';

import 'package:akrom_malik_flutter/models/book/book.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reading_event.dart';
part 'reading_state.dart';
part 'reading_bloc.freezed.dart';

class ReadingBloc extends Bloc<ReadingEvent, ReadingState> {
  ReadingBloc() : super(ReadingState.initial()) {
    on<ReadingEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final bookData = await rootBundle.load(event.name);
      final decoded = utf8.decode(bookData.buffer.asUint8List());
      final book = Book(
        content: decoded,
        id: '1',
        page: 12,
      );

      emit(state.copyWith(book: book, isLoading: false));
    });
  }
}
