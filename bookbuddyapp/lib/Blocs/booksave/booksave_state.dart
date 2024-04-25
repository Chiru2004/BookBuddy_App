part of 'booksave_bloc.dart';

sealed class BooksaveState extends Equatable {
  const BooksaveState();
  
  @override
  List<Object> get props => [];
}

final class BooksaveInitial extends BooksaveState {}

class FetchBooksState extends BooksaveState{
  final List<BookShelfBook> books;
  const FetchBooksState(this.books);
}

class FetchingShelfBooksState extends BooksaveState {}

class NobooksSaved extends BooksaveState{}