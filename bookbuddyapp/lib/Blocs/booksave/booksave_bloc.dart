import 'package:bloc/bloc.dart';
import 'package:bookbuddyapp/data/models/book.dart';
import 'package:bookbuddyapp/services/saveservice.dart';
import 'package:equatable/equatable.dart';

part 'booksave_event.dart';
part 'booksave_state.dart';

class BooksaveBloc extends Bloc<BooksaveEvent, BooksaveState> {

  final SaveShelf _saveservice;

  BooksaveBloc(this._saveservice) : super(BooksaveInitial()) {
   
    on<LoadBooksEvent>((event, emit) {
    emit(FetchingShelfBooksState());
    final books = _saveservice.getBooks();
    emit(FetchBooksState(books));
    });

    on<AddBookEvent>((event ,emit){
    _saveservice.addBooks(event.abook.title, event.abook.author, event.abook.description);
    add(LoadBooksEvent());
    });
  
   on<RemoveBookEvent>((event,emitter){
    _saveservice.removeBook(event.rbook.title, event.rbook.author, event.rbook.description);
    add(LoadBooksEvent());
   });

   on<IitializeEvent>((event,emitter) async{
   await _saveservice.init();
   add(LoadBooksEvent());
   });
  }
}
