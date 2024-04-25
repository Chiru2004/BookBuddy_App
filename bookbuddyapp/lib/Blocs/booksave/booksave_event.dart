part of 'booksave_bloc.dart';

sealed class BooksaveEvent extends Equatable {
  const BooksaveEvent();

  @override
  List<Object> get props => [];
}

class LoadBooksEvent extends BooksaveEvent{ 
 const LoadBooksEvent();
  @override
  List<Object> get props => [];
}

class AddBookEvent extends BooksaveEvent{

  final BookShelfBook abook;
 const  AddBookEvent(this.abook);
}

class RemoveBookEvent extends BooksaveEvent{

  final BookShelfBook rbook;
  const RemoveBookEvent(this.rbook);

}
class IitializeEvent extends BooksaveEvent{}