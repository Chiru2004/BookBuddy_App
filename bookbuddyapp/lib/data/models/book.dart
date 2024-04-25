import 'package:hive/hive.dart';


part 'book.g.dart';

@HiveType(typeId: 0)
class BookShelfBook extends HiveObject{
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String author;
  @HiveField(2)
  final String description; 

  BookShelfBook(this.title,this.author,this.description);
}