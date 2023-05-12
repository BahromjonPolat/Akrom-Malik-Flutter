part of 'reading_bloc.dart';

@freezed
class ReadingState with _$ReadingState {
  const factory ReadingState({
    required Book book,
    required bool isLoading,
  }) = _ReadingState;
  factory ReadingState.initial() => ReadingState(
        book: Book(),
        isLoading: false,
      );
}
