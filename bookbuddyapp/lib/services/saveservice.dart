import 'package:hive/hive.dart';
import 'package:bookbuddyapp/data/models/book.dart';

class SaveShelf {
  late Box<BookShelfBook> _savedbooks;
  Future<void> init() async {
    Hive.registerAdapter(BookShelfBookAdapter());
    _savedbooks = await Hive.openBox<BookShelfBook>('books');

    //_savedbooks.add(BookShelfBook("1st Book", "Myself", "Was having fun"));
  }

  List<BookShelfBook> getBooks() {
    final savedbooks = _savedbooks.values.where((element) => true).toList();
    return savedbooks;
  }

  void addBooks(
      final String title, final String author, final String description) async {
    _savedbooks.add(BookShelfBook(title, author, description));
  }

  Future<void> removeBook(
      final String title, final String author, final String description) async {
    final booktoremove = _savedbooks.values.firstWhere((element) =>
        element.title == title &&
        element.author == author &&
        element.description == description);
    await booktoremove.delete();
  }
}
